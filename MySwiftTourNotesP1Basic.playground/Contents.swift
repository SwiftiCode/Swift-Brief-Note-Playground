//: # Swift 2.2 - Brief Introduction for Experienced Programmer
//: # Part 1 - Basics
//:
//: This brief notes is for programmers who already know the basics of object oriented programming. The programmer may already be familiar with other programming languages but want to learn about Swift Programming. This guide is based on Swift 2.2.
//:
//:
//: ## Basics, Variables, Data Types and Collections
//:
//: **Print to Console**
//:
//: To print text, use print function. Such as print("Enter some text here")
print ("Hello Word!")
//:
//: We can also assign the message to a string variable as follows:
let message = "Hi Playground"
print(message)
//:
//: **Basic Syntax**
//:
//: In Swift, semi-colon (;) is not necessary unless you want to put multiple statement into a single line.
let someVar1 = 6; let someVar2 = 23.4 // Semi-colon is required in this situation when you want to place 2 separate code on a single line
//:
//: **Create Constants**
//:
//: + We use keyword `let` to create constant - values that will not change
//: + Constant must be declared before being used.
let constant1 = 23
constant1
//constant1 = 43 // This line will caused error as constant cannot be reassigned

//: **Create Variable**
//:
//: + We use keyword `var` to create variable - values that will be changed from time to time
//: + Variable must be declared before being use
var variable1 = 45
variable1
variable1 = 76
variable1

//: **Variables & Type Inference**
//:
//: Swift is a type safe language. We must assign a correct value that is suitable for the data type of a variable. Swift will flag any un-match type. During constant or variable creation, the compiler will infers the data type of the constant or variable base on the type of its value. There is no need to define the data type explicitly. After the creation of a variable, the system will only allow values of the same type when reassigning values to a variable. For integer and floating point, Int and Double will be the preferred default. If we provide an expression instead of literal value, the system will infer the most appropriate data type for us.
var variable2 = 26
variable2
variable2 = 64
variable2
//variable2 = 58.4 // This line will generate error since the type of the values is different from the type of variable2
variable2

let variable2a = 25 * 1.0 // The variable2a will be automatically declared as Double

//: **Specified a Type Explicitly**
//:
//: Programmers can explicitly provide the variable type by providing a colon follow by type after the variable name
let variable3:Double = 54
variable3
let variable4:Float = 4
variable4

//: **Basic Data Types**
//:
//:      Basic Data Types
//:      Integers - Int
//:      Floating Point - Double, Float
//:      Boolean - Bool
//:      Text - String
//:
//:      Collection Types
//:      Array
//:      Set
//:      Dictionary
//:      Tuples - An assorted set of related values group under a name.
//:
//:      Optional - Any data type that can be nil


let variable5a: Int = -8
let variable5b: UInt = 6
let variable5c: Float = 3.1415
let variable5d: Double = 2.718
let variable5e: Bool = true
let variable5f: String = "This is a string"


//: **Data Type Conversion**
//:
//: To convert from one data type to another we must create a variable of our desire data type and explicitly convert the value using dataType() syntax.


let variable5 = 2564
variable5
let variable6 = Double(variable5) + 0.45
variable6
let variable7 = String(variable6)
variable7

//: We can include variable inside our print function using \\(expression)

let store1 = 25
let store2 = 54
let statement1 = ("We have \(store1) items in store 1 and \(store2) items in store 2. In total, we have \(store1 + store2) items")

let variable8 = 765
var variable9 = 43

let message2 = "The first number is "
let message3 = message2 + String(variable8)
message3
let message4 = "The next number is \(variable9)"
let message5 = "The total of \(variable8) and \(variable9) is \(variable8 + variable9)"
print(message5)



//: ## Arrays and Dictionaries
//: **Arrays**
//:
//: To create arrays, we use brackets [] to include items in an array such as: var arrayName = ["item1", "item2"....."lastitem"]. Please note that index start with 0
var nameList = ["John", "Peter", "Mathew", "Christopher", "Danny"]
nameList[0]
nameList[1]
nameList[2]
nameList[3]
nameList[4]

//: To provide total number of element
nameList.count

//: To add new element
nameList.append("Thomas")
nameList[5]

//: To change old element
nameList[2]
nameList[2] = "Mark"
nameList[2]

//: To remove an element
nameList.removeAtIndex(4)
nameList[4] //: previous added nameList[5] become nameList[4]
//nameList[5] // generate error since nameList[5] become nameList[4]

//: To insert an element right in front of array, all other element pushed down the array
nameList.insert("Paul", atIndex: 0)
nameList[0]
nameList[1]
nameList[2]

//: Display last item
nameList.last

//: Remove last item of array
nameList.removeLast()
nameList.last

//: Display the last index + 1, you can also use this number as the total count. Similar to `.count`
nameList.endIndex

//: Display the start index
nameList.startIndex

//: To find out the index of a particular element
nameList.indexOf("Peter")

//: To create empty arrays
var nameList2 = [String]()

//: To populate empty arrays
nameList2 += ["Test1", "Test2"]
nameList2[0]
nameList2[1]
nameList2.append("Test3")
nameList2[2]


//: If the data type can be inferred then you can create an empty array without indicating the data type. We can also use this method to clear all the data inside the array while maintaining its data type.
nameList2 = []

//nameList2[0] // This statement will generate error since all data had been cleared.

//: **Dictionary**
//:
//: To create dictionary use brackets and colon to include key and definition in dictionary such as: var dictionaryName = ["key1":"definition1", "key2":"definition2"....."keylast":"definitionlast"]

var dictionaryList1 = [1:"one", 2:"two", 3:"three", 4:"four"]
dictionaryList1[3]

//: To add definition
dictionaryList1[5] = "five"

//: Create an empty dictionary
var dictionaryName1 = [String:String]()

//: To populate the empty dictionary
dictionaryName1 = ["key1":"definition1",  "key2":"definition2", "keylast":"definitionlast"]
dictionaryName1["key2"]

//: To add definition
dictionaryName1["key3"] = "definition3"


//: To create empty dictionary, you need to specify the variable type
var dictionaryName2 = [String:Float]()

//: To populate empty dictionary
dictionaryName2 = ["pi": 3.1415,"e": 2.71828]

//: If type information can be inferred then you can create dictionary without  variable type
dictionaryName2 = [:]

//: Another example
var alphabetList = [ "A":"Alpha", "B":"Bravo" ]
alphabetList["B"]

//: To add additional definition
alphabetList["C"] = "Charlie"
alphabetList["C"]
alphabetList["J"] = "Juliet"
alphabetList["H"] = "Hawk"

//: To list the total number of definitions
alphabetList.count

//: To change a definition
alphabetList["H"]
alphabetList["H"] = "Hotel"
alphabetList["H"]

//: To find the index for a definition
let indexForJuliet = alphabetList.indexForKey("J")
indexForJuliet

//: To remove a definition by index
alphabetList.removeAtIndex(indexForJuliet!)

//: To remove a definition by key
alphabetList.removeValueForKey("H")
alphabetList.count

/*: ----- End ----- */


