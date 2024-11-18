package semantic;


// Clase que define las variables que se van a guardar en la tabla de símbolos
public class Var {

    private String name;
    private String type;
    private String context;
    private int line;


    // Constructor de la clase
    /*public Var() {
        this.name = "";
        this.type = "";
        this.context = "";
        this.line = 0;
        this.column = 0;
    }*/

    
    public Var(String name, String type, String context, int line) {
        this.name = name;
        this.type = type;
        this.context = context;
        this.line = line;
        
    }


    @Override
    public String toString() {
        return "Variable: " +
            "Name='" + name + '\'' +
            ", Type='" + type + '\'' +
            ", Context='" + context + '\'' +
            ", Line=" + line; 
    }


}
