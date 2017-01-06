
/*
 Шаблонный метод (Template Method) определяет общий алгоритм поведения подклассов, позволяя им переопределить отдельные шаги этого
 алгоритма без изменения его структуры.
 
 Когда использовать шаблонный метод?
 
 1) Когда планируется, что в будущем подклассы должны будут переопределять различные этапы алгоритма без изменения его структуры.
 
 2) Когда в классах, реализующим схожий алгоритм, происходит дублирование кода. Вынесение общего кода в шаблонный метод уменьшит его дублирование в подклассах.
 */

public class TemplateMethodTest {
    
    public static func test() {
        print("========== Template Method ==========")
        
        let school = School()
        school.learn()
        
        let university = University()
        university.learn()
    }
}

//MARK: - Abstract Class
class Education {
    
    final func learn() {
        enter()
        study()
        getDocument()
    }
    func enter() {}
    func study() {}
    func getDocument() {}
}

//MARK: - Concrete Class
class University: Education {
    
    override func enter() {
        print("Enter University")
    }
    override func study() {
        print("Study in University")
    }
    override func getDocument() {
        print("Get Diploma")
    }
}

class School: Education {
    
    override func enter() {
        print("Enter School")
    }
    override func study() {
        print("Study in School")
    }
    override func getDocument() {
        print("Get Attestat")
    }
}
