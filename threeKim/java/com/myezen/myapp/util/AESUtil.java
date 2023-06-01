package com.myezen.myapp.util;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class AESUtil {
//AES알고리즘으로 암호화 복호화 
    private static final String SECRET_KEY = "0123456789abcdef"; // 128비트 키 (16바이트)

    public static String encrypt(String plainText) throws Exception {//암호화
        SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(StandardCharsets.UTF_8), "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding"); // AES 암호화를 위한 알고리즘과 패딩 설정
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8)); // 평문을 바이트 배열로 변환하여 암호화 수행
        return Base64.getEncoder().encodeToString(encryptedBytes); // 암호화된 바이트 배열을 Base64로 인코딩하여 문자열로 반환
    }

    public static String decrypt(String encryptedText) throws Exception {//복호화
        SecretKeySpec secretKey = new SecretKeySpec(SECRET_KEY.getBytes(StandardCharsets.UTF_8), "AES");
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding"); // AES 복호화를 위한 알고리즘과 패딩 설정
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] encryptedBytes = Base64.getDecoder().decode(encryptedText); // Base64로 인코딩된 문자열을 복호화하여 바이트 배열로 변환
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes); // 암호화된 바이트 배열을 복호화하여 평문 바이트 배열 획득
        return new String(decryptedBytes, StandardCharsets.UTF_8); // 복호화된 평문 바이트 배열을 문자열로 반환
    }
}
