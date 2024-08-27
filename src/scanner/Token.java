package scanner;

import java.util.HashMap;
import java.util.Map;

public class Token {
    public String token;
    public TokenType type;
    public Map<Integer, Integer> lines;

    public Token(String token, TokenType type) {
        this.token = token;
        this.type = type;
        this.lines = new HashMap<>();
    }

    public void addOccurrence(int line) {
        this.lines.put(line, this.lines.getOrDefault(line, 0) + 1);
    }
}