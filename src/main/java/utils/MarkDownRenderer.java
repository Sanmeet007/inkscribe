package utils;

import org.pegdown.PegDownProcessor;

public class MarkDownRenderer {
    private static PegDownProcessor processor = new PegDownProcessor();

    public static String toHtml(String markdownText) {
        return processor.markdownToHtml(markdownText);
    }
}
