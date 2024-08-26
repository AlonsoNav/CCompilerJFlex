package app;

import scanner.CLexer;
import scanner.Tokens;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java app.Main <input-file>");
            System.exit(1);
        }

        String inputFile = args[0];

        try {
            CLexer lexer = new CLexer(new FileReader(inputFile));
            Tokens token;
            while ((token = lexer.yylex()) != null) {
                System.out.println("Token: " + token);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}