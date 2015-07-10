import com.jujiao.business.Goods
import com.jujiao.business.Member
import com.jujiao.business.Orders
import grails.converters.JSON

class BootStrap {

    def init = { servletContext ->
        def goodsList = Goods.list()
        goodsList.each {
            it.delete(flush: true)
        }


        new Goods(goodsCode:'10002',
                goodName:'切片',price:100f,description:'好吃的',sendScope:'内环',iconPath:'icon').save()
    }
    def destroy = {

    }
}
