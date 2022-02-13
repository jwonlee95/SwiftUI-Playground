import Cocoa

// Inheritance

class Employee { //Parent Class
    let hours: Int
    
    init(hours: Int){
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day")
    }
}

class Manager: Employee {
    func work() {
        print("I am going to meeting for \(hours) hours")
    }
    
    override func printSummary(){   //override lets change function from the parent class.
        print("I am a Manager working for \(hours) a day!")
    }
}
final class Developer: Employee {   // final restricts more children from this class creating.
    func work() {
        print("I am writing code for \(hours) hours")
    }
}

let Jaewon = Manager(hours: 10)
let Jaetwo = Developer(hours: 12)
Jaewon.work()
Jaetwo.work()

Jaewon.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init (isElectric: Bool){
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init (isElectric: Bool, isConvertible: Bool){
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car (isElectric: true, isConvertible: false)

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Jaewon"

print(user1.username)
print(user2.username)

//--------------------------Protocol----------------------------------

protocol Transportation {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Bus: Transportation {
    let name = "Bus"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int){
        print("I am traveling at \(distance)km by Bus")
    }
}

struct Bicycle: Transportation {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I am traveling at \(distance)km by Bicycle")
    }
}

func commute(distance: Int, using transportation: Transportation){
    if transportation.estimateTime(for: distance) > 100 {
        print("Too slow. Try with another vihecle")
    }else {
        transportation.travel(distance: distance)
    }
}

func getTravelEstimate(using transportations: [Transportation], distance: Int){
    for transportation in transportations {
        let estimate = transportation.estimateTime(for: distance)
        print("\(transportation.name): \(estimate) hours to travel \(distance)km.")
    }
}

let bus = Bus()
let bike = Bicycle()

commute(distance: 100, using: bus)
commute(distance: 100, using: bike)
getTravelEstimate(using: [bus, bike], distance: 150)


//--------------------------------Extension---------------------------------
extension String{
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String]{
        self.components(separatedBy: .newlines)
    }
}

var quote = " The truth is rarely pure and simple "
quote.trim()
print(quote)

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["a", "b", "c"]
if guests.isNotEmpty {
    print("Guests are \(guests)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}
extension Person {
    func sayHello(){
        print("Hi \(name)")
    }
}

struct Student: Person {
    let name: String
}

var student = Student(name: "Jaewon")
student.sayHello()

//-----------------------------------Optional----------------------------

func square(number: Int) -> Int {
    number * number
}

var num: Int? = nil

if let unwrappedNumber = num {
    print(square(number: unwrappedNumber))
}else {
    print("Number is not defined")
}

var myNum: Int? = 3

func printSquare(of number: Int?) {
    guard let number = myNum else{
        print("Num is not defined")
        return
    }
    print(number * number)
}
printSquare(of: myNum)


struct Book {
    let title: String
    let author: String?
}

let book = Book(title:"Lord of the Rings", author: nil)
let author = book.author ?? "Anonymous"
print(author)
