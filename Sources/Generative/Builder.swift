
public class BuilderTest {
    
    public static func test() {
        print("========== Builder ==========")
        
        let director = Baker(builder: RyeBreadBuilder())
        let bread = director.bake()
        
        print(bread.description)
    }
}


//MARK: - Products
class Flour {
    var sort: String
    init(sort: String) {
        self.sort = sort
    }
}
class Salt {}
class Additives {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Bread {
    var wheatFlour: Flour?
    var ryeFlour: Flour?
    var salt: Salt?
    var additives: Additives?
    
    var description: String {
        return "wheatFlour=\(wheatFlour?.sort), ryeFlour=\(ryeFlour?.sort), salf=\(salt != nil), additives=\(additives?.name)"
    }
}

//MARK: - Abstract Builder
protocol BreadBuilder {
    
    var bread: Bread! { get set }
    func createBread()
    
    func setWheatFlour()
    func setRyeFlour()
    func setSalt()
    func setAdditives()
}

//MARK: - Concrete Builder
class RyeBreadBuilder: BreadBuilder {
    
    var bread: Bread!
    
    func createBread() {
        self.bread = Bread()
    }
    
    func setWheatFlour() {
        bread.wheatFlour = nil
    }
    func setRyeFlour() {
        bread.ryeFlour = Flour(sort: "1st Sort")
    }
    func setSalt() {
        bread.salt = Salt()
    }
    func setAdditives() {
        bread.additives = nil
    }
}

//MARK: - Director
class Baker {
    
    var builder: BreadBuilder
    
    init(builder: BreadBuilder) {
        self.builder = builder
    }
    
    func bake() -> Bread {
        
        builder.createBread()
        builder.setWheatFlour()
        builder.setRyeFlour()
        builder.setSalt()
        builder.setAdditives()
        
        return builder.bread
    }
}


