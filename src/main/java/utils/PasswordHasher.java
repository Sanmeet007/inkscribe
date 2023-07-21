package utils;

import org.apache.commons.codec.digest.DigestUtils;

import db.DbConfig;

public class PasswordHasher {
    public static String generateHash(String password) {
        return DigestUtils.sha256Hex(DbConfig.getSalt() + password);
    }
}
