
//MARK: - Client

public class BridgeTest {
    
    public static func test() {
        print("========== Bridge ==========")
        
        let programmer = CorporateProgrammer(language: CPPLanguage())
        programmer.doWork()
        programmer.earnMoney()
        
        programmer.language = CSharpLanguage()
        programmer.doWork()
        programmer.earnMoney()
    }
}

//MARK: - Abstraction
class Programmer {
    
    //MARK: Implementor
    var language: Language
    
    init(language: Language) {
        self.language = language
    }
    
    func doWork() {
        language.build()
        language.execute()
    }
    
    func earnMoney() {}
}

//MARK: - RefinedAbstraction
class FreelanceProgrammer: Programmer {
    override func earnMoney() {
        print("Получаем оплату за выполненный заказ")
    }
}
class CorporateProgrammer: Programmer {
    override func earnMoney() {
        print("Получаем в конце месяца зарплату")
    }
}


//MARK: - Implementor
protocol Language {
    func build()
    func execute()
}

//MARK: - Concrete Implementors
class CPPLanguage: Language {
    func build() {
        print("С помощью компилятора C++ компилируем программу в бинарный код")
    }
    func execute() {
        print("Запускаем исполняемый файл программы")
    }
}
class CSharpLanguage: Language {
    func build() {
        print("С помощью компилятора Roslyn компилируем исходный код в файл exe")
    }
    func execute() {
        print("JIT компилирует программу бинарный код")
        print("CLR выполняет скомпилированный бинарный код")
    }
}
