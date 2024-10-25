package app;

import scanner.CLexer;
import parser.Parser;  // Importa el parser generado por CUP
import java_cup.runtime.Symbol;  // Importa la clase Symbol generada por CUP
import java.io.FileReader;
import java.io.IOException;

public class PruebaParser {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java app.Main <input-file>");
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
            Symbol parseTree = parser.parse();  // El árbol de parseo puede ser usado más tarde si lo deseas
            System.out.println("Parsing completed successfully!");

            // Aquí puedes agregar lógica para mostrar resultados adicionales si lo deseas
            // Ejemplo: mostrar el árbol de parseo u otros detalles
            System.out.println("Parse tree: " + parseTree);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // Captura errores durante el análisis sintáctico
            System.err.println("Parsing error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
