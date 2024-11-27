package semantic.Translator;

import java.util.ArrayList;

public class RS {
    private String value;
    private String type;
    private ArrayList<String> labels;

    public RS(String value, String type) {
        this.value = value;
        this.type = type;
        this.labels = new ArrayList<String>();
    }

    public String getValue() {
        return value;
    }

    public String getType() {
        return type;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void addLabel(String label) {
        labels.add(label);
    }

    public String getLabel(int index) {
        return labels.get(index);
    }
}
