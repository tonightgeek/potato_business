package com.jujiao.business.utils

import java.util.concurrent.atomic.AtomicInteger

class OrderReminderUtils {

    private static AtomicInteger orderReminderCount = new AtomicInteger(0)


    public static void increaseReminder() {
        orderReminderCount.incrementAndGet()
    }

    public static void clearReminderCount() {
        orderReminderCount.set(0)
    }

    public static int getReminderCount() {
        return orderReminderCount.get()
    }
}
