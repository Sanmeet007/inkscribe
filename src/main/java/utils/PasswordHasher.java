package utils;

import java.security.MessageDigest;

import db.DbConfig;

public class PasswordHasher {
    public static String genrateHash(String password) throws Exception {
        MessageDigest encryptor = MessageDigest.getInstance("MD5");
        byte[] digest = encryptor.digest((DbConfig.getSalt() + password).getBytes("UTF-8"));
        return digest.toString();
    }
}
