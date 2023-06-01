package com.myezen.myapp.util;
import java.util.HashMap;
import java.util.Map;

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
    private static final String API_URL = "https://sens.apigw.ntruss.com";
    private static final String API_VERSION = "v1";
    private static final String API_URL_SMS = API_URL + "/" + API_VERSION + "/sms";

    public static void sendVerificationCode(String phoneNumber, String verificationCode) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("X-NCP-APIGW-API-KEY-ID", ACCESS_KEY);
        headers.set("X-NCP-APIGW-API-KEY", SECRET_KEY);

        Map<String, Object> body = new HashMap<>();
        body.put("type", "SMS");
        body.put("contentType", "COMM");
        body.put("countryCode", "82");
        body.put("from", "01056309412");
        body.put("to", phoneNumber);
        body.put("content", "Verification code: " + verificationCode);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(API_URL_SMS, HttpMethod.POST, request, String.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            // SMS 전송 성공 시 처리할 로직
        } else {
            // SMS 전송 실패 시 처리할 로직
        }
    }
}
