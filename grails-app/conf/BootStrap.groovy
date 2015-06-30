import com.jujiao.business.Member
import com.jujiao.business.Orders
import grails.converters.JSON

class BootStrap {

    def init = { servletContext ->

        Member.deleteAll()
        Orders.deleteAll()
        if (Orders.count() == 0) {
            def member = new Member().save()

            15.times { i ->
                def obj = [code         : '1000' + i.toString(), totalPrice: 10001+i, address: '梅川路', phone: '18621'
                           , contactName: '孙先生', sendDate: new Date(), member: member] as Orders
                obj.save()
            }
        }
    }
    def destroy = {

    }
}
