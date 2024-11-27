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
        //System.out.println("Agregando variable '" + name + "' de tipo '" + type + "' en el contexto '" + context + "' en la línea " + line );
        List<Var> variables = new ArrayList<>();
        if( funcion != null){
            context = "local";
            if (varExists(name)) {
                variables = getVar(name);
                
                if(variables.size() == 1){
                    String contextoV = getVarContext(name);
                    if(contextoV.equals("global")){
                        symbolTable.add(0, new Var(name, type, context, line,categoria,  funcion));
                    }
                    else{
                        System.out.println("Error semántico en la linea "+ line + ": la variable local '" + name + "' ya existe.");
                    }
                }
                else{
                    for (Var var : variables) {
                        
                        //if(contextoV.equals("global")){
                            if (var.getFuncion().equals(funcion)) {
                                System.out.println("Error semántico en la linea "+ line + ": la variable local '" + name + "' ya existe.");
                                break;
                            }
                            /*else{
                                symbolTable.add(0, new Var(name, type, context, line, funcion));
                            }*/
                        /* }
                        else{
                            System.out.println("Error semántico en la linea "+ line + ": la variable local'" + name + "' ya existe.");
                        }*/
                    }
                    symbolTable.add(0, new Var(name, type, context, line,categoria,  funcion));
                }
                
            } else {
                symbolTable.add(0, new Var(name, type, context, line, categoria, funcion));
            }
        }
        else {
            if (varExists(name)) {
                System.out.println("Error semántico en la linea "+ line + ": la variable '" + name + "' ya existe.");
            } else {
                symbolTable.add(0, new Var(name, type, context, line, categoria, funcion));
            }
        }
        
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
            if (var.getName().equals(name) && (var.getContext().equals("global") || var.getFuncion() == null)) {
                return true;
            }
        }
        return false;
    }

    // Obtiene una variable de la tabla de símbolos



    //Imprime todas las variables
    public void printTable() {

        System.out.println("Tabla de símbolos:");
        for (Var var : symbolTable) {
            System.out.println("Identificador: " + var.getName() + ", Tipo: " + var.getType() + ", Categoria:" + var.getCategoria() + ", Contexto: " + var.getContext() + ", Línea: " + var.getLine());
        }
    }
}