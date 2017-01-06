
public class CommandTest {
    
    public static func test() {
        print("========== Command ==========")
        
        let tv = TV()
        let pult = Pult()
        pult.command = TVOnCommand(tv: tv)
        
        pult.pressButton()
        pult.pressUndo()
        pult.pressButton()
        pult.pressUndo()
    }
}


//MARK: - Command
protocol Command {
    func execute()
    func undo()
}

//MARK: - Receiver
class TV {
    
    //MARK: Operations
    func on() {
        print("TV did ON")
    }
    func off() {
        print("TV did OFF")
    }
}

//MARK: - Concrete Command
class TVOnCommand: Command {
    
    var tv: TV
    init(tv: TV) {
        self.tv = tv
    }
    
    func execute() {
        tv.on()
    }
    func undo() {
        tv.off()
    }
}

//MARK: - Invoker
class Pult {
    
    var command: Command?
    
    func pressButton() {
        command?.execute()
    }
    
    func pressUndo() {
        command?.undo()
    }
}

