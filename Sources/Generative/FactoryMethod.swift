
public class FactoryMethodTest {
    
    public static func test() {
        print("========== Factory Method ==========")
        
        let dev = WoodDeveloper()
        _ = dev.create()
    }
}

//Product
class House {
}
//ConcreteProductA
class PanelHouse: House {
    override init() {
        print("PanelHouse init")
    }
}
//ConcreteProductB
class WoodHouse: House {
    override init() {
        print("WoodHouse init")
    }
}

//Creator
protocol Developer {
    func create() -> House
}
//ConcreteCreatorA
class PanelDeveloper: Developer {
    func create() -> House {
        return PanelHouse()
    }
}
//ConcreteCreatorB
class WoodDeveloper: Developer {
    func create() -> House {
        return WoodHouse()
    }
}
