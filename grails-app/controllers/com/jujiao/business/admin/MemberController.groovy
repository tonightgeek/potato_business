package com.jujiao.business.admin

import com.jujiao.business.Member
import com.jujiao.business.admin.dto.MemberDto
import com.jujiao.business.common.CommonResult
import grails.converters.JSON
import org.apache.commons.logging.LogFactory

class MemberController {

    private static final log = LogFactory.getLog(this)

    static namespace = "admin"

    def mobile() {
        CommonResult<MemberDto> result = new CommonResult<MemberDto>()

        try {
            def member = Member.findByMobile(params.mobile)
            if (member) {
                def m = [userName: member.userName, address: member.address] as MemberDto
                result.data = m
            }
        }
        catch (Exception e) {
            result.result=CommonResult.CommonResultStatus.FAIL
            log.error(e)
        }

        render result as JSON
    }
}
