package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;

public class StreamReader {

    public static String read(InputStream stream) {
        Scanner s = new Scanner(stream);
        s.useDelimiter("\\A");
        String contents = s.hasNext() ? s.next() : "";
        s.close();
        return contents;
    }

    public static byte[] getBytes(InputStream stream) throws IOException {
        return stream.readAllBytes();
    }

}
