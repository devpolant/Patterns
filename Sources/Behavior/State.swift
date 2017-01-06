
public class StateTest {
    
    public static func test() {
        print("========== State ==========")
        
        let water = Water(state: SolidWaterState())
        water.heat()
        water.heat()
        water.heat()
        water.frost()
    }
}

/*
 *  Отличие от Strategy в том, что в State передается объект Context, а в Strategy - нет.
 *  В целом же, UML диаграммы одинаковы.
 */

//MARK: - Abstract State
protocol WaterState {
    func heat(water: Water)
    func frost(water: Water)
}

//MARK: - Concrete State
class SolidWaterState: WaterState {
    
    func heat(water: Water) {
        print("Превращаем лед в жидкость")
        water.state = LiquidWaterState()
    }
    func frost(water: Water) {
        print("Продолжаем заморозку льда")
    }
}
class LiquidWaterState: WaterState {
    
    func heat(water: Water) {
        print("Превращаем жидкость в пар")
        water.state = GasWaterState()
    }
    func frost(water: Water) {
        print("Превращаем жидкость в лед")
        water.state = SolidWaterState()
    }
}
class GasWaterState: WaterState {
    
    func heat(water: Water) {
        print("Повышаем температуру водяного пара")
    }
    func frost(water: Water) {
        print("Превращаем водяной пар в жидкость")
        water.state = LiquidWaterState()
    }
}

//MARK: - Context
class Water {
    
    var state: WaterState
    
    init(state: WaterState) {
        self.state = state
    }
    
    func heat() {
        self.state.heat(water: self)
    }
    
    func frost() {
        self.state.frost(water: self)
    }
}


