
public class MementoTest {
    
    public static func test() {
        print("========== Mediator ==========")
        
        let hero = HeroUnit()
        hero.shoot()
        
        let history = GameHistory()
        history.history.append(hero.saveState())
        
        hero.shoot()
        
        hero.restoreState(from: history.history.popLast()!)
        hero.shoot()
    }
}

//MARK: - Ordinator
class HeroUnit {
    
    var patrons = 10
    var lives = 5
 
    func shoot() {
        if patrons > 0 {
            patrons -= 1
        }
    }
    
    func saveState() -> HeroMemento {
        return HeroMemento(patrons: patrons, lives: lives)
    }
    
    func restoreState(from memento: HeroMemento) {
        patrons = memento.patrons
        lives = memento.lives
    }
}

//MARK: - Memento
class HeroMemento {
    
    var patrons: Int
    var lives: Int
    
    init(patrons: Int, lives: Int) {
        self.patrons = patrons
        self.lives = lives
    }
}

//MARK: - CareTaker
class GameHistory {
    var history = [HeroMemento]()
}


