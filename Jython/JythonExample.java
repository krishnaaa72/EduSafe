package MASTER.Jython;

//JythonExample.java
import org.python.util.PythonInterpreter;

public class JythonExample {
 public static void main(String[] args) {
     // Initialize the Python interpreter
     PythonInterpreter interpreter = new PythonInterpreter();

     // Execute Python code directly
     interpreter.exec("print('Hello from Python inside Java using Jython!')");

     // Python variable manipulation
     interpreter.exec("x = 10");
     interpreter.exec("y = 20");
     interpreter.exec("z = x + y");
     interpreter.exec("print('The sum of x and y is:', z)");
     
     // You can also define functions
     interpreter.exec("def greet(name):");
     interpreter.exec("    return 'Hello, ' + name");
     interpreter.exec("result = greet('Java User')");
     interpreter.exec("print(result)");
 }
}
