
//MARK: - Client
public class FlyweightTest {
    
    public static func test() {
        print("========== Flyweight ==========")
        
        let factory = HouseFactory()
        for _ in 0..<10 {
            let house = factory["Brick"]
            house?.build(latitude: 0, longitude: 0)
        }
    }
}

//MARK: - Flyweight
class HouseModel {
    var stages: Int = 0
    
    func build(latitude: Double, longitude: Double) {
    }
}

class BlockHouse: HouseModel {
    override init() {
        super.init()
        self.stages = 16
    }
    override func build(latitude: Double, longitude: Double) {
        print("\(latitude) \(longitude)")
    }
}
class BrickHouse: HouseModel {
    override init() {
        super.init()
        self.stages = 5
    }
    override func build(latitude: Double, longitude: Double) {
        print("\(latitude) \(longitude)")
    }
}

class HouseFactory {
    var houses = [String: HouseModel]()
    init() {
        houses["Brick"] = BrickHouse()
        houses["Block"] = BlockHouse()
    }
    
    subscript(key: String) -> HouseModel? {
        return houses[key]
    }
}
