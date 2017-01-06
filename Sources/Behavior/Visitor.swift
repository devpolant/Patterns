import Foundation

public class VisitorTest {
    
    public static func test() {
        print("========== Visitor ==========")
        
        let structure = Bank()
        structure.add(Person(name: "Person One", number: "1234 1234 1234 1234"))
        structure.add(Person(name: "Person Two", number: "1234 1234 1234 1234"))
        structure.add(Company(name: "Company One", regNumber: "123456789", number: "1234 1234 1234 1234"))
        
        structure.accept(visitor: HtmlVisitor())
        structure.accept(visitor: XmlVisitor())
    }
}


//MARK: - Object Structure
class Bank {
    var accounts = [Account]()
    
    func add(_ account: Account) {
        accounts.append(account)
    }
    
    func remove(_ account: Account) {
        let index = accounts.index(where: { $0 == account })
        guard let elementIndex = index else { return }
        
        accounts.remove(at: elementIndex)
    }
    
    func accept(visitor: Visitor) {
        for account in accounts {
            account.accept(visitor: visitor)
        }
    }
}

//MARK: - Visitor
protocol Visitor {
    func visitPersonAccount(_ person: Person)
    func visitCompanyAccount(_ company: Company)
}

//MARK: - Concrete Visitor
class HtmlVisitor: Visitor {
    func visitPersonAccount(_ person: Person) {
        var result = "<table><tr><td>Свойство<td><td>Значение</td></tr>";
        result += "<tr><td>Name<td><td>" + person.name + "</td></tr>";
        result += "<tr><td>Number<td><td>" + person.number + "</td></tr></table>";
        print(result);
    }
    func visitCompanyAccount(_ company: Company) {
        var result = "<table><tr><td>Свойство<td><td>Значение</td></tr>";
        result += "<tr><td>Name<td><td>" + company.name + "</td></tr>";
        result += "<tr><td>RegNumber<td><td>" + company.regNumber + "</td></tr></table>";
        result += "<tr><td>Number<td><td>" + company.number + "</td></tr></table>";
        print(result);
    }
}

class XmlVisitor: Visitor {
    func visitPersonAccount(_ person: Person) {
        let result = "<Company><Name>" + person.name + "</Name>" +
            "<Number>" + person.number + "</Number><Company>";
        print(result);
    }
    func visitCompanyAccount(_ company: Company) {
        let result = "<Company><Name>" + company.name + "</Name>" +
            "<RegNumber>" + company.regNumber + "</RegNumber>" +
            "<Number>" + company.number + "</Number><Company>";
        print(result);
    }
}


//MARK: - Element
class Account: NSObject {
    func accept(visitor: Visitor) {}
}

//MARK: - Concrete Element
class Person: Account {
    
    var name: String
    var number: String
    
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }

    override func accept(visitor: Visitor) {
        visitor.visitPersonAccount(self)
    }
}

class Company: Account {
    
    var name: String
    var regNumber: String
    var number: String
    
    init(name: String, regNumber: String, number: String) {
        self.name = name
        self.regNumber = regNumber
        self.number = number
    }
    
    override func accept(visitor: Visitor) {
        visitor.visitCompanyAccount(self)
    }
}
