import groovy.grape.Grape

eventStatusFinal = {
    msg ->

    Grape.grab(group:"org.apache.ant", module:"ant-jsch", version:"1.8.1", classLoader:this.class.classLoader.rootLoader)
    Grape.grab(group:"com.jcraft", module:"jsch", version:"0.1.42", classLoader:this.class.classLoader.rootLoader)
    def ant = new AntBuilder()
    ant.scp(localFile:'/Users/sunsam/workspace/potato/potato_business/target/potato.war',
            port:'23654',
            remoteTodir:"root@122.226.100.47:/opt/wars/potato.war",
            password:"dudu#folmos#0123456")
//    println 'start'
//    def process = "/Users/sunsam/workspace/potato/potato_business/scripts/deploy.sh".execute()
//    println 'start2'
//    process.waitFor()
//    println 'start3'
//    process.in.eachLine { line ->
//        println line
//    }
}