package stackmachine.compiler.sp3;

public class TestProgram {

    interface IStackMachineCompiler {
        void compile(String inputFileName, String outputFileName) throws Exception;
    }
    static class StackMachineCompiler implements IStackMachineCompiler {
        public void compile(String inputFileName, String outputFileName) throws Exception {
            System.out.println("Compiling " + inputFileName + " to " + outputFileName);
        }
    }
    public void testFactorial() {
        assertCompilation("program factorial 10.txt", "sm factorial 10.txt");
    }
    public void testFactorialArray() {
        assertCompilation("program factorial 10 array.txt", "sm factorial 10 array.txt");
    }
    public void testFibonacciArray() {
        assertCompilation("program fibonacci 20 array.txt", "sm fibonacci 20 array.txt");
    }

    public void testNewtonSqrt() {
        assertCompilation("program Newton sqrt.txt", "sm Newton sqrt.txt");
    }

    public void testBinarySearch() {
        assertCompilation("program binary search.txt", "sm binary search.txt");
    }

    public void testBinarySearchBoolean() {
        assertCompilation("program binary search boolean.txt", "sm binary search boolean.txt");
    }

    private void assertCompilation(String inputFileName, String outputFileName) {
        try {
            IStackMachineCompiler stackMachineCompiler = new StackMachineCompiler();
            stackMachineCompiler.compile(inputFileName, outputFileName);
            System.out.println("'" + inputFileName + "' compiled successfully!");
        } catch (Exception e) {
            System.out.println("Compilation failed for '" + inputFileName + "': " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        TestProgram testProgram = new TestProgram();
        testProgram.runTests();
    }

    private void runTests() {
        testFactorial();
        testFactorialArray();
        testFibonacciArray();
        testNewtonSqrt();
        testBinarySearch();
        testBinarySearchBoolean();
    }
}
