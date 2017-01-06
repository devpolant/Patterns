
public class FacadeTest {
    
    public static func test() {
        print("========== Facade ==========")
        
        let programmer = SoftwareDeveloper()
        let xcode = XCodeFacade(textEditor: TextEditor(),
                                compiler: Compiler(),
                                runtime: RuntimeEnvironment())
        
        programmer.createApplication(with: xcode)
    }
}


//MARK: - Client
class SoftwareDeveloper {
    
    func createApplication(with xcode: XCodeFacade) {
        xcode.start()
        xcode.stop()
    }
}


//MARK: - Facade
class XCodeFacade {
    
    var textEditor: TextEditor
    var compiler: Compiler
    var runtime: RuntimeEnvironment
    
    init(textEditor: TextEditor, compiler: Compiler, runtime: RuntimeEnvironment) {
        self.textEditor = textEditor
        self.compiler = compiler
        self.runtime = runtime
    }
    
    func start() {
        textEditor.writeCode()
        textEditor.save()
        compiler.compile()
        runtime.execute()
    }
    
    func stop() {
        runtime.finish()
    }
}

//MARK: - Subsystems
class TextEditor {
    func writeCode() {
        print("Writing code ...")
    }
    func save() {
        print("Saving code ...")
    }
}

class Compiler {
    func compile() {
        print("Compiling ...")
    }
}

class RuntimeEnvironment {
    func execute() {
        print("Application started")
    }
    func finish() {
        print("Application finished")
    }
}
