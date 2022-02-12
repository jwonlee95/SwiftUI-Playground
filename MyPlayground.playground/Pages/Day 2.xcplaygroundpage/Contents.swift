import Cocoa

//Error Handling------------------------

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {throw PasswordError.short}
    if password == "12345" {throw PasswordError.obvious}
    
    if(password.count < 8){
        return "OK"
    }
    else if(password.count < 10){
        return "Great"
    }
    else {
        return "Excellent"
    }
}

let string = "1234567890"

do {
    let result = try checkPassword(string)
    print("Password Status is: \(result)")
}catch PasswordError.short{
    print("Please use a longer password")
}catch PasswordError.obvious {
    print("Please use more complex password")
}
catch {
    print("There was an error.")
}

//Closure Handling------------------------

let team = ["c","d","b","a"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in // in works as closure --> )
    if name1 == "b"
    {return true}
    else if name2 == "b"
    {return false}
    else
    {return name1 < name2}
})
print(captainFirstTeam)

let rearrange = team.sorted{
    $0 > $1
}
//print(rearrange)

let rearrange2 = team.sorted{a,b in
    a > b}

print(rearrange2)

let bOnly = team.filter{a in a.hasPrefix("b")}
print(bOnly)

let uppercaseTeam = team.map{ $0.uppercased()}
print(uppercaseTeam)

func doImportantThing(first: ()-> Void, second:()->Void, third:()->Void){
    first()
    print("First work Done")
    second()
    print("Second Work Done")
}

doImportantThing{
    print("First")
}second:{
    print("Second")
}third:{
    print("Third")
}

//--------------------------------Structs------------------------

struct Employee {
    let name: String
    var vacationReamining = 14 //Set as a default value
    
    mutating func takeVacation(days: Int){ //mutating lets to change self value
        if(vacationReamining > days){
            vacationReamining -= days
            print("You have \(vacationReamining) left.")
        }else{
            print("You do not have enough days reamining.")
        }
    }
}

var programmer = Employee(name:"Jaewon Lee", vacationReamining: 9) //Needs to be var not constant because of mutating
programmer.takeVacation(days: 5)
print(programmer.vacationReamining)

struct DynamicEmployee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get{
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var dynamicProgrammer = DynamicEmployee(name:"Jay")
dynamicProgrammer.vacationTaken += 4
dynamicProgrammer.vacationRemaining = 5
print(dynamicProgrammer.vacationAllocated)

struct App {
    var contacts = [String](){
        willSet {
            print("Current contacts are: \(contacts)")
            print("New value is: \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Jae one")
app.contacts.append("Jae two")
app.contacts.append("Jae three")


struct Player {
    let name: String
    var number: Int
    
    init(name: String){
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Jaewon Lee")
print(player.number)

//private is used when only wanted to viewed or changed by struct itself
//private(set) can view and read but cannot change by other function outside struct

//When to use static?
//1. Accessing set data
struct AppData {
    static let version = "1.3.5"
    static let fileName = "settings.json"
    static let homeURL = "https://www.walley.com"
}
print(AppData.version)
//2. Making Sample Data for testing
struct User {
    let name: String
    let password: String
    
    static let example = User(name:"Jaewon Lee", password:"supersecretpassword")
}
print(User.example)


//--------------------------------Classes------------------------

