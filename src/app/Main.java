package app;

import scanner.CLexer;
import scanner.Token;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Usage: java app.Main <input-file>");
            System.exit(1);
        }

        String inputFile = args[0];

        try {
            CLexer lexer = new CLexer(new FileReader(inputFile));
            while (lexer.yylex() != null) { // proccess the tokens and terminate when eof
                
            }
            Map<String, Token> tokenTable = lexer.getTokenTable();
            System.out.println("Si entró y " + tokenTable.size());
            for (Map.Entry<String, Token> entry : tokenTable.entrySet()) {
                Token tokenInfo = entry.getValue();
                System.out.print(entry.getKey() + " -> " + tokenInfo.type + " -> ");
                for (Map.Entry<Integer, Integer> lineEntry : tokenInfo.lines.entrySet()) {
                    int count = lineEntry.getValue();
                    if (count == 1) 
                        System.out.print(lineEntry.getKey() + ", ");
                    else
                        System.out.print(lineEntry.getKey() + "(" + lineEntry.getValue() + "), ");
                }
                System.out.println();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }   
    }
}