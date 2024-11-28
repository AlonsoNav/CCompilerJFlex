package semantic;

import java.util.ArrayList;
import java.util.List;

public class SymbolTable {

    private List<Var> symbolTable;

    public SymbolTable() {
        this.symbolTable = new ArrayList<>();
    }

    // Agrega una variable cuando esta se inicializa
    public void addVar(String name, String type, String context, int line, String categoria, String funcion) {
        for (Var var : symbolTable) {
            if (((var.getFuncion() != null && var.getFuncion().equals(funcion)) || (var.getFuncion() == null && funcion == null)) && var.getName().equals(name)) {
                System.out.println("Error semántico en la linea "+ line + ": la variable local '" + name + "' ya existe.");
                return;
            }  
        }
        symbolTable.add(0, new Var(name, type, context, line, categoria, funcion));
    }


    // da el contexto de la variable
    public String getVarContext(String name) {
        for (Var var : symbolTable) {
            if (var.getName().equals(name)) {
                return var.getContext();
            }
        }
        return null;
    }

    // da las variables con el mismo nombre
    public List getVar(String name) {
        List<Var> variablesMN = new ArrayList<>();
        for (Var var : symbolTable) {
            if (var.getName().equals(name)&& var.getContext().equals("local")) {
                variablesMN.add(var);
            }
        }
        return  variablesMN;
    }



    // Verifica si una variable ya existe
    public boolean varExists(String name) {
        
        for (Var var : symbolTable) {
            if (var.getName().equals(name)) {
                return true;
            }
        }
        return false;
    }

    // Obtiene una variable de la tabla de símbolos
    public String getVarName(String name){
        for (Var var : symbolTable) {
            if (var.getName().equals(name)) {
                String newName = name;
                if (var.getFuncion() != null) {
                    newName = var.getFuncion() + "." + name;
                }
                return newName;
            }
        }
        return null;
    }



    //Imprime todas las variables
    public void printTable() {

        System.out.println("Tabla de símbolos:");
        for (Var var : symbolTable) {
            System.out.println("Identificador: " + var.getName() + ", Tipo: " + var.getType() + ", Categoria: "+ var.getCategoria()+ ", Contexto: " + var.getContext() + ", Línea: " + var.getLine() + ", Función: " + var.getFuncion());
        }
    }
}