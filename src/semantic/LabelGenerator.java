package semantic;

public class LabelGenerator {
    private static int counter = 0;

    public static String generateLabel() {
        return "E_" + counter++;
    }
}
