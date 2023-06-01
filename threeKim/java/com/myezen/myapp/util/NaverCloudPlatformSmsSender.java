package com.myezen.myapp.util;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class NaverCloudPlatformSmsSender {
	private static final String ACCESS_KEY = "9ThdTfh2xB3GVeQQQQCz";
    private static final String SECRET_KEY = "2mioSxQ8Z8SWtyeB3lvFx9us5svK4eonzudb472T";
    private static final String SERVICE_ID = "ncp:sms:kr:308560238965:threekim";
    private static final String API_URL = "https://sens.apigw.ntruss.com/sms/v2/services/" + SERVICE_ID + "/messages";

    public static void sendVerificationCode(String phoneNumber, String verificationCode) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("x-ncp-apigw-timestamp", String.valueOf(System.currentTimeMillis()));
        headers.set("x-ncp-iam-access-key", ACCESS_KEY);
        headers.set("x-ncp-apigw-signature-v2", generateSignature());

        Map<String, Object> body = new HashMap<>();
        body.put("type", "SMS");
        body.put("contentType", "COMM");
        body.put("countryCode", "82");
        body.put("from", "01056309412"); // 발신자 번호 설정
        body.put("to", phoneNumber);
        body.put("content", "Verification code: " + verificationCode);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(API_URL, HttpMethod.POST, request, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            // SMS 전송 성공 시 처리할 로직
        } else {
            // SMS 전송 실패 시 처리할 로직
        }
    }
    
    private static String generateSignature() {
        String method = "POST";
        String timestamp = String.valueOf(System.currentTimeMillis());

        String space = " ";                    // 공백
        String newLine = "\n";                  // 줄바꿈
        String url = "/sms/v2/services/" + SERVICE_ID + "/messages"; // URL

        String message = new StringBuilder()
                .append(method)
                .append(space)
                .append(url)
                .append(newLine)
                .append(timestamp)
                .append(newLine)
                .append(ACCESS_KEY)
                .toString();

        try {
            SecretKeySpec signingKey = new SecretKeySpec(SECRET_KEY.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);
            byte[] rawHmac = mac.doFinal(message.getBytes(StandardCharsets.UTF_8));
            String signature = Base64.getEncoder().encodeToString(rawHmac);
            return signature;
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
}
