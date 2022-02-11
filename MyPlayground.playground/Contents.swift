import Cocoa

let actor = "Jaewon Lee"
let filename = "trip.jpg"

let quote = "Then he tapped a sign saying \"STOP\" and walked by."

let movie = """
A day in
the life of an
Apple engineer
"""

print(actor.count)

print(actor.uppercased())

print(movie.hasPrefix("A day"))
print(filename.hasSuffix(".jpg"))

let reallyBig = 10_000_000 //Swift ignores _ in int

let number = 120
print(number.isMultiple(of: 3))

let name = "Jaewon Lee"
let age = 28
let message = "Hello I am \(name) and I am \(age) years old"
print(message)

//arrays are the same as others
//Sets have no restricted order, Cannot have Dupicate. (Use insert)

//Dictionaries
let employee = ["name": "Jaewon", "job": "programmer", "location": "Korea", name: "Jaewon Lee"]
print(employee["name"])
print(employee[name])   //These Cause Optional because there might be no value for it
print(employee[name, default: "Unknown"]) //Like | undefined in Typescript
var heights = [String: Int]()   //Making new Dictionary


enum Weekday { //Works like interface in typescript
    case monday //Saved like array [0]
    case tuesday    //[1]....
    case wednesday
    case thursday
    case friday
}

var day = Weekday.friday
day = .monday   //Can remove Weekday
print(day)

let num = 5
switch num {
case 5:
    print(5)
    fallthrough // -----> This lets to move down even the case is true
case 4:
    print(4)
default:
    print(0)
}

let hour = 23
print(hour<12 ? "It is before Noon" : "It is after Noon")

//for(i=0; i<5; i++){   ----> Not Work
//    print (i)
//}

let array = ["a","b","c","d","e"]
for i in 1...array.count {
    print (i)
}
for i in array {
    print(i)
}
