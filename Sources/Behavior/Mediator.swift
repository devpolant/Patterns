/*
 Паттерн Посредник (Mediator) представляет такой шаблон проектирования, который обеспечивает взаимодействие множества объектов без необходимости ссылаться друг на друга. Тем самым достигается слабосвязанность взаимодействующих объектов.
 
 Когда используется паттерн Посредник?
 
 1) Когда имеется множество взаимосвязаных объектов, связи между которыми сложны и запутаны.
 
 2) Когда необходимо повторно использовать объект, однако повторное использование затруднено в силу сильных связей с другими объектами.
 */

import Foundation

public class MediatorTest {
    
    public static func test() {
        print("========== Mediator ==========")
        
        let managerMediator = ManagerMediator()
        
        let programmer = ProgrammerColleague(mediator: managerMediator)
        let customer = CustomerColleague(mediator: managerMediator)
        let tester = TesterColleague(mediator: managerMediator)
        
        managerMediator.customer = customer
        managerMediator.programmer = programmer
        managerMediator.tester = tester
        
        customer.sendMessage("Есть заказ, надо сделать программу")
        programmer.sendMessage("Программа готова, надо протестировать")
        tester.sendMessage("Программа протестирована и готова к продаже")
    }
}


//MARK: - Mediator
protocol Mediator {
    func sendMessage(_ message: String, from colleague: Colleague)
}
//MARK: - Colleague
class Colleague: NSObject {
    
    var mediator: Mediator
    
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
    func sendMessage(_ message: String) {
        mediator.sendMessage(message, from: self)
    }
    
    func notify(message: String) {
    }
}

//MARK: - Concrete Colleague
class CustomerColleague: Colleague {
    override func notify(message: String) {
        print("Message to Customer: \(message)")
    }
}
class ProgrammerColleague: Colleague {
    override func notify(message: String) {
        print("Message to Programmer: \(message)")
    }
}
class TesterColleague: Colleague {
    override func notify(message: String) {
        print("Message to Tester: \(message)")
    }
}

//MARK: - Concrete Mediator

class ManagerMediator: Mediator {
    
    var customer: CustomerColleague?
    var programmer: ProgrammerColleague?
    var tester: TesterColleague?
    
    func sendMessage(_ message: String, from colleague: Colleague) {
        
        // если отправитель - заказчик, значит есть новый заказ
        // отправляем сообщение программисту - выполнить заказ
        if colleague == customer {
            programmer?.notify(message: message)
        } else if colleague == programmer {
            tester?.notify(message: message)
        } else if colleague == tester {
            customer?.notify(message: message)
        }
    }
}

