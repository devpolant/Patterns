
public class IteratorTest {
    
    public static func test() {
        print("========== Iterator ==========")
        
        let iterable = BooksIterable()
        let iter = iterable.iterator()
        
        while iter.hasNext {
            print(iter.next())
        }
    }
}

//MARK: - Iterator
protocol Iterator {
    var current: Int { get }
    var hasNext: Bool { get }
    func next() -> String
}

//MARK: - Aggregate
protocol Iterable {
    var count: Int { get }
    subscript (index: Int) -> String { get }
    func iterator() -> Iterator
}

//MARK: - Concrete Iterator
class BooksIterator: Iterator {
    
    var iterable: Iterable
    
    var current: Int = 0
    var hasNext: Bool {
        return current < iterable.count
    }
    
    init(iterable: Iterable) {
        self.iterable = iterable
    }
    
    func next() -> String {
        let next = iterable[current]
        current += 1
        return next
    }
}

//MARK: - Concrete Aggregate
class BooksIterable: Iterable {
    
    var books = ["a", "b", "c"]
    
    var count: Int { return books.count }
    
    subscript (index: Int) -> String {
        return books[index]
    }
    
    func iterator() -> Iterator {
        return BooksIterator(iterable: self)
    }
}




