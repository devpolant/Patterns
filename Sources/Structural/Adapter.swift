
public class AdapterTest {
    
    public static func test() {
        print("========== Adapter ==========")
        
        let driver = Driver()
        driver.travel(on: Auto())
        
        let camel = Camel()
        
        let camelTransportAdapter = CamelToTransportAdapter(camel: camel)
        driver.travel(on: camelTransportAdapter)
    }
}

//MARK: - Client
class Driver {
    func travel(on transport: Transport) {
        transport.drive()
    }
}

//MARK: - Target
protocol Transport {
    func drive()
}

class Auto: Transport {
    func drive() {
        print("Auto driving")
    }
}

//MARK: - Adaptee
protocol Animal {
    func move()
}

class Camel: Animal {
    func move() {
        print("Camel moving")
    }
}

//MARK: - Adapter
class CamelToTransportAdapter: Transport {
    
    var camel: Camel
    
    init(camel: Camel) {
        self.camel = camel
    }
    
    func drive() {
        camel.move()
    }
}

