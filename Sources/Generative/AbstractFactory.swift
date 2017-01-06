public class AbstractFactoryTest {
    
    public static func test() {
        print("========== Abstract Factory ==========")
        
        let hero = Hero(factory: VoidFactory())
        hero.run()
        hero.hit()
    }
}

//MARK: - Abstract Factory
protocol HeroFactory {
    func createWeapon() -> Weapon
    func createMovement() -> Movement
}
//MARK: - Abstract Products
protocol Weapon {
    func hit()
}
protocol Movement {
    func move()
}

//MARK: - Conctete Products
class Arbalet: Weapon {
    func hit() {
        print("Arbalet hit")
    }
}
class Sword: Weapon {
    func hit() {
        print("Sword hit")
    }
}
class FlyMovement: Movement {
    func move() {
        print("Flying")
    }
}
class RunMovement: Movement {
    func move() {
        print("Running")
    }
}

//MARK: - Concrete Factory
class ElfFactory: HeroFactory {
    func createWeapon() -> Weapon {
        return Arbalet()
    }
    func createMovement() -> Movement {
        return FlyMovement()
    }
}

class VoidFactory: HeroFactory {
    func createWeapon() -> Weapon {
        return Sword()
    }
    func createMovement() -> Movement {
        return RunMovement()
    }
}

//MARK: - Client
class Hero {
    
    var movement: Movement
    var weapon: Weapon
    
    init(factory: HeroFactory) {
        self.movement = factory.createMovement()
        self.weapon = factory.createWeapon()
    }
    
    func run() {
        movement.move()
    }
    
    func hit() {
        weapon.hit()
    }
}




