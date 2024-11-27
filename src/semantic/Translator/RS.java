package semantic.Translator;

public class RS {
    
    private String value;
    private String code;
    private String type;

    public RS(String value, String code, String type) {
        this.value = value;
        this.code = code;
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public String getCode() {
        return code;
    }

    public String getType() {
        return type;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
