package app;

import scanner.CLexer;
import parser.Parser;  
import java_cup.runtime.Symbol;  
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import semantic.Var;
import semantic.SymbolTable;

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
            System.out.println("Parsing process finished successfully!");

            /*HashMap<String, Object> symbolTable = parser.getSymbolTable();
            System.out.println("\nTabla de Símbolos:");
            for (String key : symbolTable.keySet()) {
                System.out.println("Variable: " + key + " - Tipo: " + symbolTable.get(key));
            }*/

            SymbolTable symbolTable = parser.getSymbolTable();
            symbolTable.printTable();

            String code = parser.code;
            System.out.println("\nCódigo generado:");
            System.out.println(code);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Parsing error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
