"""
Generate narrations/py-day-02.json
TTS narration scripts for Python Day 02
"""

import json

narration_data = {
    "day": 2,
    "title": "Operators & Expressions Narration Scripts",
    "lecture": {
        "New_PyDay02Audio01.mp3": "Python provides standard arithmetic operators and augmented assignment operators. Augmented assignment on mutable objects like lists mutates them in place, while on immutable types like integers or strings it rebinds to a new object.",
        "New_PyDay02Audio02.mp3": "Review these arithmetic operators. True division with a single slash always returns a float. Double slashes perform floor division rounding down. The percent sign gives the remainder, and double asterisk performs exponentiation from right to left.",
        "New_PyDay02Audio03.mp3": "In financial analysis, compound interest uses the power operator. Notice list mutation with plus-equals: adding an element in place modifies the existing list in memory, impacting all variables referencing that list.",
        "New_PyDay02Audio04.mp3": "Python comparison operators evaluate truth values. Uniquely, Python supports chained comparisons: an expression like eighteen less than or equal to age less than sixty-five evaluates the middle variable only once.",
        "New_PyDay02Audio05.mp3": "Chained comparisons keep your code concise and mathematically intuitive. You can validate bounded score ranges, check numerical windows, verify multi-variable equality, or compare ISO date strings lexicographically.",
        "New_PyDay02Audio06.mp3": "In data quality validation pipelines, chained comparisons allow you to assert normal body temperatures and valid HTTP two-hundred status ranges in a single clean line.",
        "New_PyDay02Audio07.mp3": "Python's logical operators 'and', 'or', and 'not' evaluate truthiness with short-circuit rules. They do not just return booleans; they return the exact operand that determined the outcome.",
        "New_PyDay02Audio08.mp3": "Here is the short-circuit matrix. With 'or', if the first value is truthy, Python returns it immediately without checking the second operand, providing an elegant pattern for fallback defaults.",
        "New_PyDay02Audio09.mp3": "Using short-circuit 'and' protects against divide-by-zero crashes. If divisor does not equal zero is false, Python halts immediately, preventing runtime crashes without verbose try-except blocks.",
        "New_PyDay02Audio10.mp3": "The 'is' operator checks whether two variables point to the exact same memory address. The 'in' operator checks membership inside a collection, running in constant time on sets and dictionaries.",
        "New_PyDay02Audio11.mp3": "Always use 'is None' for NULL checks because it tests singleton pointer identity. Avoid checking 'x in list' inside big loops; convert large lookup tables to sets for constant time lookups.",
        "New_PyDay02Audio12.mp3": "In text processing pipelines, filtering tokens against a set of stop words using 'not in' cleans entire corpora at high speed because set lookups are average constant time.",
        "New_PyDay02Audio13.mp3": "Bitwise operators manipulate integer bits directly. In data systems, bitwise flags provide compact, ultra-fast representations for permission matrices and status flags.",
        "New_PyDay02Audio14.mp3": "Here is your bitwise cheat sheet. Bitwise AND with one tests for even or odd in one CPU cycle. Bitwise OR turns on flags, XOR toggles flags, and left shift multiplies by powers of two.",
        "New_PyDay02Audio15.mp3": "Here is a role-based access control mask. Combining read and execute permissions creates bitmask five. Performing bitwise AND with write returns zero, proving write access is denied.",
        "New_PyDay02Audio16.mp3": "The walrus operator assigns values to variables inside expressions. Combined with Python's ternary conditional, it allows you to filter and transform data without repetitive calculations.",
        "New_PyDay02Audio17.mp3": "Notice the operator precedence hierarchy. Parentheses take top priority, followed by exponentiation which associates right to left, multiplication, addition, bitwise shifts, comparisons, logical operators, and finally walrus.",
        "New_PyDay02Audio18.mp3": "In list comprehensions, the walrus operator strips raw text and assigns it to a clean variable in the if condition, allowing you to collect the cleaned string in a single efficient pass."
    },
    "questions": {
        "New_PyDay02Question01.mp3": "Let's calculate Body Mass Index! Compute BMI as weight in kilograms divided by height in meters squared, rounded to two decimal places.",
        "New_PyDay02Question01sol.mp3": "Compute BMI by dividing weight_kg by height_m squared, then wrap in round with two decimal places.",
        "New_PyDay02Question02.mp3": "Circular buffer challenge! Given a stream of event sequence numbers and a buffer size of eight, calculate the buffer slot index using modulo.",
        "New_PyDay02Question02sol.mp3": "Use the modulo operator to divide the sequence number by buffer size, returning the slot index.",
        "New_PyDay02Question03.mp3": "Validate sensor readings using chained comparisons! Check that temperature is between 18 and 26, and humidity is between 30 and 60.",
        "New_PyDay02Question03sol.mp3": "Combine both chained comparisons with an 'and' operator to verify the environmental conditions.",
        "New_PyDay02Question04.mp3": "Time for default fallback logic! Use the short-circuit 'or' operator to assign a currency code or fall back to USD.",
        "New_PyDay02Question04sol.mp3": "Strip the user input string and use 'or' with DEFAULT_CURRENCY to achieve an instant fallback.",
        "New_PyDay02Question05.mp3": "Prevent divide-by-zero crashes! Use short-circuit 'and' to guard division by zero when calculating average transaction values.",
        "New_PyDay02Question05sol.mp3": "Write tx_count not equal to zero 'and' total_revenue divided by tx_count, safely returning False if count is zero.",
        "New_PyDay02Question06.mp3": "Explore exponentiation precedence! Calculate 2 to the 3 to the 2 with and without parentheses, then compute the difference.",
        "New_PyDay02Question06sol.mp3": "Due to right associativity, 2 to the 3 to the 2 is 512, whereas grouped with parentheses it is 64. Subtract the two values.",
        "New_PyDay02Question07.mp3": "Bitwise speed test! Test whether a number is even using bitwise AND, and verify if it is a power of two using n AND n minus one.",
        "New_PyDay02Question07sol.mp3": "Check even using n ampersand 1 equals 0. Check power of two using n greater than 0 and n ampersand n minus 1 equals 0.",
        "New_PyDay02Question08.mp3": "Permission bitmask checking! Combine read and write flags into a role mask, then verify write and delete permissions.",
        "New_PyDay02Question08sol.mp3": "Use bitwise AND between role mask and WRITE to check write permission, and repeat with DELETE.",
        "New_PyDay02Question09.mp3": "Classify customer spending tiers! Use nested ternary expressions to categorize spend amounts into Platinum, Gold, and Silver.",
        "New_PyDay02Question09sol.mp3": "Use a list comprehension with 'Platinum if s >= 10000 else Gold if s >= 3000 else Silver'.",
        "New_PyDay02Question10.mp3": "Inspect None singleton comparisons! Compare 'val is None' versus 'val == None' and verify both evaluate to True.",
        "New_PyDay02Question10sol.mp3": "Assign identity_check to val is None, and equality_check to val equals None.",
        "New_PyDay02Question11.mp3": "Filter query keywords! Tokenize a search query and remove common stop words using the 'not in' membership operator.",
        "New_PyDay02Question11sol.mp3": "Convert the query to lowercase, split into words, and filter with a comprehension where token not in stop_words.",
        "New_PyDay02Question12.mp3": "Harness the walrus operator! Process a list of strings, stripping each and filtering items with length greater than four in a single pass.",
        "New_PyDay02Question12sol.mp3": "Use a list comprehension with 'if len(cleaned := item.strip()) > 4' and yield the cleaned string.",
        "New_PyDay02Question13.mp3": "Build a multi-condition credit risk evaluator! Group credit score, debt-to-income, and income requirements with logical operators.",
        "New_PyDay02Question13sol.mp3": "Formulate the boolean expression using parentheses around each approval tier separated by 'or'.",
        "New_PyDay02Question14.mp3": "Aggregate session audit flags! Iterate through action flags, combine them with in-place bitwise OR, and test if export was triggered.",
        "New_PyDay02Question14sol.mp3": "Initialize session_mask to 0, loop applying bitwise OR equals act, then check bitwise AND with LOG_EXPORT.",
        "New_PyDay02Question15.mp3": "High-performance running cumulative sum! Use the walrus operator inside a comprehension to filter positive numbers and track cumulative totals.",
        "New_PyDay02Question15sol.mp3": "Use a list comprehension yielding tuples of x and running_sum := running_sum + x for all positive values."
    }
}

with open('narrations/py-day-02.json', 'w', encoding='utf-8') as f:
    json.dump(narration_data, f, indent=2)

print("Successfully generated narrations/py-day-02.json!")
