
public class SingletonTest {
    public static func test() {
        print("========== Singleton ==========")
        
        ServiceManager.shared.doSomething()
        ServiceManager.shared.doSomething()
    }
}

class ServiceManager {
    
    static let shared = { ServiceManager() }()
    private init() { print("ServiceManager init") }
    
    func doSomething() { }
}
