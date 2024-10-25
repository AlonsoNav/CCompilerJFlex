package parser;

import java.util.ArrayList;
import java.util.List;

public class ParseNode {
    public String value; // el valor del nodo (e.g., operador o número)
    public List<ParseNode> children; // lista de hijos para el nodo

    public ParseNode(String value) {
        this.value = value;
        this.children = new ArrayList<>();
    }

    public void addChild(ParseNode child) {
        children.add(child);
    }

    // Método para imprimir el árbol con identación
    public void printTree(String prefix) {
        System.out.println(prefix + value);
        for (ParseNode child : children) {
            child.printTree(prefix + "  ");
        }
    }
}
