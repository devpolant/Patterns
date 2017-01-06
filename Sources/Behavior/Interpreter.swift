
public class InterpreterTest {
    
    public static func test() {
        print("========== Interpreter ==========")
        
        let context = Context()
        
        let x = 5
        let y = 8
        let z = 2
        
        context.setVariable(x, for: "x")
        context.setVariable(y, for: "y")
        context.setVariable(z, for: "z")
        
        let add = AddExpression(leftExpression: NumberExpression(name: "x"),
                                rightExpression: NumberExpression(name: "y"))
        
        let expression = SubstractExpression(leftExpression: add,
                                             rightExpression: NumberExpression(name: "z"))
        
        let result = expression.interpret(context)
        
        print("context=\(context.variables)")
        print("result=\(result)")
    }
}

//MARK: - Context
class Context {
    
    var variables = [String: Any]()
    
    func getVariable(name: String) -> Any? {
        return variables[name]
    }
    
    func setVariable(_ variable: Any, for name: String) {
        variables[name] = variable
    }
}

//MARK: - Abstract Expression
protocol Expression {
    func interpret(_ context: Context) -> Int
}

//MARK: - TerminalExpression
class NumberExpression: Expression {
    
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func interpret(_ context: Context) -> Int {
        return context.getVariable(name: self.name) as! Int
    }
}

//MARK: - NonTerminalExpression
class AddExpression: Expression {
    
    var leftExpression: Expression
    var rightExpression: Expression
    
    init(leftExpression: Expression, rightExpression: Expression) {
        self.leftExpression = leftExpression
        self.rightExpression = rightExpression
    }
    
    func interpret(_ context: Context) -> Int {
        return leftExpression.interpret(context) + rightExpression.interpret(context)
    }
}

class SubstractExpression: Expression {
    
    var leftExpression: Expression
    var rightExpression: Expression
    
    init(leftExpression: Expression, rightExpression: Expression) {
        self.leftExpression = leftExpression
        self.rightExpression = rightExpression
    }
    
    func interpret(_ context: Context) -> Int {
        return leftExpression.interpret(context) - rightExpression.interpret(context)
    }
}
