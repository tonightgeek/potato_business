package com.jujiao.business.utils

import java.util.concurrent.atomic.AtomicInteger

class OrderSeriesUtils {

    private static AtomicInteger orderSeries = new AtomicInteger(0)


    public static int increaseAndGetOrderSeries() {
        return orderSeries.incrementAndGet()
    }

    public static int clearOrderSeries() {
        return orderSeries.set(0)
    }

    public static int getOrderSeries() {
        return orderSeries.get()
    }
}
