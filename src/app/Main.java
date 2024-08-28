package app;

import scanner.CLexer;
import scanner.Token;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;

public class Main {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java app.Main <input-file>");
            System.exit(1);
        }

        String inputFile = args[0];

        try {
            CLexer lexer = new CLexer(new FileReader(inputFile));
            System.out.println("Errors: ");
            while (lexer.yylex() != null) { // proccess the tokens and terminate when eof
                
            }
            Map<String, Token> tokenTable = lexer.getTokenTable();
            
            // Encabezado de la tabla
            String format = "| %-10s | %-15s | %-40s |%n";
            String separator = "+------------+-----------------+------------------------------------------+";

            System.out.println(separator);
            System.out.printf(format, "Token", "Tipo de Token", "Linea");
            System.out.println(separator);

            // Imprimir cada token
            for (Map.Entry<String, Token> entry : tokenTable.entrySet()) {
                Token tokenInfo = entry.getValue();

                // Usar TreeMap para asegurar que las líneas estén ordenadas
                Map<Integer, Integer> sortedLines = new TreeMap<>(tokenInfo.lines);
                StringBuilder linesInfo = new StringBuilder();

                for (Map.Entry<Integer, Integer> lineEntry : sortedLines.entrySet()) {
                    int line = lineEntry.getKey();
                    int count = lineEntry.getValue();
                    if (count == 1) {
                        linesInfo.append(line).append(", ");
                    } else {
                        linesInfo.append(line).append("(").append(count).append("), ");
                    }
                }

                // Remover la última coma y espacio
                if (linesInfo.length() > 0) {
                    linesInfo.setLength(linesInfo.length() - 2);
                }

                // Imprimir la fila del token
                System.out.printf(format, entry.getKey(), tokenInfo.type, linesInfo.toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }   
    }
}