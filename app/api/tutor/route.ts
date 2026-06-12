import { NextResponse } from 'next/server';

export async function POST(req: Request) {
  try {
    const { questionText, userCode, errorMessage, chatHistory } = await req.json();

    const headerKey = req.headers.get('x-gemini-key');
    const apiKey = headerKey || process.env.GEMINI_API_KEY;
    if (!apiKey) {
      return NextResponse.json(
        { error: 'Gemini API key is missing. Please connect your API key in the AI Tutor panel.' },
        { status: 400 }
      );
    }

    // 1. Framing the Tutor Persona using System Instructions
    const systemInstruction = `
You are "Mano AI", a highly encouraging, friendly, and expert Python tutor for the Manodemy Data Analytics course.
The student is currently trying to solve the following question:
"${questionText}"

Their active code in the editor is:
\`\`\`python
${userCode || '# No code written yet'}
\`\`\`

${errorMessage ? `Their code currently throws the following execution output/error:\n"${errorMessage}"` : 'Their code has no active runtime errors.'}

STRICT TUTORING GUIDELINES:
1. Do NOT write or provide the full correct Python solution code. However, you are allowed to provide at most one line of code (representing the immediate next step or next line of code) if the student is completely stuck or asks for help writing the code.
2. Adopt a Socratic teaching method. Highlight syntax errors, logic flaws, or index offsets and ask questions that lead the student to find the rest of the answer themselves.
3. Be concise and conversational. Keep responses under three paragraphs.
4. Format your advice in clean Markdown. Use code snippets only to demonstrate patterns or concepts, or to give the one allowed next line of code.
    `.trim();

    // 2. Map chat history from frontend format to Gemini API requirements
    // The Gemini conversation history must start with the 'user' role. We slice out
    // the static welcome greeting (at index 0) so the first sent turn is always 'user'.
    const apiHistory = Array.isArray(chatHistory) && chatHistory.length > 1 ? chatHistory.slice(1) : [];

    const formattedContents = apiHistory.map((msg: any) => ({
      role: msg.role === 'model' ? 'model' : 'user',
      parts: [{ text: msg.text }]
    }));

        // 3. Contact Gemini 2.0 Flash API with System Instruction in request body
    const targetUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`;
    
    const response = await fetch(targetUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        contents: formattedContents,
        systemInstruction: {
          parts: [{ text: systemInstruction }]
        },
        generationConfig: {
          temperature: 0.5,
          maxOutputTokens: 800,
        }
      }),
    });

    if (!response.ok) {
      const errText = await response.text();
      console.error('Gemini API call failed:', errText);
      return NextResponse.json({ error: 'Failed to contact the AI model' }, { status: 502 });
    }

    const result = await response.json();
    const replyText = result.candidates?.[0]?.content?.parts?.[0]?.text || 
      "I'm sorry, I couldn't process the explanation. Try running your code again.";

    return NextResponse.json({ reply: replyText });
  } catch (error: any) {
    console.error('API Error in /api/tutor:', error);
    return NextResponse.json({ error: error.message || 'Internal Server Error' }, { status: 500 });
  }
}
