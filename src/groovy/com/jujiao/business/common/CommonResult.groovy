package com.jujiao.business.common

class CommonResult<T> {

    T data
    CommonResultStatus result = CommonResultStatus.SUCCESS
    int currentPage
    int recordsTotal
    int recordsFiltered

    public enum CommonResultStatus{
        SUCCESS,FAIL
    }


}
