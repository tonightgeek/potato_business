import com.jujiao.business.Goods
import com.jujiao.business.Member
import com.jujiao.business.Orders
import grails.converters.JSON

class BootStrap {

    def init = { servletContext ->
//
        def goodsList = Goods.list()
        goodsList.each {
            it.delete(flush: true)
        }
        def memberList = Member.list()
        memberList.each {
            it.delete(flush: true)
        }

        def ordersList = Orders.list()
        ordersList.each {
            it.delete(flush: true)
        }

        new Goods(goodsCode:'10002',
                goodName:'切片',price:100f,description:'好吃的',sendScope:'内环',iconPath:'icon').save()

        if (Orders.count() == 0) {
            def member = new Member().save(flush:true)

            15.times { i ->
                def obj = [code         : '1000' + i.toString(), totalPrice: 10001 + i, address: '梅川路', phone: '18621'
                           , contactName: '孙先生', sendDate: new Date(), member: member,orderStatus:Orders.OrderStatus.PLACE] as Orders
                obj.save()
            }
        }
    }
    def destroy = {

    }
}
