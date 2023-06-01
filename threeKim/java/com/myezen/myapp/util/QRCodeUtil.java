package com.myezen.myapp.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;

/**
 * QRCodeUtil은 URL을 입력으로 받아 QR 코드 이미지를 생성하는 유틸리티 클래스입니다.
 */

public class QRCodeUtil {

    /**
     * 주어진 URL을 기반으로 QR 코드 이미지를 생성합니다.
     *
     * @param url    QR 코드에 포함될 URL
     * @param width  생성할 QR 코드의 가로 크기
     * @param height 생성할 QR 코드의 세로 크기
     * @return 생성된 QR 코드 이미지를 바이트 배열로 반환
     */
    public String generateQRCode(String url, int width, int height) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            // QR 코드 생성
            BitMatrix bitMatrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height);

            // QR 코드 이미지를 위한 BufferedImage 생성
            BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            // 그래픽스 컨텍스트 가져오기
            Graphics2D graphics = (Graphics2D) bufferedImage.getGraphics();

            // 배경을 흰색으로 설정
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, width, height);

            // QR 코드를 검은색으로 설정
            graphics.setColor(Color.BLACK);
            for (int x = 0; x < width; x++) {
                for (int y = 0; y < height; y++) {
                    if (bitMatrix.get(x, y)) {
                        graphics.fillRect(x, y, 1, 1);
                    }
                }
            }

            // BufferedImage를 바이트 배열로 변환하여 출력 스트림에 작성
            ImageIO.write(bufferedImage, "png", baos);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 이미지 바이트 배열을 Base64로 인코딩된 문자열로 변환
        byte[] imageBytes = baos.toByteArray();
        return Base64.getEncoder().encodeToString(imageBytes);
    }
}
