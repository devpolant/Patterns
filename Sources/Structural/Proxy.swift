
public class ProxyTest {
    
    public static func test() {
        print("========== Proxy ==========")
        
        let proxy = Proxy()
        proxy.request()
    }
}


protocol Subject {
    func request()
}

class RealSubject: Subject {
    func request() {
        print("request in real subject")
    }
}

class Proxy: Subject {
    
    var realSubject: RealSubject?
    
    func request() {
        if realSubject == nil {
            realSubject = RealSubject()
        }
        realSubject?.request()
    }
}
