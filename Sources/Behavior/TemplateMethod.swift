
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
