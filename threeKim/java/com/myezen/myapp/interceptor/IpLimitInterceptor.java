package com.myezen.myapp.interceptor;


import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.myezen.myapp.util.IPUtil;


public class IpLimitInterceptor extends HandlerInterceptorAdapter {

    private static final Map<String, Integer> ipMap = new ConcurrentHashMap<>(); // 수정: ConcurrentHashMap의 값 타입을 Integer로 변경

    private int ipLimitInterval;

    public void setIpLimitInterval(int ipLimitInterval) {
        this.ipLimitInterval = ipLimitInterval;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String ipAddress = IPUtil.getClientIP(request); // 수정: IPUtil로부터 클라이언트 IP 얻기
        Integer midx = (Integer) request.getSession().getAttribute("midx"); // 수정: 세션에서 midx 얻기

        if (midx != null && isDuplicatedIpAddress(ipAddress, midx)) {
            // 중복된 아이피인 경우 처리
        	System.out.println("중복된 아이피인 경우 처리");
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Duplicate IP address");
            return false;
        }
        System.out.println("조회수 증가 처리");
        return true;
    }

    private boolean isDuplicatedIpAddress(String ipAddress, int midx) {
        if (ipMap.containsKey(ipAddress)) {
            int existingMidx = ipMap.get(ipAddress);
            if (existingMidx != midx) {
                // 중복된 IP 주소이며, 다른 사용자의 IP 주소
                return true;
            }
        }

        ipMap.put(ipAddress, midx);

        return false;
    }
}
