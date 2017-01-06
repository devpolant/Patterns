
public class PrototypeTest {
    
    public static func test() {
        print("========== Prototype ==========")
        
        let client = Client()
        client.operation()
    }
}


//MARL: - Prototype
protocol Figure {
    func clone() -> Figure
    func getInfo()
}

//MARK: - Concrete Protootype
class Rectangle: Figure {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func getInfo() {
        print("w=\(width), h=\(height)")
    }
    
    func clone() -> Figure {
        return Rectangle(width: width, height: height)
    }
}

//MARK: - Client
class Client {
    
    func operation() {
        
        let rect1 = Rectangle(width: 20, height: 30)
        rect1.getInfo()
        
        let rect2 = rect1.clone()
        rect2.getInfo()
    }
}


