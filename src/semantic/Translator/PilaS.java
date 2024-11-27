package semantic.Translator;

import java.util.LinkedList;
import java.util.ListIterator;

public class PilaS {
    
    private LinkedList<RS> pilaS;

    public PilaS() {
        this.pilaS = new LinkedList<RS>();
    }

    public void push(RS register) {
        pilaS.push(register);
    }

    public RS pop() {
        return pilaS.pop();
    }

    public RS peek() {
        return pilaS.peek();
    }

    public int size() {
        return pilaS.size();
    }

    public Boolean searchContext(String context) {
        ListIterator<RS> iterator = pilaS.listIterator(pilaS.size());
        while (iterator.hasPrevious()) {
            RS register = iterator.previous();
            if (register.getType().equals(context)) {
                return true;
            }
        }
        return false;
    }
}
