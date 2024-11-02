package app;

import scanner.CLexer;
import parser.Parser;  
import java_cup.runtime.Symbol;  
import java.io.FileReader;
import java.io.IOException;

public class ParserMain {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java app.PruebaParser <input-file>");
            System.exit(1);
        }

        String inputFile = args[0];

        try {
            CLexer lexer = new CLexer(new FileReader(inputFile));
            Parser parser = new Parser(lexer);
            
            System.out.println("Starting parsing process...");
            Object result = parser.parse().value;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Parsing error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
