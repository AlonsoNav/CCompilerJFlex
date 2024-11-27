package semantic.Translator;

import java.util.ArrayList;
import java.util.List;

public class PilaS {
    
    //lista de registros
    private List<RS> pilaS;

    public PilaS() {
        this.pilaS = new ArrayList<>();
    }

    public void clear() {
        pilaS.clear();
    }


    // va a guardar en la posicion 0 de la pila
    public void push(String value) {
        pilaS.add(new RS(value, "", ""));
    }



    public void push_end(String value)
    {
        pilaS.add(pilaS.size(), new RS(value, "", ""));
    }

    /*public void pop() {
        pilaS.remove(0);
    }*/

    // Elimina y devuelve el elemento del tope de la pila
    public RS pop() {
        if (pilaS.isEmpty()) {
            throw new IllegalStateException("La pila está vacía");
        }
        return pilaS.remove(pilaS.size() - 1);
    }
    
    // Elimina y devuelve el elemento del tope de la pila (equivalente a pop)
    public void popTope() {
        try {
            pilaS.remove(pilaS.size() - 1);
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Error: La pila está vacía");
        }
    }

    // Devuelve el elemento del tope de la pila sin eliminarlo
    public RS peek() {
        if (pilaS.isEmpty()) {
            throw new IllegalStateException("La pila está vacía");
        }
        return pilaS.get(pilaS.size() - 1);
    }



    //imprimir la pila
    public void printPila() {
        System.out.println("Pila S:");
        for (int i = 0; i < pilaS.size(); i++) {
            System.out.println("Registro: " + pilaS.get(i).getValue());
        }
    }


}
