package app;

import scanner.CLexer;
import parser.Parser;  // Importa el parser generado por CUP
import parser.ParseNode;
import java_cup.runtime.Symbol;  // Importa la clase Symbol generada por CUP
import java.io.FileReader;
import java.io.IOException;

public class PruebaParser {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java app.PruebaParser <input-file>");
            System.exit(1);
        }

        String inputFile = args[0];

        try {
            // Inicializa el escáner (CLexer) con el archivo de entrada
            CLexer lexer = new CLexer(new FileReader(inputFile));
        
            // Inicializa el parser con el escáner
            Parser parser = new Parser(lexer);
            
            // Llama al método parse para realizar el análisis sintáctico
            System.out.println("Starting parsing process...");
            
            ParseNode parseTree = (ParseNode) parser.parse().value;
            System.out.println("Árbol de Parseo:");
            parseTree.printTree("", true);
            
            /*
            Symbol parseTreeSymbol = parser.parse();  // Realiza el análisis y obtiene el símbolo del árbol de parsing
        
            // Obtiene el valor de RESULT desde el parseTreeSymbol
            Object resultValue = parseTreeSymbol.value;
        
            // Imprime el resultado de RESULT
            System.out.println("Parsing completed successfully!");
            System.out.println("Resultado (RESULT) de la expresión: " + resultValue);*/
        
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // Captura errores durante el análisis sintáctico
            System.err.println("Parsing error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
