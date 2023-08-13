package utils;

import org.pegdown.PegDownProcessor;

public class MarkdownConverter {
    private static PegDownProcessor processor = new PegDownProcessor();

    public static String toHtml(String markdownText) {
        return processor.markdownToHtml(markdownText);
    }
}
