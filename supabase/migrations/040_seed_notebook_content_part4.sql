-- ═══════════════════════════════════════════════════════════════
-- Seed Notebook Content: Days 16 to 20
-- ═══════════════════════════════════════════════════════════════

INSERT INTO public.notebook_content (day_id, title, html_body, sections, cells)
VALUES
('day16', '🧩 OOP Basics', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>As programs grow, functional code can become messy spaghetti. Object-Oriented Programming (OOP) allows us to encapsulate state and behavior into clean, reusable models. Today we master the syntax of Classes, the <code><strong>init</strong></code> constructor, and the DRY (Don''t Repeat Yourself) principle of Inheritance.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Classes</td><td>Blueprints for objects</td></tr>
<tr><td>2</td><td>Constructor</td><td><code><strong>init</strong></code> and <code>self</code></td></tr>
<tr><td>3</td><td>Inheritance</td><td>Reusing logic with <code>super()</code></td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Classes & Objects : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Modeling the World</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Object-Oriented Programming (OOP) groups data (<b>attributes</b>) and behavior (<b>methods</b>) into a single template called a <b>Class</b>. When you create a specific instance of that class, it is called an <b>Object</b>.</p>
<pre class="nb-code-block"><code>class User:
    pass

alice = User() # Create an object (instance)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Code Organization</strong>: Bundling messy API connection variables and functions into a clean <code>APIClient</code> class</p>
<p>• <strong>Data Modeling</strong>: Creating a <code>DataRow</code> class that knows how to clean its own data</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Over-engineering</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Don''t use OOP if a simple dictionary and a function will do the job. Python supports both functional and OOP paradigms. Use OOP when you need to manage complex <b>state</b>.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">class Customer:
    # A basic class
    pass

# Create two distinct objects
c1 = Customer()
c2 = Customer()

# Add attributes dynamically (not recommended, but possible)
c1.name = &quot;Alice&quot;
c2.name = &quot;Bob&quot;

print(f&quot;C1: {c1.name}&quot;)
print(f&quot;C2: {c2.name}&quot;)
print(c1 == c2) # False, they are distinct objects in memory</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Classes-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Classes</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Define a class <code>Car</code>. Create two instances, <code>car1</code> and <code>car2</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Assign a <code>color</code> attribute to <code>car1</code> (e.g., <code>"Red"</code>). Print it.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Try to access the <code>color</code> attribute on <code>car2</code>. Catch the <code>AttributeError</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Print the <code>type()</code> of <code>car1</code>. What does it say?</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain the difference between a Class and an Object using a real-world analogy.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. __init__ and self : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">The Constructor</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>To set up an object properly when it is created, we use the <b>constructor method</b>: <code><strong>init</strong></code>. The first parameter of EVERY method must be <code>self</code>, which refers to the specific object being manipulated.</p>
<pre class="nb-code-block"><code>class User:
    def __init__(self, name, age):
        self.name = name  # Attribute assignment
        self.age = age

alice = User(&#x27;Alice&#x27;, 25) # __init__ is called automatically</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Initialization</strong>: Ensuring a database connection object immediately connects when instantiated</p>
<p>• <strong>State Management</strong>: Tracking variables like <code>self.is_logged_in</code> across different method calls</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Dunder methods (like <code><strong>init</strong></code>, with double underscores) are ''magic methods'' that Python calls automatically behind the scenes. You rarely call them directly.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">class Product:
    # The constructor
    def __init__(self, name, price):
        self.name = name
        self.price = price
        self.in_stock = True  # Default state
        
    # An instance method
    def apply_discount(self, percent):
        self.price = self.price * (1 - percent)
        print(f&quot;{self.name} discounted to {self.price}&quot;)

# Instantiate and use
laptop = Product(&quot;MacBook&quot;, 1000)
laptop.apply_discount(0.20)
print(f&quot;In stock? {laptop.in_stock}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Init & Self-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Init & Self</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>Book</code> class with an <code><strong>init</strong></code> that takes <code>title</code> and <code>author</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create an instance of <code>Book</code> and print its <code>title</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add a method <code>summary(self)</code> to <code>Book</code> that prints <code>"[title] by [author]"</code>. Call it.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Add a default argument <code>is_read=False</code> to the <code><strong>init</strong></code>. Prove it works by creating a book and checking the attribute.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is <code>self</code> required as the first argument in instance methods? What happens if you forget it?</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Inheritance : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Reusing Class Logic</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Inheritance</b> allows a new Class (Child) to adopt the attributes and methods of an existing Class (Parent). This promotes code reuse. You use <code>super()</code> to call methods from the Parent class.
</div></div>
<pre class="nb-code-block"><code>class Employee:
    def work(self): print(&#x27;Working&#x27;)

class Manager(Employee): # Inherits from Employee
    def meeting(self): print(&#x27;In a meeting&#x27;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Code Reuse</strong>: Creating <code>CSVReader</code> and <code>JSONReader</code> that both inherit from a base <code>DataReader</code> class</p>
<p>• <strong>Specialization</strong>: Creating specific exception types that inherit from <code>Exception</code></p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Deep Hierarchies</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Avoid creating deeply nested inheritance chains (A inherits B inherits C inherits D). It makes code impossible to debug. Prefer ''Composition'' over deep Inheritance.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">class Animal:
    def __init__(self, name):
        self.name = name
    def speak(self):
        return &quot;...&quot;

# Dog inherits from Animal
class Dog(Animal):
    def speak(self):
        return &quot;Woof!&quot;

# Cat inherits from Animal, and adds a new attribute
class Cat(Animal):
    def __init__(self, name, color):
        super().__init__(name)  # Call parent constructor
        self.color = color
        
    def speak(self):
        return &quot;Meow!&quot;

d = Dog(&quot;Rex&quot;)
c = Cat(&quot;Luna&quot;, &quot;Black&quot;)
print(f&quot;{d.name}: {d.speak()}&quot;)
print(f&quot;{c.color} cat {c.name}: {c.speak()}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Inheritance-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Inheritance</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a parent class <code>Vehicle</code> with <code><strong>init</strong>(self, speed)</code>. Add a <code>move</code> method.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a child class <code>Bicycle(Vehicle)</code>. Call its <code>move</code> method to prove it inherited it.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Override the <code>move</code> method in <code>Bicycle</code> to print <code>"Pedaling at [speed]"</code>. Call it.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Create a child class <code>Car(Vehicle)</code>. Use <code>super().<strong>init</strong>(speed)</code> to add a new <code>brand</code> attribute.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Check if <code>Car</code> is a subclass of <code>Vehicle</code> using <code>issubclass(Car, Vehicle)</code>. Print the result.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Bank Account):</strong> Create a <code>BankAccount</code> class with <code>balance</code> (default 0). Add <code>deposit(amt)</code> and <code>withdraw(amt)</code> methods. Prevent overdrafts (withdrawals > balance). Test it.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Data Analyzer):</strong> Create a <code>Dataset</code> class initialized with a list of numbers. Add methods <code>mean()</code>, <code>max()</code>, and <code>min()</code>. Instantiate and test.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Shape Inheritance):</strong> Create <code>Shape</code> class with <code>area() -> 0</code>. Create <code>Rectangle(Shape)</code> and <code>Circle(Shape)</code> that override <code>area()</code> with actual math. Create one of each and print areas.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Employee Roster):</strong> Create an <code>Employee</code> class (<code>name</code>, <code>salary</code>). Create <code>Manager(Employee)</code> that adds an <code>add_report()</code> method to track a list of employees. Add 2 employees to a manager.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (API Client Mock):</strong> Create an <code>APIClient</code> class with <code>base_url</code>. Add a method <code>get(endpoint)</code> that prints <code>Fetching [base_url]/[endpoint]</code>. Test it.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a <code>Dog</code> class. Create 3 instances with different names. Print <code>type()</code> and <code>id()</code> for each to prove they are separate objects of the same class.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a <code>Counter</code> class where <code><strong>init</strong></code> sets <code>self.count = 0</code>. Add an <code>increment</code> method. Show that two instances have independent counters.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a class method that deliberately omits <code>self</code>. Call it on an instance, catch the <code>TypeError</code>, and print the error message to show why <code>self</code> is required.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a <code>Shape</code> base class with <code>area()</code> returning <code>0</code>. Write <code>Circle(Shape)</code> overriding <code>area()</code> with <code>pi <em> r</em>*2</code>. Create both and print <code>.area()</code>.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a <code>Vehicle</code> class. Create <code>Car(Vehicle)</code> adding a <code>brand</code> attribute using <code>super().<strong>init</strong>()</code>. Print the car''s speed and brand.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a class with a class attribute <code>count = 0</code> and increment it inside <code><strong>init</strong></code>. Create 3 objects. Print <code>MyClass.count</code> showing it tracks instances.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a class with a class attribute <code>count</code> that tracks instances. Add an <code><strong>init</strong></code> that increments it. Create 5 objects, delete 2, show <code>count</code> remains 5.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a parent <code>Animal</code> class with <code>speak()</code> returning <code>''...''</code>. Write <code>Dog(Animal)</code> and <code>Cat(Animal)</code> overriding <code>speak()</code>. Call <code>.speak()</code> on each.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a <code>Dog</code>, <code>Cat</code>, and <code>Bird</code> class each with a <code>speak()</code> method. Write a function <code>animal_sounds(animals)</code> that calls <code>.speak()</code> on any animal passed in.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write code using <code>ClassName.mro()</code> to print the Method Resolution Order of a class with diamond inheritance (A->B, A->C, B,C->D).</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write three unrelated classes (<code>Dog</code>, <code>Cat</code>, <code>Robot</code>) each with a <code>.greet()</code> method. Write a function that calls <code>.greet()</code> on any object — demonstrating polymorphism.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a <code>JSONMixin</code> class with <code>to_json(self)</code> using <code>json.dumps(self.<strong>dict</strong>)</code>. Write <code>User(JSONMixin)</code> and call <code>user.to_json()</code>.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a class with <code>_salary</code> (private by convention). Add a <code>@property</code> that returns it as <code>$XX,XXX</code>. Demonstrate accessing it both ways.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a class using <code><strong>name</code> (name mangling). Show that <code>obj.</strong>name</code> raises <code>AttributeError</code> but <code>obj._ClassName__name</code> works.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a <code>Rectangle</code> class with <code>width</code> and <code>height</code>. Add <code>@property area</code> that returns <code>width * height</code>. Access it without parentheses.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a <code>Date</code> class with <code>@classmethod from_string(cls, s)</code> that parses <code>''25-12-2023''</code>. Create <code>d = Date.from_string(''25-12-2023'')</code> and print <code>d.year</code>.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a <code>MathUtils</code> class with <code>@staticmethod is_prime(n)</code> that checks primality. Call it without creating an instance.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a custom <code>ValidationError(Exception)</code> class with a <code>field</code> attribute. Raise it and catch it, printing the field name.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a <code>ShoppingCart</code> class that holds a list of <code>Item(name, price)</code> objects (composition). Add <code>total()</code> method. Test with 3 items.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a <code>ShoppingCart</code> class using composition: it contains a list of <code>Item</code> objects. Add <code>add_item()</code> and <code>total()</code> methods.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a class implementing <code><strong>str</strong></code>, <code><strong>repr</strong></code>, and <code><strong>len</strong></code>. Demonstrate that <code>print()</code>, <code>repr()</code>, and <code>len()</code> call each respectively.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a <code>User(name, email)</code> class with <code><strong>str</strong></code> returning <code>''name <email>''</code> and <code><strong>repr</strong></code> returning <code>''User(name, email)''</code>.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a class <code>Bag</code> that implements <code><strong>len</strong></code> returning the count of items stored internally. Test with <code>len(bag)</code>.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a class <code>Row</code> that stores a dict and implements <code><strong>getitem</strong>(key)</code> so you can access fields like <code>row[''name'']</code>.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write two unrelated classes (<code>Duck</code>, <code>Person</code>) both with <code>.quack()</code>. Write a function that calls <code>.quack()</code> on whatever is passed — demonstrating duck typing.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 16 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Class</td><td>Bundles data and functions together</td></tr>
<tr><td>2</td><td>Self</td><td>Refers to the specific instance being operated on</td></tr>
<tr><td>3</td><td>Inherit</td><td><code>class Child(Parent):</code> shares methods instantly</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can define a Class and instantiate an Object.</p>
<p>• [ ] I understand <code>self</code> and <code><strong>init</strong></code>.</p>
<p>• [ ] I can inherit from a parent class.</p>
<p><strong>Next Up: Day 17 - OOP Advanced: Dunder Methods & Properties</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Classes & Objects : Modeling the World"}, {"anchor": "checks-Classes-3", "title": "\ud83e\uddea Checks: Classes"}, {"anchor": "sec-14", "title": "2. __init__ and self : The Constructor"}, {"anchor": "checks-Init & Self-16", "title": "\ud83e\uddea Checks: Init & Self"}, {"anchor": "sec-27", "title": "3. Inheritance : Reusing Class Logic"}, {"anchor": "checks-Inheritance-29", "title": "\ud83e\uddea Checks: Inheritance"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day17', '🏗️ OOP Advanced', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>To write truly Pythonic code, your custom classes should behave like built-in types. Today we unlock ''Dunder'' magic methods to make our objects printable, measurable, and iterable. We also explore the elegant <code>@property</code> decorator for bulletproof data validation.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Dunders</td><td><code><strong>str</strong></code>, <code><strong>len</strong></code>, <code><strong>eq</strong></code></td></tr>
<tr><td>2</td><td>Properties</td><td>Encapsulation, <code>@property</code></td></tr>
<tr><td>3</td><td>Class Methods</td><td><code>@classmethod</code>, <code>@staticmethod</code></td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Dunder Methods : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Magic Integration</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Dunder (Double Under) methods are special methods like <code><strong>str</strong></code> or <code><strong>len</strong></code> that allow your objects to integrate seamlessly with Python''s built-in functions. They define how an object should behave when printed, added, or measured.</p>
<table>
<thead><tr><th>Method</th><th>Triggered By</th><th>Purpose</th></tr></thead><tbody>
<tr><td><code><strong>str</strong></code></td><td><code>print(obj)</code></td><td>User-friendly string representation</td></tr>
<tr><td><code><strong>repr</strong></code></td><td><code>repr(obj)</code></td><td>Developer-friendly representation (for debugging)</td></tr>
<tr><td><code><strong>len</strong></code></td><td><code>len(obj)</code></td><td>Return length or size of object</td></tr>
<tr><td><code><strong>eq</strong></code></td><td><code>obj == other</code></td><td>Custom equality checking</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Beautiful Logging</strong>: Implementing <code><strong>str</strong></code> so <code>print(user)</code> shows ''Alice'' instead of <code><<strong>main</strong>.User object at 0x...></code></p>
<p>• <strong>Custom Collections</strong>: Implementing <code><strong>len</strong></code> on a custom <code>Dataset</code> class so <code>len(df)</code> works naturally</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Missing __repr__</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Always implement at least <code><strong>repr</strong></code>. If <code><strong>str</strong></code> is missing, Python falls back to <code><strong>repr</strong></code>. If both are missing, you get the ugly memory address string.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">class Team:
    def __init__(self, name, members):
        self.name = name
        self.members = members
        
    # Beautiful printing
    def __str__(self):
        return f&quot;Team {self.name} ({len(self.members)} members)&quot;
        
    # Native length checking
    def __len__(self):
        return len(self.members)
        
    # Native equality checking
    def __eq__(self, other):
        return self.name == other.name

t = Team(&quot;Alpha&quot;, [&quot;Alice&quot;, &quot;Bob&quot;])
print(t)         # Calls __str__
print(len(t))    # Calls __len__
print(t == Team(&quot;Alpha&quot;, [])) # Calls __eq__ (True)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Dunder Methods-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Dunder Methods</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>Point(x,y)</code> class. Try to <code>print()</code> an instance and note the ugly output.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Add a <code><strong>str</strong></code> method to <code>Point</code> that returns <code>"(x, y)"</code>. Print the instance again.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add an <code><strong>eq</strong></code> method that returns True if both x and y are the same. Test <code>Point(1,1) == Point(1,1)</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Add a <code><strong>add</strong></code> method that allows you to add two points together: <code>Point(x1+x2, y1+y2)</code>. Test <code>p1 + p2</code>.</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is <code><strong>repr</strong></code> meant for developers and <code><strong>str</strong></code> meant for users?</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Properties & Encapsulation : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Safe Data Access</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Encapsulation is the practice of hiding internal state. In Python, we prefix private variables with an underscore <code>_</code>. To provide controlled access to these variables, we use the <b><code>@property</code></b> decorator, which allows methods to be accessed like attributes.</p>
<pre class="nb-code-block"><code>class User:
    def __init__(self):
        self._score = 0  # Private variable
        
    @property
    def score(self):
        return self._score # Accessed without ()</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Validation</strong>: Preventing a user''s age from being set to a negative number via a property setter</p>
<p>• <strong>Computed Properties</strong>: Calculating <code>fullname</code> dynamically from <code>first_name</code> and <code>last_name</code> without storing it</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Python doesn''t have strict ''private'' variables like Java. The underscore is a ''gentleman''s agreement'' among developers: ''This is internal, do not touch it directly.''</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">class Thermostat:
    def __init__(self):
        self._celsius = 20  # internal private state
        
    @property
    def celsius(self):
        return self._celsius
        
    @celsius.setter
    def celsius(self, value):
        if value &lt; -273.15:
            raise ValueError(&quot;Temperature below absolute zero!&quot;)
        self._celsius = value
        
    @property
    def fahrenheit(self):
        # Computed dynamically! Not stored.
        return (self._celsius * 9/5) + 32

t = Thermostat()
print(t.celsius)
print(t.fahrenheit)

# Safely triggers validation
# t.celsius = -300  # Would raise ValueError</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Properties-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Properties</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>Person</code> class with an <code><strong>init</strong></code> that sets <code>self.first</code> and <code>self.last</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Add a <code>@property</code> method called <code>fullname</code> that returns <code>first + " " + last</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Create an instance, change <code>first</code>, and then print <code>fullname</code> without parentheses. See how it updates.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Add a setter <code>@fullname.setter</code> that takes a full name string, splits it, and updates <code>first</code> and <code>last</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why are properties better than Java-style <code>get_name()</code> and <code>set_name()</code> methods?</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Class & Static Methods : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Alternative Constructors</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b><code>@classmethod</code></b> takes <code>cls</code> instead of <code>self</code> and modifies class-level state. It''s heavily used for alternative constructors. <b><code>@staticmethod</code></b> takes neither and is just a regular function that is logically bundled inside the class.
</div></div>
<table>
<thead><tr><th>Decorator</th><th>First Arg</th><th>Purpose</th></tr></thead><tbody>
<tr><td>(None)</td><td><code>self</code></td><td>Manipulate instance state</td></tr>
<tr><td><code>@classmethod</code></td><td><code>cls</code></td><td>Manipulate class state / Alternative constructors</td></tr>
<tr><td><code>@staticmethod</code></td><td>(None)</td><td>Utility functions that don''t need class/instance state</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>API Parsers</strong>: <code>User.from_json(json_string)</code> is a classic use of <code>@classmethod</code> to instantiate objects from APIs</p>
<p>• <strong>Utilities</strong>: <code>MathUtils.is_prime(n)</code> is a classic <code>@staticmethod</code></p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If your method doesn''t use <code>self</code> anywhere inside it, your IDE will usually suggest converting it to a <code>@staticmethod</code>.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import json

class Config:
    # Class attribute
    version = &quot;1.0&quot;
    
    def __init__(self, data):
        self.data = data
        
    @classmethod
    def from_json_string(cls, json_str):
        # Alternative constructor
        data_dict = json.loads(json_str)
        return cls(data_dict) # Returns a new Config instance
        
    @staticmethod
    def validate_key(key):
        # Utility function (needs no state)
        return isinstance(key, str) and len(key) &gt; 0

# Use alternative constructor directly on the Class
conf = Config.from_json_string(&#x27;{&quot;port&quot;: 8080}&#x27;)
print(conf.data)
print(Config.validate_key(&quot;port&quot;))</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Class Methods-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Class Methods</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Create a <code>Date</code> class with <code>day, month, year</code>. Add a <code>@classmethod</code> <code>from_string(cls, date_str)</code> that parses <code>"DD-MM-YYYY"</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Test the class method: <code>d = Date.from_string("25-12-2023")</code>. Print its year.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Add a <code>@staticmethod</code> <code>is_valid_month(m)</code> that checks if <code>1 <= m <= 12</code>. Test it.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Explain the difference between <code>cls</code> in a class method and <code>self</code> in an instance method.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Add a class attribute <code>count = 0</code>. Increment it inside <code><strong>init</strong></code>. Create 3 objects and print <code>Date.count</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Vector Math):</strong> Create a <code>Vector(x, y)</code> class. Implement <code><strong>add</strong></code> (add two vectors), <code><strong>sub</strong></code> (subtract), and <code><strong>str</strong></code> (print like <code><x, y></code>). Test them.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Safe Wallet):</strong> Create a <code>Wallet</code> class. Add a private <code>_balance</code> starting at 0. Add a <code>@property</code> for balance. Add a <code>@balance.setter</code> that prevents setting the balance to a negative number. Raise ValueError if attempted.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (DataFrame Mock):</strong> Create a <code>MockDF</code> class initialized with a list of dictionaries. Implement <code><strong>len</strong></code> to return row count. Implement <code><strong>getitem</strong>(key)</code> to return a list of values for a specific column key.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (User Parser):</strong> Create a <code>User(username, email)</code> class. Add a <code>@classmethod</code> <code>from_csv(cls, csv_line)</code> that takes a string <code>''bob,bob@gmail.com''</code>, splits it, and returns a new User instance.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (String Utilities):</strong> Create a <code>StringUtils</code> class. Add <code>@staticmethod</code>s for <code>is_palindrome(s)</code> and <code>count_vowels(s)</code>. Call them without instantiating the class.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>Write a <code>Point(x, y)</code> class. Implement <code><strong>str</strong></code> to return <code>''(x, y)''</code> and <code><strong>repr</strong></code> to return <code>''Point(x, y)''</code>. Print both.</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Write a <code>Vector(x, y)</code> class that implements <code><strong>add</strong></code> to add two vectors. Test with <code>Vector(1,2) + Vector(3,4)</code> and print.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a class <code>Config</code> that implements <code><strong>getitem</strong></code> and <code><strong>setitem</strong></code> using an internal dict. Test with <code>cfg[''key''] = ''value''</code>.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a <code>Temperature</code> class with a <code>@property celsius</code> and a computed <code>@property fahrenheit</code>. Demonstrate updating celsius and reading fahrenheit.</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Write a <code>Date</code> class with <code>@classmethod from_string(cls, s)</code> and <code>@staticmethod is_valid_year(y)</code>. Demonstrate both.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a <code>User</code> class with <code>@classmethod from_json(cls, json_str)</code> that parses a JSON string into a User object. Test it.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Write a class with <code>__name</code> (double underscore). Print <code>dir(obj)</code> to find the mangled name <code>_ClassName__name</code>. Access it.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a <code>Timer</code> context manager class implementing <code><strong>enter</strong></code> and <code><strong>exit</strong></code>. Use it with <code>with Timer(): time.sleep(0.5)</code>.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a simple descriptor class <code>PositiveNumber</code> with <code><strong>get</strong></code> and <code><strong>set</strong></code> that rejects negative values. Use it in a <code>Product</code> class for <code>price</code>.</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a class implementing <code><strong>iter</strong></code> and <code><strong>next</strong></code> to iterate over a range of even numbers. Test with <code>for n in EvenRange(10):</code>.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a <code>Greeter</code> class with <code><strong>call</strong>(self, name)</code> so instances can be called like functions: <code>g = Greeter(); g(''Alice'')</code>.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Write a Singleton class using <code><strong>new</strong></code>: override it to return the same instance every time. Create two objects and verify <code>a is b</code>.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a Singleton class overriding <code><strong>new</strong></code> to always return the same instance. Create <code>a = S(); b = S()</code> and print <code>a is b</code>.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a class using <code><strong>slots</strong> = [''x'', ''y'']</code>. Try to add a dynamic attribute <code>obj.z = 1</code> and catch the <code>AttributeError</code>.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write code comparing memory usage of a class with <code><strong>slots</strong></code> vs without using <code>sys.getsizeof()</code>. Print both sizes.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a class with <code><strong>getattr</strong></code> that returns <code>''not found''</code> for any missing attribute. Test with <code>obj.nonexistent</code>.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a class with <code><strong>getattr</strong></code> (missing attrs only) vs <code><strong>getattribute</strong></code> (all attr access). Show how the latter intercepts everything.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a class with <code><strong>del</strong></code> that prints <code>''Deleted''</code>. Create an instance, delete it with <code>del obj</code>, and observe the output.</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a <code>Person</code> class with <code>_age</code>. Add a <code>@age.setter</code> that raises <code>TypeError</code> if the value is not an <code>int</code>. Test it.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write two unrelated classes with <code><strong>len</strong></code> and <code><strong>getitem</strong></code>. Pass both to a function that calls <code>len()</code> and <code>[0]</code> on them — demonstrating duck typing.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a class <code>HexInt(int)</code> that overrides <code><strong>str</strong></code> to return the hex representation. Test with <code>print(HexInt(255))</code>.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Import <code>abc</code>. Write an <code>ABC Shape</code> with <code>@abstractmethod area()</code>. Create <code>Circle(Shape)</code> implementing <code>area()</code>. Show what happens if you don''t implement it.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write an ABC <code>DataReader</code> with <code>@abstractmethod read()</code>. Write <code>CSVReader(DataReader)</code> and <code>JSONReader(DataReader)</code> implementing it.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a class with diamond inheritance (<code>A -> B, A -> C, B,C -> D</code>). Call <code>D.mro()</code> and print the resolution order.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a class using <code>@functools.cached_property</code> for an expensive computation. Show it only computes once by adding a print statement inside.</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 17 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Dunder</td><td>Makes objects act like native Python types</td></tr>
<tr><td>2</td><td>Property</td><td>Protects private data while keeping syntax clean</td></tr>
<tr><td>3</td><td>Classmethod</td><td>Perfect for alternative constructors (<code>from_json</code>)</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can implement <code><strong>str</strong></code> and <code><strong>repr</strong></code>.</p>
<p>• [ ] I can use <code>@property</code> for getter/setter validation.</p>
<p>• [ ] I understand when to use <code>@classmethod</code>.</p>
<p><strong>Next Up: Day 18 - Regular Expressions (Regex)</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Dunder Methods : Magic Integration"}, {"anchor": "checks-Dunder Methods-3", "title": "\ud83e\uddea Checks: Dunder Methods"}, {"anchor": "sec-14", "title": "2. Properties & Encapsulation : Safe Data Access"}, {"anchor": "checks-Properties-16", "title": "\ud83e\uddea Checks: Properties"}, {"anchor": "sec-27", "title": "3. Class & Static Methods : Alternative Constructors"}, {"anchor": "checks-Class Methods-29", "title": "\ud83e\uddea Checks: Class Methods"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day18', '🔍 Regex', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Regular Expressions (Regex) are the ultimate tool for text manipulation. While notoriously cryptic, mastering regex allows you to perform data cleaning tasks in 1 line of code that would otherwise take 50 lines of complex string manipulation.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Basics</td><td><code>\d</code>, <code>\w</code>, <code>re.findall</code></td></tr>
<tr><td>2</td><td>Quantifiers</td><td><code>+</code>, <code>*</code>, <code>?</code>, <code>^</code>, <code>$</code></td></tr>
<tr><td>3</td><td>Groups</td><td><code>[abc]</code>, <code>(capture)</code></td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Regex Basics : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Pattern Matching</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Regular Expressions (Regex) are a mini-language for matching text patterns. The <code>re</code> module allows you to find, extract, and replace complex strings that standard methods like <code>.replace()</code> cannot handle.</p>
<table>
<thead><tr><th>Character</th><th>Matches</th><th>Example</th></tr></thead><tbody>
<tr><td><code>\d</code></td><td>Any digit (0-9)</td><td><code>\d\d\d</code> (matches 123)</td></tr>
<tr><td><code>\w</code></td><td>Word character (a-z, 0-9, _)</td><td><code>\w+</code> (matches ''hello_1'')</td></tr>
<tr><td><code>\s</code></td><td>Whitespace</td><td><code>\s+</code> (matches multiple spaces)</td></tr>
<tr><td><code>.</code></td><td>Any character</td><td><code>...</code> (matches any 3 chars)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Data Cleaning</strong>: Extracting phone numbers or zip codes from messy text fields</p>
<p>• <strong>Validation</strong>: Ensuring a user''s input strictly matches an email format</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Raw Strings</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Always prefix regex patterns with an <code>r</code> (e.g., <code>r''\d+''</code>). This tells Python it''s a ''raw string'', preventing it from confusing regex backslashes with Python escape characters (like <code>\n</code>).</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">import re

text = &quot;Call me at 555-1234 or 555-9876 today.&quot;

# Find all sequences of digits
# r&quot;\d+&quot; means: 1 or more digits
numbers = re.findall(r&quot;\d+&quot;, text)
print(f&quot;All digits: {numbers}&quot;)

# Find exactly the phone number pattern
# 3 digits, dash, 4 digits
phones = re.findall(r&quot;\d\d\d-\d\d\d\d&quot;, text)
print(f&quot;Phones: {phones}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Regex Basics-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Regex Basics</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>re</code>. Use <code>re.findall()</code> with <code>r"\d+"</code> to extract all numbers from <code>"I have 2 apples and 10 bananas"</code>.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use <code>re.sub()</code> to replace all numbers in the string above with <code>"X"</code>. Print the result.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Find all words in <code>"The quick brown fox"</code> using <code>re.findall()</code> and <code>r"\w+"</code>.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try matching the literal period in <code>"www.google.com"</code>. Why does <code>r"."</code> match everything? How do you escape it <code>r"\."</code>?</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Why is the <code>r</code> prefix important in regex strings? What happens to <code>print("\n")</code> vs <code>print(r"\n")</code>?</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Quantifiers & Anchors : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Advanced Patterns</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Quantifiers</b> dictate how many times a character should occur. <b>Anchors</b> lock the match to the start or end of the string.
</div></div>
<table>
<thead><tr><th>Symbol</th><th>Meaning</th><th>Example</th></tr></thead><tbody>
<tr><td><code>*</code></td><td>0 or more</td><td><code>a*</code> (matches '''', ''a'', ''aa'')</td></tr>
<tr><td><code>+</code></td><td>1 or more</td><td><code>a+</code> (matches ''a'', ''aa'')</td></tr>
<tr><td><code>?</code></td><td>0 or 1 (optional)</td><td><code>colou?r</code> (matches ''color'', ''colour'')</td></tr>
<tr><td><code>{x,y}</code></td><td>Between x and y times</td><td><code>\d{3,4}</code> (matches 123, 1234)</td></tr>
<tr><td><code>^</code> / <code>$</code></td><td>Start / End of string</td><td><code>^Hello</code> / <code>world$</code></td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Log Parsing</strong>: <code>^ERROR</code> ensures we only match lines that <em>start</em> with ERROR, not lines that just contain the word</p>
<p>• <strong>Flexible Parsing</strong>: <code>https?://</code> matches both http and https URLs</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>By default, <code><em></code> and <code>+</code> are <b>greedy</b> (they match as much as possible). Append a <code>?</code> to make them lazy: <code>.</em>?</code> matches as little as possible.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">import re

urls = [&quot;http://google.com&quot;, &quot;https://amazon.com&quot;, &quot;ftp://server.com&quot;]

# Match http or https
for url in urls:
    if re.match(r&quot;https?://&quot;, url):  # &#x27;s&#x27; is optional
        print(f&quot;Valid Web URL: {url}&quot;)

text = &quot;The order number is #123456 and it shipped.&quot;
# Match exactly a # followed by 4 to 6 digits
order = re.findall(r&quot;#\d{4,6}&quot;, text)
print(f&quot;Order: {order}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Quantifiers-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Quantifiers</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Match strings that start with "ID-". Test on <code>["ID-123", "User ID-456"]</code> using <code>^ID-</code> with <code>re.search()</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Match words that end in "ing". Test on <code>"running and jumping"</code> using <code>\w+ing</code>.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Use the optional <code>?</code> to match both <code>"file.txt"</code> and <code>"files.txt"</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use the <code>{n}</code> quantifier to match exactly a 5-digit zip code in <code>"My zip is 90210 or 1234"</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Demonstrate greedy vs lazy: run <code>re.findall(r"<.<em>>", "<b>text</b>")</code> and then <code>r"<.</em>?>"</code>.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Groups & Sets : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Extracting Structure</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
    <b>Character Sets `[]`</b> allow you to match any ONE of the characters inside. <b>Capture Groups `()`</b> allow you to extract specific parts of a pattern.
</div></div>
<table>
<thead><tr><th>Syntax</th><th>Meaning</th><th>Example</th></tr></thead><tbody>
<tr><td><code>[abc]</code></td><td>''a'' or ''b'' or ''c''</td><td><code>b[aeiou]t</code> (bat, bit, but)</td></tr>
<tr><td><code>[A-Z]</code></td><td>Range (capital letters)</td><td><code>[A-Za-z0-9]</code> (Alphanumeric)</td></tr>
<tr><td><code>[^a]</code></td><td>Negation (NOT ''a'')</td><td><code>[^0-9]</code> (Non-digits)</td></tr>
<tr><td><code>(abc)</code></td><td>Capture group</td><td><code>(\d{3})-(\d{4})</code> (Extracts parts)</td></tr>
</tbody></table>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>ETL Pipelines</strong>: Extracting the Year, Month, and Day from a messy date string into separate variables</p>
<p>• <strong>Data Scrubbing</strong>: Removing all punctuation using <code>re.sub(r''[^A-Za-z0-9\s]'', '''', text)</code></p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When using <code>re.findall()</code> with capture groups <code>()</code>, it returns a list of <b>tuples</b> instead of strings, containing exactly the captured components!</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">import re

dates = &quot;Born on 1990-05-15, graduated 2012-08-20.&quot;

# Capture groups (Year, Month, Day)
pattern = r&quot;(\d{4})-(\d{2})-(\d{2})&quot;
matches = re.findall(pattern, dates)

print(&quot;Extracted Date Tuples:&quot;)
for year, month, day in matches:
    print(f&quot;Year: {year}, Month: {month}&quot;)

# Character sets (Scrubbing punctuation)
messy = &quot;Data! Science, is #awesome.&quot;
clean = re.sub(r&quot;[^A-Za-z\s]&quot;, &quot;&quot;, messy)
print(f&quot;Cleaned: {clean}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Groups-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Groups</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Match any vowel in <code>"hello world"</code> using <code>re.findall()</code> and a character set <code>[aeiou]</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Match any consonant in <code>"hello world"</code> using the negation set <code>[^aeiou\s]</code>.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Extract the domain names from <code>"user1@gmail.com"</code> and <code>"admin@yahoo.com"</code> using capture groups <code>r"@(\w+\.\w+)"</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Use <code>re.findall()</code> with <code>r"(\d+)\s(USD|EUR)"</code> to extract amount and currency from <code>"100 USD and 50 EUR"</code>.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Extract only words starting with a capital letter from <code>"The Quick brown Fox"</code> using <code>[A-Z][a-z]+</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Email Extractor):</strong> Given a long messy string, write a regex to extract all valid email addresses. (Hint: <code>[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+</code>).</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Phone Normalizer):</strong> Given <code>["(555) 123-4567", "555-123-4567", "5551234567"]</code>, use <code>re.sub()</code> and capture groups to normalize them all to <code>"555-123-4567"</code> format.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (HTML Tag Stripper):</strong> Write a function <code>strip_tags(html)</code> that removes all HTML tags (like <code><div></code> or <code><a href=''''></code>) using a lazy regex <code>r"<.*?>"</code> and <code>re.sub()</code>. Test it on a sample string.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Password Validator):</strong> Write a regex that matches a password ONLY if it has: 8+ chars, at least one digit, and at least one uppercase letter. (Use <code>re.search</code> and positive lookaheads if you dare, or just multiple standard regex checks).</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Log Parser):</strong> Given <code>log = "[2023-10-15 08:22:11] ERROR: Server crashed"</code>, write a regex with 3 capture groups to extract the Date, Time, and Log Level (ERROR).</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is the difference between <code>re.match()</code>, <code>re.search()</code>, and <code>re.findall()</code>?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Explain the difference between greedy and lazy matching. How do you make a quantifier lazy?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>What is a raw string <code>r""</code> in Python, and why is it almost mandatory for regex?</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>Write a regex to validate an IPv4 address (e.g., ''192.168.1.1'').</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain what <code>\b</code> (word boundary) does. Give an example where it is necessary.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Write a regex to extract all hashtags from a tweet.</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>How do you compile a regex pattern using <code>re.compile()</code>? Why is this good for performance?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>What is the <code>re.IGNORECASE</code> flag and how do you use it?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>Write a regex to match a valid 24-hour time format (e.g., ''23:59'', but not ''25:99'').</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Explain capture groups. How do you refer to a capture group in a <code>re.sub()</code> replacement string? (Hint: <code>\1</code>).</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>What is a non-capturing group <code>(?:...)</code> and why would you use it?</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Explain positive lookahead <code>(?=...)</code> and negative lookahead <code>(?!...)</code>.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Write a regex using negative lookahead to match ''foo'' only if it is NOT followed by ''bar''.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>Write a regex to extract the query parameters from a URL.</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>How do you match a string that contains exactly 5 letters, no more, no less? (Hint: anchors).</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Write a regex to parse a CSV line, considering that some fields might be enclosed in quotes.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Explain the <code>re.MULTILINE</code> flag. How does it change the behavior of <code>^</code> and <code>$</code>?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>Write a regex to find all duplicate words in a sentence (e.g., ''This is is a test''). (Hint: backreferences).</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>How do you split a string by multiple different delimiters (e.g., space, comma, semicolon) at once?</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Write a regex to match a valid hex color code (e.g., ''#FFF'' or ''#AABBCC'').</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Explain how <code>re.finditer()</code> differs from <code>re.findall()</code>. When should you use it?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>Write a regex to check if a string contains only alphanumeric characters, without using <code>str.isalnum()</code>.</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>How do you escape special regex characters (like <code>*</code>, <code>?</code>, <code>(</code>) dynamically if they are stored in a variable? (Hint: <code>re.escape</code>).</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Write a regex to match Python single-line comments.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Why is regex generally a bad idea for parsing complex nested structures like HTML or JSON?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 18 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Raw Strings</td><td>Always use <code>r"pattern"</code></td></tr>
<tr><td>2</td><td>Anchors</td><td><code>^</code> start, <code>$</code> end</td></tr>
<tr><td>3</td><td>Extracting</td><td><code>()</code> creates tuples of extracted data</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I understand <code>\d</code>, <code>\w</code>, <code>\s</code>.</p>
<p>• [ ] I can use <code>+</code>, <code>*</code>, and <code>?</code>.</p>
<p>• [ ] I can extract data using capture groups <code>()</code>.</p>
<p><strong>Next Up: Day 19 - Advanced Generators & Iterators</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Regex Basics : Pattern Matching"}, {"anchor": "checks-Regex Basics-3", "title": "\ud83e\uddea Checks: Regex Basics"}, {"anchor": "sec-14", "title": "2. Quantifiers & Anchors : Advanced Patterns"}, {"anchor": "checks-Quantifiers-16", "title": "\ud83e\uddea Checks: Quantifiers"}, {"anchor": "sec-27", "title": "3. Groups & Sets : Extracting Structure"}, {"anchor": "checks-Groups-29", "title": "\ud83e\uddea Checks: Groups"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day19', '⚡ Generators and Iterators', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>Generators are capable of much more than simple iteration. Today we master <code>yield from</code> for recursive pipelines, Coroutines for two-way data streaming (<code>.send()</code>), and the elegant <code>@contextmanager</code> to build our own robust <code>with</code> blocks.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Yield From</td><td>Chaining & recursion</td></tr>
<tr><td>2</td><td>Coroutines</td><td><code>.send()</code> data inwards</td></tr>
<tr><td>3</td><td>Contexts</td><td>Building <code>with</code> blocks</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Advanced Generators : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">yield from & State</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>We''ve learned that <code>yield</code> pauses a function. Advanced generators can yield from OTHER generators using <b><code>yield from</code></b>, allowing you to chain pipelines cleanly. Generators also maintain complex internal state across iterations.</p>
<pre class="nb-code-block"><code>def sub_gen():
    yield 1
    yield 2

def main_gen():
    yield from sub_gen() # Chains the sub-generator seamlessly
    yield 3</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Tree Traversal</strong>: Flattening complex nested JSON structures recursively</p>
<p>• <strong>Data Pipelining</strong>: Chaining multiple generator functions (extract -> transform -> load)</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Infinite Recursion</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>When using <code>yield from</code> recursively, ensure you have a base case that stops yielding, just like standard recursion, to prevent a RecursionError.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1">def flatten_list(nested):
    &quot;&quot;&quot;Recursively flatten a list of lists using yield from&quot;&quot;&quot;
    for item in nested:
        if isinstance(item, list):
            yield from flatten_list(item)  # Delegate to sub-generator
        else:
            yield item

data = [1, [2, 3], [4, [5, 6]]]
flat = list(flatten_list(data))
print(f&quot;Original: {data}&quot;)
print(f&quot;Flattened: {flat}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Yield From-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Yield From</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a generator <code>gen_a()</code> yielding 1, 2. Write <code>gen_b()</code> yielding <code>yield from gen_a()</code> then 3. Test it.</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a generator that yields numbers 1 to 3, then yields from <code>range(4, 6)</code>. Print as list.</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a generator that maintains state: a running total. It takes a list of numbers and yields the running total at each step.</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Try to call <code>len()</code> on a generator. Catch the TypeError. Why doesn''t it work?</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain why <code>yield from</code> is cleaner than <code>for x in sub_gen(): yield x</code>.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Coroutines : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Sending Data to Generators</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Generators don''t just produce data; they can consume it! By using the <b><code>.send()</code></b> method, you can pass data <i>into</i> a paused generator. A generator used this way is called a <b>Coroutine</b>.</p>
<pre class="nb-code-block"><code>def accumulator():
    total = 0
    while True:
        value = yield total # Pauses here, waits for .send()
        total += value</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Event Loops</strong>: Coroutines are the historical foundation of Python''s <code>asyncio</code> for asynchronous programming</p>
<p>• <strong>State Machines</strong>: Building state machines that wait for external inputs to transition states</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Before you can <code>.send()</code> a value into a coroutine, you MUST ''prime'' it by calling <code>next(gen)</code> or <code>gen.send(None)</code> so it reaches the first <code>yield</code> statement.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7">def averager():
    &quot;&quot;&quot;Coroutine that yields the running average&quot;&quot;&quot;
    total = 0.0
    count = 0
    average = None
    while True:
        # Yield the current average, and WAIT for a new term
        term = yield average
        if term is None:
            break
        total += term
        count += 1
        average = total / count

# Usage
coro = averager()
next(coro)  # Prime the coroutine!

print(f&quot;Sent 10, Avg: {coro.send(10)}&quot;)
print(f&quot;Sent 20, Avg: {coro.send(20)}&quot;)
print(f&quot;Sent 30, Avg: {coro.send(30)}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Coroutines-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Coroutines</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Write a coroutine <code>greeter()</code> that waits for a name (<code>yield</code>) and prints <code>"Hello [name]"</code>. Prime it, then send <code>"Alice"</code>.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Modify the averager above. Send <code>5</code>, <code>10</code>, <code>15</code>. Print the final average.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> What happens if you try to <code>send()</code> to a coroutine without calling <code>next()</code> first? Catch the <code>TypeError</code>.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Send <code>None</code> to the averager coroutine above to break the loop. Catch the <code>StopIteration</code>.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Explain how a coroutine differs fundamentally from a standard function (hint: pausing vs returning).</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Context Managers : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Building Your Own ''with''</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>You know how to use <code>with open()</code>. You can build your own Context Managers using the <code>contextlib</code> module and a generator. This is the cleanest way to handle setup and teardown logic.</p>
<pre class="nb-code-block"><code>from contextlib import contextmanager

@contextmanager
def my_timer():
    start = time.time()
    yield # Code inside the &#x27;with&#x27; block runs here
    print(f&#x27;Took {time.time() - start}s&#x27;)</code></pre>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Database Connections</strong>: Yielding a DB connection and ensuring <code>conn.close()</code> happens after the <code>with</code> block</p>
<p>• <strong>Temporary State</strong>: Temporarily changing a directory, then switching back safely</p>
<div class="nb-rich"><h3 style="color: #81C784; background-color: #102414; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>🧠 Pro Tip</b></h3>
<div style="border-left: 4px solid #81C784; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>If an exception occurs inside the <code>with</code> block, it will be raised at the <code>yield</code> statement in your context manager. Wrap the <code>yield</code> in a <code>try/finally</code> to ensure cleanup!</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13">from contextlib import contextmanager
import time

@contextmanager
def timing(label):
    &quot;&quot;&quot;A context manager to measure execution time&quot;&quot;&quot;
    start = time.time()
    try:
        yield  # The indented code runs here!
    finally:
        # This runs when the block finishes (or crashes!)
        end = time.time()
        print(f&quot;{label} took {end - start:.4f} seconds&quot;)

# Usage
with timing(&quot;Loop Test&quot;):
    # Simulate work
    for _ in range(1_000_000):
        pass
    print(&quot;Work done!&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Contextlib-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Contextlib</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>contextmanager</code>. Write a <code>@contextmanager</code> called <code>tag(name)</code> that prints <code><name></code>, yields, then prints <code></name></code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Use your <code>tag("div")</code> in a <code>with</code> block and print <code>"Hello"</code> inside it.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Write a context manager <code>ignore_errors</code> that yields inside a try/except block catching <code>Exception</code>. Use it to ignore <code>1/0</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Why must you use <code>try/finally</code> around the <code>yield</code> in a context manager for resource cleanup?</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Does a context manager have to yield a value? (e.g., <code>yield f</code> vs just <code>yield</code>). Explain.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Recursive File Finder):</strong> Write a generator <code>find_txt_files(path)</code> using <code>pathlib</code>. If a path is a directory, iterate over its children. If a child is a directory, <code>yield from find_txt_files(child)</code>. If it''s a <code>.txt</code> file, <code>yield</code> it.</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Filter Coroutine):</strong> Write a coroutine <code>filter_even(target_list)</code>. In an infinite loop, wait for a value using <code>val = yield</code>. If <code>val</code> is even, append it to <code>target_list</code>.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Custom Open Context):</strong> Write a <code>@contextmanager</code> <code>safe_open(file, mode)</code> that prints ''Opening'', yields the file object, and prints ''Closing'' in a <code>finally</code> block.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Stateful Generator):</strong> Write a generator <code>moving_average(window_size)</code>. It keeps an internal list of the last N values. Yield the average of the list at each step. Test by sending it 1,2,3,4,5.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (HTML Builder):</strong> Write nested context managers to build HTML strings. <code>with tag(''body''): with tag(''h1''): print(''Title'')</code> should result in valid HTML structure.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>What is the <code>yield from</code> keyword used for in Python 3.3+?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Explain how coroutines in Python differ from traditional threads.</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>Write a simple coroutine and explain why you must call <code>next(coro)</code> before sending a value.</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>What happens if a generator used as a context manager does not have a <code>try/finally</code> block and an exception occurs in the <code>with</code> block?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>How do you return a value from a generator (i.e., when <code>StopIteration</code> is raised)?</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>Implement a simple Event Broker using coroutines (subscribers wait for messages via <code>yield</code>).</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>Explain the <code>contextlib.suppress</code> context manager. Write a custom version of it.</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>Write a generator that yields chunks of a specific size from a larger list.</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>What is the difference between implementing a context manager using classes (<code><strong>enter</strong></code>/<code><strong>exit</strong></code>) vs <code>@contextmanager</code>?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>Write a context manager that temporarily redirects <code>sys.stdout</code> to a file.</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Write a coroutine that acts as a grep command: it receives lines of text and prints those that contain a specific substring.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>Explain what <code>generator.throw()</code> does.</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>Explain what <code>generator.close()</code> does and how a generator can catch <code>GeneratorExit</code>.</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>How would you use <code>yield from</code> to flatten a deeply nested dictionary?</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Write a context manager that acquires a lock from the <code>threading</code> module and releases it safely.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>Explain how <code>asyncio</code> built upon the concept of generator-based coroutines.</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>Write a generator that produces an infinite sequence of prime numbers.</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>What is the memory complexity of traversing a massive tree structure using <code>yield from</code>?</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>Write a coroutine <code>broadcast</code> that takes a list of other coroutines and sends any received value to all of them.</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>Explain the performance differences between <code>[x for x in gen]</code> and <code>list(gen)</code>.</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>Write a context manager that temporarily modifies an environment variable and restores it afterward.</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>How do you chain multiple generators together into a data pipeline?</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Write a generator that acts like a sliding window over an iterable.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>Explain why generators cannot be pickled (serialized) natively.</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>Write a <code>@contextmanager</code> to mock a database transaction (print ''begin'', yield, print ''commit'', or ''rollback'' on exception).</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 19 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Yield From</td><td>Flattens nested generator logic effortlessly</td></tr>
<tr><td>2</td><td>Coroutine</td><td>Generators can pause to receive data, not just emit it</td></tr>
<tr><td>3</td><td>Context</td><td><code>@contextmanager</code> makes setup/teardown logic perfectly clean</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I can use <code>yield from</code> to delegate to another generator.</p>
<p>• [ ] I understand how to <code>.send()</code> data to a coroutine.</p>
<p>• [ ] I can write a custom <code>@contextmanager</code>.</p>
<p><strong>Next Up: Day 20 - Phase 1 Capstone Project</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Advanced Generators : yield from & State"}, {"anchor": "checks-Yield From-3", "title": "\ud83e\uddea Checks: Yield From"}, {"anchor": "sec-14", "title": "2. Coroutines : Sending Data to Generators"}, {"anchor": "checks-Coroutines-16", "title": "\ud83e\uddea Checks: Coroutines"}, {"anchor": "sec-27", "title": "3. Context Managers : Building Your Own ''with''"}, {"anchor": "checks-Contextlib-29", "title": "\ud83e\uddea Checks: Contextlib"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb),
('day20', '🏆 Capstone Project', '<div class="nb-section" id="sec-0">
<h2>🎯 Enterprise Objective</h2>
<p>You have mastered Core Python. Today, you prove it. You will build a professional, object-oriented Log Analysis Pipeline that integrates File I/O, Generators, Regex, and JSON. This is the bridge between learning syntax and writing real-world software.</p>
<h3>📋 Strategic Overview</h3>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Concept</th></tr></thead><tbody>
<tr><td>1</td><td>Architecture</td><td>System Design</td></tr>
<tr><td>2</td><td>Implementation</td><td>OOP + Regex</td></tr>
<tr><td>3</td><td>Execution</td><td>Generators + JSON</td></tr>
</tbody></table>
</div>
<div class="nb-section" id="sec-1">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>1. Phase 1 Capstone : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Python Core Mastery</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>You have completed the core Python phase. You understand data structures, control flow, functions, OOP, and file I/O. <b>Today is a pure coding challenge day.</b> No new theory, just application. You will build a complete, robust, object-oriented application from scratch.</p>
<h3>🎯 The Mission: Log Analyzer System</h3>
<p>You will build a system that reads messy server logs, parses them using Regex, cleans them using Comprehensions, models them using OOP, and exports a clean JSON report.</p>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Portfolio Building</strong>: This is a realistic engineering task you can put on your resume</p>
<p>• <strong>Knowledge Integration</strong>: Forces you to use Lists, Dicts, Regex, OOP, and JSON together</p>
<div class="nb-rich"><h3 style="color: #FFB74D; background-color: #2B1A0D; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>⚠️ Blank Page Syndrome</b></h3>
<div style="border-left: 4px solid #FFB74D; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
</div></div>
<p>Don''t freeze. Break the problem into tiny pieces. Write one small function at a time. Test it. Then move to the next.</p>
<div class="code-cell" id="cell-1">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-1'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-1'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-1"># Outline of what you will build:

class LogEntry:
    # Model a single log line
    pass

class LogParser:
    # Read file, extract data via Regex
    pass

class ReportGenerator:
    # Aggregate data and export to JSON
    pass

print(&quot;Are you ready? Let&#x27;s go.&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Capstone-3">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Capstone</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Before coding, plan: What attributes should a <code>LogEntry</code> class have? (e.g., timestamp, level, message).</p></div>
<div class="code-cell" id="cell-2">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-2'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-2'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-2"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> What regex pattern would you use to extract <code>[2023-10-01] ERROR: Disk full</code>?</p></div>
<div class="code-cell" id="cell-3">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-3'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-3'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-3"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> How will you handle missing or corrupt lines in the file? (Hint: try/except).</p></div>
<div class="code-cell" id="cell-4">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-4'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-4'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-4"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> How will you aggregate the data? (Hint: <code>collections.Counter</code> for counting error types).</p></div>
<div class="code-cell" id="cell-5">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-5'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-5'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-5"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Set up your working directory. Create a dummy <code>server.log</code> file with 10 lines of fake data to test against.</p></div>
<div class="code-cell" id="cell-6">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-6'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-6'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-6"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-14">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>2. Capstone Architecture : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">System Design</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>A good system is modular. Let''s design the architecture before writing the full implementation.</p>
<p>1. <strong><code>LogEntry(timestamp, level, message)</code></strong>: A class that uses <code><strong>str</strong></code> for nice printing.</p>
<p>2. <strong><code>parse_line(line)</code></strong>: A function or static method that takes a string, runs regex, and returns a <code>LogEntry</code> (or raises a <code>ValueError</code> if invalid).</p>
<p>3. <strong><code>process_file(path)</code></strong>: A generator that opens the file safely and <code>yields</code> parsed <code>LogEntry</code> objects.</p>
<p>4. <strong><code>generate_report(entries)</code></strong>: A function that takes the generator, counts error levels, and saves to <code>report.json</code>.</p>
<div class="nb-rich"><h3 style="color: #64B5F6; background-color: #0F1A2A; padding: 8px 12px; border-radius: 4px; margin-top: 25px;"><b>💼 Why Data Analysts Care</b></h3></div>
<p>• <strong>Clean Code</strong>: Separation of concerns. The parser shouldn''t write files. The writer shouldn''t parse Regex.</p>
<div class="code-cell" id="cell-7">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-7'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-7'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-7"># Example Regex to test
import re
line = &quot;[2023-12-01 10:00:00] WARN: High memory usage&quot;
pattern = r&quot;\[(.*?)\]\s(\w+):\s(.*)&quot;

match = re.match(pattern, line)
if match:
    ts, level, msg = match.groups()
    print(f&quot;Parsed: Level={level}, Msg={msg}&quot;)</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Architecture-16">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Architecture</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Implement the <code>LogEntry</code> class with an <code><strong>init</strong></code> and <code><strong>repr</strong></code> method.</p></div>
<div class="code-cell" id="cell-8">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-8'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-8'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-8"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Implement the <code>parse_line</code> method using <code>re.match</code>. Return a <code>LogEntry</code>. Raise <code>ValueError</code> if it fails.</p></div>
<div class="code-cell" id="cell-9">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-9'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-9'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-9"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Test <code>parse_line</code> on a valid string and an invalid string. Catch the error.</p></div>
<div class="code-cell" id="cell-10">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-10'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-10'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-10"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Implement <code>process_file(path)</code>. Use <code>with open</code> and a <code>for</code> loop. <code>yield</code> parsed entries, use <code>try/except</code> to ignore bad lines.</p></div>
<div class="code-cell" id="cell-11">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-11'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-11'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-11"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Loop over <code>process_file</code> and print the entries.</p></div>
<div class="code-cell" id="cell-12">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-12'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-12'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-12"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-27">
<div class="nb-rich"><h2 style="color: #000000ff; background-color: #02fff2ff; border-left: 6px solid #0c0c0cff; padding: 12px 15px; margin-top: 40px; border-radius: 4px;">
    <b>3. Capstone Execution : <span style="color: #070707ff; font-size: 0.85em; font-weight: normal;">Putting it Together</span></b>
</h2>
<div style="border-left: 4px solid #4DB6AC; padding-left: 15px; margin: 15px 0; color: #CCCCCC;">
    <b>🔍 What is it?</b><br>
</div></div>
<p>Now integrate the components and produce the final output.</p>
<p>Your final task is to write the aggregator. It should loop over the generator, group messages by their Log Level (e.g., 5 ERRORs, 10 WARNs), and export this summary as beautifully formatted JSON.</p>
<div class="code-cell" id="cell-13">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-13'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-13'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-13"># Example aggregation target format:
# {
#   &quot;total_logs_processed&quot;: 15,
#   &quot;levels&quot;: {
#       &quot;INFO&quot;: 10,
#       &quot;ERROR&quot;: 5
#   }
# }</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="checks-Execution-29">
<div class="nb-rich"><h3 style="color: #C7D2FE; background-color: #0e0e0fff; border-left: 6px solid #6366F1; padding: 12px 15px; margin-top: 50px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 4px 6px rgba(0,0,0,0.3);">
    <b>🧪 Concept Checks: <code>Execution</code></b>
</h3></div>
<div class="question"><p><strong>Q1.</strong> Import <code>collections.Counter</code>.</p></div>
<div class="code-cell" id="cell-14">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-14'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-14'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-14"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q2.</strong> Create a <code>generate_report(entries)</code> function. Initialize counters.</p></div>
<div class="code-cell" id="cell-15">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-15'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-15'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-15"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q3.</strong> Loop through <code>entries</code>. Increment counters based on <code>entry.level</code>.</p></div>
<div class="code-cell" id="cell-16">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-16'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-16'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-16"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q4.</strong> Construct the final dictionary format shown above.</p></div>
<div class="code-cell" id="cell-17">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-17'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-17'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-17"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question"><p><strong>Q5.</strong> Use <code>json.dump(..., indent=4)</code> to save the dictionary to <code>"report.json"</code>.</p></div>
<div class="code-cell" id="cell-18">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-18'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-18'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-18"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="practice">
<div class="section-header gold"><h2>🛠️ Professional Practice Tasks</h2></div>
<p>Theory is useless without muscle memory. Complete these tasks to solidify your understanding.</p>
<div class="question task"><p><strong>Task 1 (Capstone Step 1):</strong> Generate fake log data. Write a script to write 100 random log lines to <code>server.log</code> (mix of INFO, WARN, ERROR, and some garbage lines).</p></div>
<div class="code-cell" id="cell-19">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-19'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-19'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-19"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 2 (Capstone Step 2):</strong> Write the <code>LogEntry</code> class and regex parsing logic. Test it thoroughly.</p></div>
<div class="code-cell" id="cell-20">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-20'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-20'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-20"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 3 (Capstone Step 3):</strong> Write the generator pipeline to read the file efficiently and yield objects.</p></div>
<div class="code-cell" id="cell-21">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-21'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-21'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-21"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 4 (Capstone Step 4):</strong> Write the JSON aggregation logic. Run the full pipeline.</p></div>
<div class="code-cell" id="cell-22">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-22'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-22'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-22"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
<div class="question task"><p><strong>Task 5 (Capstone Step 5):</strong> Refactor. Add type hints (<code>-> str</code>). Add docstrings. Make it look like professional enterprise code.</p></div>
<div class="code-cell" id="cell-23">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-23'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-23'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-23"># Write your answer here</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="interview">
<div class="section-header purple"><h2>💻 Pure Coding Interview Questions</h2></div>
</div>
<div class="nb-section" id="sec-52">
<div class="question interview"><p><strong>Q1.</strong></p>
<h3>How do you approach debugging a system that consists of multiple interacting classes?</h3>
</div>
<div class="code-cell" id="cell-24">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-24'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-24'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-24"># Solution for Q1</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-54">
<div class="question interview"><p><strong>Q2.</strong></p>
<h3>Why did we use a generator to read the file instead of returning a list of all <code>LogEntry</code> objects?</h3>
</div>
<div class="code-cell" id="cell-25">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-25'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-25'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-25"># Solution for Q2</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-56">
<div class="question interview"><p><strong>Q3.</strong></p>
<h3>If the log file was 500GB, how would your code handle it? Would it crash?</h3>
</div>
<div class="code-cell" id="cell-26">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-26'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-26'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-26"># Solution for Q3</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-58">
<div class="question interview"><p><strong>Q4.</strong></p>
<h3>How would you modify this system to read from a continuous stream of logs (like a network socket) instead of a static file?</h3>
</div>
<div class="code-cell" id="cell-27">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-27'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-27'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-27"># Solution for Q4</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-60">
<div class="question interview"><p><strong>Q5.</strong></p>
<h3>Explain the importance of Separation of Concerns in software architecture.</h3>
</div>
<div class="code-cell" id="cell-28">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-28'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-28'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-28"># Solution for Q5</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-62">
<div class="question interview"><p><strong>Q6.</strong></p>
<h3>How would you write unit tests for the <code>parse_line</code> function?</h3>
</div>
<div class="code-cell" id="cell-29">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-29'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-29'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-29"># Solution for Q6</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-64">
<div class="question interview"><p><strong>Q7.</strong></p>
<h3>What edge cases might break your Regex pattern in production?</h3>
</div>
<div class="code-cell" id="cell-30">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-30'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-30'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-30"># Solution for Q7</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-66">
<div class="question interview"><p><strong>Q8.</strong></p>
<h3>How would you handle timezone differences if the logs came from servers in different regions?</h3>
</div>
<div class="code-cell" id="cell-31">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-31'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-31'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-31"># Solution for Q8</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-68">
<div class="question interview"><p><strong>Q9.</strong></p>
<h3>If you needed to store this data permanently, would you choose JSON, CSV, or a Database? Why?</h3>
</div>
<div class="code-cell" id="cell-32">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-32'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-32'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-32"># Solution for Q9</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-70">
<div class="question interview"><p><strong>Q10.</strong></p>
<h3>How would you use Python''s <code>logging</code> module instead of <code>print()</code> statements for debugging this application?</h3>
</div>
<div class="code-cell" id="cell-33">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-33'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-33'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-33"># Solution for Q10</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-72">
<div class="question interview"><p><strong>Q11.</strong></p>
<h3>Explain the tradeoff between using regex vs basic string splitting (<code>.split()</code>) for parsing logs.</h3>
</div>
<div class="code-cell" id="cell-34">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-34'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-34'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-34"># Solution for Q11</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-74">
<div class="question interview"><p><strong>Q12.</strong></p>
<h3>How could you make the file reading multi-threaded if you had to process 100 different log files?</h3>
</div>
<div class="code-cell" id="cell-35">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-35'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-35'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-35"># Solution for Q12</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-76">
<div class="question interview"><p><strong>Q13.</strong></p>
<h3>What is cyclomatic complexity and why should we avoid deep nesting?</h3>
</div>
<div class="code-cell" id="cell-36">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-36'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-36'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-36"># Solution for Q13</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-78">
<div class="question interview"><p><strong>Q14.</strong></p>
<h3>How do you ensure your classes are easily extensible in the future (e.g., adding a <code>CriticalLogEntry</code> type)?</h3>
</div>
<div class="code-cell" id="cell-37">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-37'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-37'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-37"># Solution for Q14</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-80">
<div class="question interview"><p><strong>Q15.</strong></p>
<h3>Explain the Single Responsibility Principle (SRP) from SOLID.</h3>
</div>
<div class="code-cell" id="cell-38">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-38'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-38'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-38"># Solution for Q15</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-82">
<div class="question interview"><p><strong>Q16.</strong></p>
<h3>How would you package this script so another team could <code>pip install</code> it?</h3>
</div>
<div class="code-cell" id="cell-39">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-39'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-39'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-39"># Solution for Q16</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-84">
<div class="question interview"><p><strong>Q17.</strong></p>
<h3>What are Python Type Hints (<code>a: int</code>) and why are they useful in enterprise projects?</h3>
</div>
<div class="code-cell" id="cell-40">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-40'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-40'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-40"># Solution for Q17</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-86">
<div class="question interview"><p><strong>Q18.</strong></p>
<h3>How would you handle a <code>PermissionError</code> when trying to write the <code>report.json</code> file?</h3>
</div>
<div class="code-cell" id="cell-41">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-41'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-41'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-41"># Solution for Q18</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-88">
<div class="question interview"><p><strong>Q19.</strong></p>
<h3>If the JSON export gets too large for memory, how do you stream JSON to a file?</h3>
</div>
<div class="code-cell" id="cell-42">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-42'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-42'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-42"># Solution for Q19</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-90">
<div class="question interview"><p><strong>Q20.</strong></p>
<h3>How do you benchmark the execution speed of your pipeline?</h3>
</div>
<div class="code-cell" id="cell-43">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-43'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-43'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-43"># Solution for Q20</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-92">
<div class="question interview"><p><strong>Q21.</strong></p>
<h3>What is the difference between a functional approach and an OOP approach for this specific log parsing task?</h3>
</div>
<div class="code-cell" id="cell-44">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-44'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-44'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-44"># Solution for Q21</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-94">
<div class="question interview"><p><strong>Q22.</strong></p>
<h3>How would you refactor the code to use <code>pathlib</code> exclusively?</h3>
</div>
<div class="code-cell" id="cell-45">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-45'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-45'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-45"># Solution for Q22</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-96">
<div class="question interview"><p><strong>Q23.</strong></p>
<h3>Explain how you would containerize this script using Docker.</h3>
</div>
<div class="code-cell" id="cell-46">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-46'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-46'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-46"># Solution for Q23</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-98">
<div class="question interview"><p><strong>Q24.</strong></p>
<h3>How would you automate this script to run every midnight? (Cron/Task Scheduler).</h3>
</div>
<div class="code-cell" id="cell-47">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-47'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-47'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-47"># Solution for Q24</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="sec-100">
<div class="question interview"><p><strong>Q25.</strong></p>
<h3>What did you find most challenging about integrating all these Python concepts together?</h3>
</div>
<div class="code-cell" id="cell-48">
<div class="cell-bar"><span class="cell-label">In [ ]:</span><div class="cell-actions"><button class="run-btn" onclick="runCell(''cell-48'')">▶ Run</button><button class="clear-btn" onclick="clearOutput(''cell-48'')">✕ Clear</button></div></div>
<textarea class="cm-source" id="src-48"># Solution for Q25</textarea>
<div class="cell-output hidden"></div></div>
</div>
<div class="nb-section" id="summary">
<div class="section-header cyan"><h2>📊 Day 20 Executive Summary</h2></div>
<table>
<thead><tr><th>#</th><th>Topic</th><th>Key Takeaway</th></tr></thead><tbody>
<tr><td>1</td><td>Planning</td><td>Always separate concerns (Parser vs Writer)</td></tr>
<tr><td>2</td><td>Robustness</td><td>Catch bad data early, don''t let it crash the pipeline</td></tr>
<tr><td>3</td><td>Execution</td><td>Code is useless until it solves a business problem</td></tr>
</tbody></table>
<h2>✅ Instructor''s End-of-Day Checklist</h2>
<p>• [ ] I successfully implemented an OOP architecture.</p>
<p>• [ ] I processed data efficiently using generators.</p>
<p>• [ ] I exported a clean JSON report.</p>
<p><strong>Next Up: Day 21 - NumPy: Vectorized Math & Arrays (Phase 2 Begins!)</strong></p>
</div>', '[{"anchor": "sec-0", "title": "\ud83c\udfaf Enterprise Objective"}, {"anchor": "sec-1", "title": "1. Phase 1 Capstone : Python Core Mastery"}, {"anchor": "checks-Capstone-3", "title": "\ud83e\uddea Checks: Capstone"}, {"anchor": "sec-14", "title": "2. Capstone Architecture : System Design"}, {"anchor": "checks-Architecture-16", "title": "\ud83e\uddea Checks: Architecture"}, {"anchor": "sec-27", "title": "3. Capstone Execution : Putting it Together"}, {"anchor": "checks-Execution-29", "title": "\ud83e\uddea Checks: Execution"}, {"anchor": "practice", "title": "\ud83d\udee0\ufe0f Practice Tasks"}, {"anchor": "interview", "title": "\ud83d\udcbb Interview Questions"}, {"anchor": "sec-52", "title": "Q1."}, {"anchor": "sec-54", "title": "Q2."}, {"anchor": "sec-56", "title": "Q3."}, {"anchor": "sec-58", "title": "Q4."}, {"anchor": "sec-60", "title": "Q5."}, {"anchor": "sec-62", "title": "Q6."}, {"anchor": "sec-64", "title": "Q7."}, {"anchor": "sec-66", "title": "Q8."}, {"anchor": "sec-68", "title": "Q9."}, {"anchor": "sec-70", "title": "Q10."}, {"anchor": "sec-72", "title": "Q11."}, {"anchor": "sec-74", "title": "Q12."}, {"anchor": "sec-76", "title": "Q13."}, {"anchor": "sec-78", "title": "Q14."}, {"anchor": "sec-80", "title": "Q15."}, {"anchor": "sec-82", "title": "Q16."}, {"anchor": "sec-84", "title": "Q17."}, {"anchor": "sec-86", "title": "Q18."}, {"anchor": "sec-88", "title": "Q19."}, {"anchor": "sec-90", "title": "Q20."}, {"anchor": "sec-92", "title": "Q21."}, {"anchor": "sec-94", "title": "Q22."}, {"anchor": "sec-96", "title": "Q23."}, {"anchor": "sec-98", "title": "Q24."}, {"anchor": "sec-100", "title": "Q25."}, {"anchor": "summary", "title": "\ud83d\udcca Executive Summary"}]'::jsonb, '["cell-1", "cell-2", "cell-3", "cell-4", "cell-5", "cell-6", "cell-7", "cell-8", "cell-9", "cell-10", "cell-11", "cell-12", "cell-13", "cell-14", "cell-15", "cell-16", "cell-17", "cell-18", "cell-19", "cell-20", "cell-21", "cell-22", "cell-23", "cell-24", "cell-25", "cell-26", "cell-27", "cell-28", "cell-29", "cell-30", "cell-31", "cell-32", "cell-33", "cell-34", "cell-35", "cell-36", "cell-37", "cell-38", "cell-39", "cell-40", "cell-41", "cell-42", "cell-43", "cell-44", "cell-45", "cell-46", "cell-47", "cell-48"]'::jsonb)
ON CONFLICT (day_id) DO UPDATE SET
  title = EXCLUDED.title,
  html_body = EXCLUDED.html_body,
  sections = EXCLUDED.sections,
  cells = EXCLUDED.cells;