package com.jujiao.business.common

class CommonUtils {


    public static String generateSixCode() {
        StringBuffer result = new StringBuffer()

        def a = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'a', 'b', 'c', 'd', 'e', 'f'
                 , 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v'
                 , 'w', 'x', 'y', 'z', '0']
        for (int i = 0; i < 6; i++) {
            Double number = Math.random() * (a.size() - 1);
            result.append(a[number.intValue()]);
        }
        return result.toString()
    }
}
