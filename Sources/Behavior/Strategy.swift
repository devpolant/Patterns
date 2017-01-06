
public class StrategyTest {
    
    public static func test() {
        print("========== Strategy ==========")
        
        let car = Car(movable: PetrolMove())
        car.move()
        
        car.movable = ElectricMove()
        car.move()
    }
}

//MARK: - Abstract Strategy
protocol Movable {
    func move()
}

//MARK: - Concrete Strategy
class ElectricMove: Movable {
    func move() {
        print("move using electric power")
    }
}
class PetrolMove: Movable {
    func move() {
        print("move using petrol power")
    }
}

//MARK: - Context
class Car {
    
    var movable: Movable
    
    init(movable: Movable) {
        self.movable = movable
    }
    
    func move() {
        movable.move()
    }
}
