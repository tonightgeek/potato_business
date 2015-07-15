package com.jujiao.business.web

import com.jujiao.business.utils.OrderSeriesUtils
import org.apache.commons.logging.LogFactory


class OrderSeriesRefreshJob {

    private static final log = LogFactory.getLog(this)
    static triggers = {
        cron name:'cronTrigger', cronExpression: '0 0 1 * * ?'
    }

    def execute() {
        try {
            OrderSeriesUtils.clearOrderSeries()
            log.error("success:clear order seraries ")
        } catch (Exception e) {
            log.error("error:clear order seraries ")
        }
    }
}
