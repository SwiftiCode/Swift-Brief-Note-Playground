//: ## Protocol and Extension
//:
//: **Protocol**
//:
//: We can use protocol to provide a standard interface and the flexibility for protocol adopter to implement the details in their own way. We can introduce a protocol such as printing protocol and let any class instances, structures or any data type to adopt the features. While defining protocol, we standard the input and output but we leave the implementation details to the adopter.
//: 
//: Another purpose of introducing protocol is to provide additional capabilities where it is less commonly use. For example, for a class called car, the additional features in a racing car is less commonly used. Although we can add these features by subclassing car, it may have to carry additional weight from the super class where those features are not applicable to racing cars. By using protocols we can use the superclass and adopt the racing car protocol for additional features.
//:
//: We can include computed properties and/or function in a protocol. For computed properties, we must define if the properties are settable and/or gettable only. For function, we just need to define the function name and perimeters.
//:
//: We use `protocol` to create and define a protocol
//:
//: An example

class StudentA {
    var lastName: String
    var firstName: String
    var studentID: String
    var address: String
    var contact: Int
    
    init(lastName: String, firstName: String, studentID: String, address: String, contact: Int) {
        self.lastName = lastName
        self.firstName = firstName
        self.studentID = studentID
        self.address = address
        self.contact = contact
    }
}

//: Consider the example above, if we need to add functionality to display student record on the screen, we need to add the functionality, however, in this case we can create a protocol so that any other class can also make use of this feature.

protocol printToScreen {
    func printScreen()
}

class StudentB: printToScreen {
    var lastName: String
    var firstName: String
    var studentID: String
    var address: String
    var contact: Int
    
    init(lastName: String, firstName: String, studentID: String, address: String, contact: Int) {
        self.lastName = lastName
        self.firstName = firstName
        self.studentID = studentID
        self.address = address
        self.contact = contact
    }
    
    func printScreen() {
        print("Name: \(lastName), \(firstName)")
        print("Student ID: \(studentID)")
        print("Address: \(address)")
        print("Contact: \(contact)")
    }
}

let student1 = StudentB(lastName: "Hawk", firstName: "Howard", studentID: "A122334", address: "sample address", contact: 256558745)
student1.printScreen()

//: We can also create a protocol that create a fullname
protocol FullName {
    var studentFullName: String {get}
}

class Student: printToScreen, FullName {
    var lastName: String
    var firstName: String
    var studentID: String
    var address: String
    var contact: Int
    
    init(lastName: String, firstName: String, studentID: String, address: String, contact: Int) {
        self.lastName = lastName
        self.firstName = firstName
        self.studentID = studentID
        self.address = address
        self.contact = contact
    }
    
    var studentFullName: String {
        get {
            return self.firstName+" "+self.lastName
        }
    }
    
    func printScreen() {
        print("Name: \(studentFullName)")
        print("Student ID: \(studentID)")
        print("Address: \(address)")
        print("Contact: \(contact)")
    }
}

let student2 = Student(lastName: "Hopkin", firstName: "Tom", studentID: "A122164", address: "sample address for Tom", contact: 2579654785)
student2.printScreen()
student2.studentFullName

//: A protocol can contain function and variables, please note that properties in protocol is similar to compyed properties, you need to specify `set` and/or `get` for each properties

protocol SampleProtocol {
    var capitalTextGet: String {get}
    var someNumberGetSet: Int {get set}
    
    mutating func displayText()
    func time2Number(numberEntry: Int) -> Int
}

class SomeClass1:SampleProtocol {
    
    var somePropertyNumber:Int
    var somePropertyText: String
    var capitalTextGet: String {
        get {
            return self.somePropertyText.uppercaseString
        }
    }
    var someNumberGetSet: Int
    
    init(enterText: String, number: Int) {
        self.somePropertyNumber = number
        self.somePropertyText = enterText
        self.someNumberGetSet = number * number
    }
    
    func displayText() {
        print("This is property \(self.somePropertyText) and this is \(self.capitalTextGet)")
    }
    
    func time2Number(numberEntry: Int) -> Int {
        return numberEntry * 2
    }
}

let mySampleObj1 = SomeClass1(enterText: "bmw", number: 88)
mySampleObj1.somePropertyNumber
mySampleObj1.somePropertyText
mySampleObj1.capitalTextGet
mySampleObj1.someNumberGetSet
mySampleObj1.displayText()
mySampleObj1.time2Number(66)

//: If we assign the object to another variable with protocol specified. The assigned object will only adopt the protocol part and will not allow access to the class properties or function
let sampleObj1a: SampleProtocol = mySampleObj1
sampleObj1a.capitalTextGet
sampleObj1a.someNumberGetSet
sampleObj1a.time2Number(66)
//sampleObj1a.displayText() //: error as the instance can use protocol but not the base class


//: We can use protocol for classes, structure and enumerations
struct SampleStruct: SampleProtocol {
    
    let myStructProperty = 2018
    var capitalTextGet: String
    var someNumberGetSet: Int
    
    init(text: String, number: Int) {
        self.capitalTextGet = text
        self.someNumberGetSet = number
    }
    
    mutating func displayText() {
        print("This is a struct")
        self.capitalTextGet = "This is a struct with mutating method"
    }
    
    func time2Number(numberEntry: Int) -> Int {
        return numberEntry * numberEntry
    }
    
}

var mySampleStruct1 = SampleStruct(text: "This is a struct", number: 1024)
mySampleStruct1.myStructProperty
mySampleStruct1.capitalTextGet
mySampleStruct1.someNumberGetSet
mySampleStruct1.displayText()
mySampleStruct1.time2Number(8)

//: Please also note that we need to add a keyword to `mutating` to function that modified the structure itself. This is specific to structure and do not applied to classes. In addition we need to add `mutating` to the function during protocol definition. If we plan for developers to adopt the protocol in structures and the functions involved in modifiying the properties. It is better to add the `mutating` keyword in front of the affected function.

//: Creating enumeration with the adoption of protocol
enum SampleNum: SampleProtocol {
    case Element1(String)
    case Element2(Int)
    
    var capitalTextGet: String {
        get {
            return "enume"
        }
    }
    var someNumberGetSet: Int {
        get {
            return 10
        }
        set {
            10
        }
    }
    
    func displayText() {
        print("This is enum")
    }
    
    func time2Number(numberEntry: Int) -> Int {
        return numberEntry * 2
    }
}

var myNum = SampleNum.Element1("Enum Test")
myNum.capitalTextGet
myNum.someNumberGetSet
myNum.displayText()
myNum.time2Number(5)


//: We can use extension to add functionality of an existing class. Extensions do not allows stored properties but allows computed properties and additional functions.
//:
extension SomeClass1 {
    var extraNumber: Int {
        return somePropertyNumber * 3
    }
    
    func notes(notes: String) {
        print(notes)
    }
}

let mySampleObj2 = SomeClass1(enterText: "batman", number: 88)
mySampleObj2.somePropertyText
mySampleObj2.capitalTextGet
mySampleObj2.someNumberGetSet
mySampleObj2.displayText()
mySampleObj2.time2Number(66)
mySampleObj2.extraNumber
mySampleObj2.notes("Some notes for extension")

//: We can also create an extension that adopts a protocol
class SomeClass2 {
    var notes: String
    var number2: Int
    
    init(notes: String, number2: Int) {
        self.notes = notes
        self.number2 = number2
    }
}

extension SomeClass2: SampleProtocol {

    var capitalTextGet : String {
        return notes
    }
    
    var someNumberGetSet: Int {
        get {
            return number2 * 10
        }
        set {
            number2 = newValue
        }
    }
    
    func displayText() {
        print(notes)
    }
    
    func time2Number(numberEntry: Int) -> Int {
        return numberEntry * 5
    }
    
}

//: If we use protocol adoption in an extension, we must make sure that all properties in the protocol must be setup as computed properties with get and set clearly define.

