package app;

import scanner.CLexer;
import scanner.Token;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

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

            // Sort tokens by type and then by lexeme
            List<Map.Entry<String, Token>> tokenList = new ArrayList<>(tokenTable.entrySet());
            Comparator<Map.Entry<String, Token>> tokenComparator = new Comparator<Map.Entry<String, Token>>() {
                @Override
                public int compare(Map.Entry<String, Token> entry1, Map.Entry<String, Token> entry2) {
                    int typeComparison = entry1.getValue().type.compareTo(entry2.getValue().type);
                    if (typeComparison != 0) {
                        return typeComparison;
                    }
                    return entry1.getKey().compareTo(entry2.getKey());
                }
            };

            Collections.sort(tokenList, tokenComparator);

            // Table header
            String format = "| %-10s | %-15s | %-40s |%n";
            String separator = "+------------+-----------------+------------------------------------------+";

            System.out.println(separator);
            System.out.printf(format, "Token", "Tipo de Token", "Linea");
            System.out.println(separator);


            int maxLineLenght = 40; //max line lenght of the line column

            // Print each token
            for (Map.Entry<String, Token> entry : tokenList) {
                Token tokenInfo = entry.getValue();

                // Use TreeMap to ensure that lines are ordered
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

                // Remove the last comma and space
                if (linesInfo.length() > 0) {
                    linesInfo.setLength(linesInfo.length() - 2);
                }

                // Split the line column in multiple lines if it is too long
                String lineOutput = linesInfo.toString();
                int start = 0; // Start index of the substring
                boolean firstLine = true;
                while (start < lineOutput.length()) {
                    int end = Math.min(start + maxLineLenght, lineOutput.length());
                    String linePart = lineOutput.substring(start, end);

                    if (firstLine) {
                        System.out.printf(format, entry.getKey(), tokenInfo.type, linePart);
                        firstLine = false;
                    } else {
                        System.out.printf(format,"", "", linePart);
                    }
                    start = end;
                }
                System.out.println(separator);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }   
    }
}