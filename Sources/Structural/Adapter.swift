/*
 Паттерн Адаптер (Adapter) предназначен для преобразования интерфейса одного класса в интерфейс другого. Благодаря реализации данного паттерна мы можем использовать вместе классы с несовместимыми интерфейсами.
 
 Когда надо использовать Адаптер?
 
 1) Когда необходимо использовать имеющийся класс, но его интерфейс не соответствует потребностям
 
 2) Когда надо использовать уже существующий класс совместно с другими классами, интерфейсы которых не совместимы
 */

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

