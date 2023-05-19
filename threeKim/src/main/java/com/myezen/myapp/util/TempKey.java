package com.myezen.myapp.util;

import java.util.Random;
//2023-05-19
public class TempKey{//인증번호를 보낼 때 사용할 클래스이다. 이 클래스를 호출할 때는 몇 자리 수로 할 건지 사이즈를 파라미터로 보내면 된다.
	//여러 블로그들을 보니 실제 이메일을 보내는 코드에 아래 코드를 넣는 경우도 많았다. 하지만 나는 각 클래스나 메서드를 각자의 역할에 맞게 코드를 분리했고, 추후 비밀번호 찾기를 할 때도 위 클래스를 사용할 것이기 때문에 따로 분리를 해줬다!
    private boolean lowerCheck;
    private int size;

    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init() {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num  = 0;
        do {
            num = ran.nextInt(75) + 48;
            if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char) num);
            } else {
                continue;
            }
        } while (sb.length() < size);
        if (lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }
}