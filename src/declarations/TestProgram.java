package declarations;
import slu.compiler.*;

public class TestProgram {

    public static void main(String[] args) {
        IToken tokenName;
        boolean showTokens = true;

        String program = "void main { int a, b, c, d; float x, y, z; boolean halt; }";

        try {

            if (showTokens) {
                ILexicalAnalyzer scanner = new LexicalAnalyzer(program);

                do {
                    tokenName = scanner.getToken();

                    System.out.println("<" + tokenName.toString() + ">");

                } while (!tokenName.getName().equals("end_program"));

                System.out.println("");
            }

            SyntaxAnalyzer parser = new SyntaxAnalyzer( new LexicalAnalyzer(program) );

            parser.compile();

            System.out.println("The symbol table \n\n" + parser.symbolTable());

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}