/*
 Цепочка Обязанностей (Chain of responsibility) - поведенческий шаблон проектирования, который позволяет избежать жесткой привязки отправителя запроса к получателю, позволяя нескольким объектам обработать запрос. Все возможные обработчики запроса образуют цепочку, а сам запрос перемещается по этой цепочке, пока один из ее объектов не обработает запрос. Каждый объект при получении запроса выбирает, либо обработать запрос, либо передать выполнение запроса следующему по цепочке.
 
 Когда применяется цепочка обязанностей?
 
 1) Когда имеется более одного объекта, который может обработать определенный запрос
 
 2) Когда надо передать запрос на выполнение одному из нескольких объект, точно не определяя, какому именно объекту
 
 3) Когда набор объектов задается динамически
 
 "+":
 - Ослабление связанности между объектами. Отправителю и получателю запроса ничего не известно друг о друге.
    Клиенту неизветна цепочка объектов, какие именно объекты составляют ее, как запрос в ней передается.
 
 - В цепочку с легкостью можно добавлять новые типы объектов, которые реализуют общий интерфейс.
 - Преимуществом цепочки является и то, что она позволяет расположить последовательность объектов-обработчиков в ней
    в зависимости от их приоритета.
 
 "-":
 - никто не гарантирует, что запрос в конечном счете будет обработан. Если необходимого обработчика в цепочки не оказалось, 
    то запрос просто выходит из цепочки и остается необработанным.
 */

public class ChainOfResponsibilityTest {
    
    public static func test() {
        print("========== Chain Of Responsibility ==========")
        
        let receiver = Receiver(bankTransfer: false, moneyTransfer: false, paypalTransfer: true)
        
        let bankHandler = BankPaymentHandler()
        let paypalHandler = PaypalPaymentHandler()
        let moneyHandler = MoneyPaymentHandler()
        
        bankHandler.successor = paypalHandler
        paypalHandler.successor = moneyHandler
        
        bankHandler.handle(receiver: receiver)
    }
}

class Receiver {
    
    var bankTransfer: Bool
    var moneyTransfer: Bool
    var paypalTransfer: Bool
    
    init(bankTransfer: Bool, moneyTransfer: Bool, paypalTransfer: Bool) {
        self.bankTransfer = bankTransfer
        self.moneyTransfer = moneyTransfer
        self.paypalTransfer = paypalTransfer
    }
}

//MARK: Handler
class PaymentHandler {
    
    var successor: PaymentHandler?
    
    func handle(receiver: Receiver) {}
}

class BankPaymentHandler: PaymentHandler {
    
    override func handle(receiver: Receiver) {
        if receiver.bankTransfer {
            print("Handle bank transfer")
        } else {
            successor?.handle(receiver: receiver)
        }
    }
}
class MoneyPaymentHandler: PaymentHandler {
    
    override func handle(receiver: Receiver) {
        if receiver.moneyTransfer {
            print("Handle money transfer")
        } else {
            successor?.handle(receiver: receiver)
        }
    }
}
class PaypalPaymentHandler: PaymentHandler {
    
    override func handle(receiver: Receiver) {
        if receiver.paypalTransfer {
            print("Handle PayPal transfer")
        } else {
            successor?.handle(receiver: receiver)
        }
    }
}

