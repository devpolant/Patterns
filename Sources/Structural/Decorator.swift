
public class DecoratorTest {
    
    public static func test() {
        print("========== Decorator ==========")
        
        let italianPizza = ItalianPizza()
        let tomatoPizza = TomatoPizza(pizza: italianPizza)
        print(tomatoPizza.description)
    }
}


//MARK: - Decorator
class PizzaDecorator: Pizza {
    
    var pizza: Pizza
    init(name: String, pizza: Pizza) {
        self.pizza = pizza
        super.init(name: name)
    }
}
//MARK: - ConcreteDecorator
class TomatoPizza: PizzaDecorator {
    init(pizza: Pizza) {
        super.init(name: pizza.name + ", with tomatoes", pizza: pizza)
    }
    override var price: Double {
        return pizza.price + 3
    }
}
class CheesePizza: PizzaDecorator {
    init(pizza: Pizza) {
        super.init(name: pizza.name + ", with cheese", pizza: pizza)
    }
    override var price: Double {
        return pizza.price + 5
    }
}


//MARK: - Component
class Pizza {
    
    var name: String
    var price: Double {
        return 0
    }
    
    init(name: String) {
        self.name = name
    }
    
    var description: String { return "\(name), price=\(price)" }
}

//MARK: - Concrete Component
class ItalianPizza: Pizza {
    init() {
        super.init(name: "Italian Pizza")
    }
    override var price: Double {
        return 10
    }
}
class BulgerianPizza: Pizza {
    init() {
        super.init(name: "Bulgerian Pizza")
    }
    override var price: Double {
        return 8
    }
}

