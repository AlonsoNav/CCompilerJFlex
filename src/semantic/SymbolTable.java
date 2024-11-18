package semantic;

import java.util.HashMap;

public class SymbolTable {

    private HashMap<String, Var> symbolTable; // HashMap para los símbolos

    public SymbolTable() {
        this.symbolTable = new HashMap<>();
    }

    // Agrega una variable cuando esta se inicializa
    public void addVar(String name, String type, String context, int line) {
        //System.out.println("Agregando variable '" + name + "' de tipo '" + type + "' en el contexto '" + context + "' en la línea " + line );
        if (symbolTable.containsKey(name)) {
            System.out.println("Error: Error en la linea "+ line + " la variable '" + name + "' ya existe.");
        } else {
            symbolTable.put(name, new Var(name, type, context, line));
        }
    }

    //Imprime todas las variables
    public void printTable() {
        System.out.println("Tabla de símbolos:");
        for (String clave : symbolTable.keySet()) {
            System.out.println("Identificador: " + clave + ", Valor: " + symbolTable.get(clave));
        }
    }
}