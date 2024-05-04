package translator;

import java.util.Stack;
import slu.compiler.*;

/*
 *  Syntax-directed definition to translate infix arithmetic expressions into postfix notation
 *
 *     translator  -> { postfix = "" } expression { print(postfix) }
 *
 *     expression  -> expression + term { postfix = postfix + "+" } |
 *                    expression - term { postfix = postfix + "-" }
 *                    term
 *
 *     term        -> term * factor { postfix = postfix + "*" } |
 *                    term / factor { postfix = postfix + "/" } |
 *                    term % factor { postfix = postfix + "%" } |
 *                    factor
 *
 *     factor      -> (expression) |
 *                    num { postfix = postfix + num.value }
 *
 *  Right-recursive SDD for a top-down recursive predictive parser
 *
 *     translator  -> { postfix = "" } expression { print(postfix) }
 *
 *     expression  -> term moreTerms
 *
 *     moreTerms   -> + term { postfix = postfix + "+" } moreTerms |
 *                    - term { postfix = postfix + "-" } moreTerms |
 *                    epsilon
 *
 *     term        -> factor moreFactors
 *
 *     moreFactors -> * factor { postfix = postfix + "*" } moreFactors |
 *                    / factor { postfix = postfix + "/" } moreFactors |
 *                    % factor { postfix = postfix + "%" } moreFactors |
 *                    epsilon
 *
 *     factor      -> (expression) |
 *                    num { postfix = postfix + num.value }
 *
 *
 *  The expression 9 - 5 + 2 * 3 is translated into 9 5 - 2 3 * +
 *
 */

public class PostfixTranslator implements IPostfixTranslator {
    private IToken token;
    private ILexicalAnalyzer scanner;

    private Stack<Integer> stack;
    private String postfix;

    public PostfixTranslator(ILexicalAnalyzer lex) {
        this.scanner = lex;
        this.token = this.scanner.getToken();
        this.stack = new Stack<Integer>();
    }

    public String translate() throws Exception {
        this.postfix = "";

        expression();

        return this.postfix;
    }

    public int evaluate() throws Exception {
        if (this.stack.empty())
            throw new Exception("\nSyntax error, the expression cannot be evaluated!");

        return this.stack.pop();
    }

    private void expression() throws Exception {
        term(); moreTerms();
    }

    private void term() throws Exception {
        factor(); moreFactors();
    }

    private void moreTerms() throws Exception{
        if (this.token.getName().equals("add")) {

            match("add");

            term();

            this.postfix = this.postfix + "+";

            int x = this.stack.pop();
            int y = this.stack.pop();

            this.stack.push(y+x);

            moreTerms();
        }  else if (this.token.getName().equals("subtract")){
            match("subtract");

            term();

            this.postfix = this.postfix + "-";

            int x = this.stack.pop();
            int y = this.stack.pop();

            this.stack.push(y-x);

            moreTerms();
        }
    }

    private void factor() throws Exception {
        if (this.token.getName().equals("open_parenthesis")) {

            match("open_parenthesis");

            expression();

            match("closed_parenthesis");

        } else if (this.token.getName().equals("int")) {

            IntegerNumber number = (IntegerNumber) this.token;

            this.postfix = this.postfix + ((this.postfix.length() == 0) ? "" : " ") + number.getValue() + " ";
            this.stack.push(number.getValue());

            match("int");

        } else {

            throw new Exception("\nError at line " + this.scanner.getLine() + ": invalid arithmetic expression: open parenthesis or int expected");

        }
    }

    private void moreFactors() throws Exception{
        if (this.token.getName().equals("multiply")) {

            match("multiply");

            factor();

            this.postfix = this.postfix + "*";

            int x = this.stack.pop();
            int y = this.stack.pop();

            this.stack.push(y * x);

            moreFactors();
        }  else if (this.token.getName().equals("divide")){
            match("divide");

            factor();

            this.postfix = this.postfix + "/";

            int x = this.stack.pop();
            int y = this.stack.pop();

            this.stack.push(y/x);

            moreFactors();

    }else if (this.token.getName().equals("remainder")){
        match("remainder");

        factor();

        this.postfix = this.postfix + "%";

        int x = this.stack.pop();
        int y = this.stack.pop();

        this.stack.push(y % x);

        moreFactors();
    }
}

    // code of the top-down recursive predictive parser: moreTerms, factor, moreFactors

    private void match(String tokenName) throws Exception {
        if (this.token.getName().equals(tokenName))
            this.token = this.scanner.getToken();
        else
            throw new Exception("\nError at line " + this.scanner.getLine() + ", " + this.scanner.getLexeme(tokenName) + " expected");
    }

}