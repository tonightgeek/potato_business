package com.jujiao.business.common

import javax.servlet.http.Cookie
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

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

    /**
     * 增加cookie值
     * @param response
     * @param cookiename
     * @param cookievalue
     * @param path
     * @param maxSecond
     */
    public static final void addCookie(HttpServletResponse response,
                                       String cookiename, String cookievalue, String path, int maxSecond) {
        Cookie cookie = new Cookie(cookiename, cookievalue);
        cookie.setPath(path);
        cookie.setMaxAge(maxSecond);
        cookie.setHttpOnly(true);//防止修改
        response.addCookie(cookie);
    }

    /**
     * 获取cookie
     * @param request
     * @param cookiename
     * @return
     */
    public static final Cookie getCookie(HttpServletRequest request, String cookiename) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null)
            return null;
        for (Cookie cookie : cookies) {
            if (cookiename.equals(cookie.getName())) {
                return cookie;
            }
        }
        return null;
    }

    public static final String getCookieValue(HttpServletRequest request,
                                              String cookiename) {
        Cookie cookie = getCookie(request, cookiename);
        if (cookie == null)
            return null;
        return cookie.getValue();
    }
}
