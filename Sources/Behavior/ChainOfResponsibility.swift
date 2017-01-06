
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

