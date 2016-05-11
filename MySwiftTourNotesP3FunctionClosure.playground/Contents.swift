//: ## Function and Closure
//:
//: Functions in Swift is a first class object. This means that it can be assigned to variables, passed into other function as argument or act as return from other function.
//:
//: Function can capture variables outside their local scope.
//:
//: Closure is the same as function except without name and closure expression can be very concise.
//:
//: **Basic Function**
//:
//: To create a function we use keyword `func` follow by () for arguments. We use -> to indicate that anything after the arrow is the return of the function.
//:
//: The following function is the most basic function without argument and return.
func printHi() {
    
    print("Hi!")
}

printHi()

//: The following function requires one string argument only.
func printHello(name: String) {
    
    print("Hello \(name), how are you?")
}

printHello("Alex")


//: The following function requires one string argument and it return another string argument.
func printHi2(name: String) ->String
{
    return "Hello \(name), have a good day."
}
let message1 = printHi2("Tom")
message1

//: **Return as Tuple**
//:
//: Tuple is a group of variable grouped into a single variable. We can mixed different type of variables in a tuple including string.
var tupleExample1 = (voltage: 36.0, current: 9.0, resistance: 4)

tupleExample1.current
tupleExample1.resistance
tupleExample1.voltage

//: For example we can perform calculation and return a set of related data. Lets assume we have an array of numbers to compute, we can return a set of related statistics as follows:
let dataSet1 = [23, 100, 50, 46]
func sumAll(dataSet: [Int]) -> (sum:Int, count: Int, average: Double)
{
    var count = 0
    var sum = 0
    
    for eachNumber in dataSet
    {
        sum += eachNumber
        count += 1
    }
    
    let average =  Double(sum) / Double(count)
    
    return (sum, count, average)
}


let result = sumAll(dataSet1)
result.average
result.count
result.sum

//: We can also use number instead of name. The sequence of number is in the same order as the return vaue starting with 0. See example below:
result.0 // Sum
result.1 // Count
result.2 // Average


//: Considering the example above, lets say the your data set is small but the count in the data set may varies. Instead of using array, we can create a function that accept a set of integers with variable quntity. To indicate the variable quantity of data set we use `...` after the data type in the argument. See example below:

func sumAll2(dataSet: Int...) -> (sum:Int, count: Int, average: Double)
{
    var count = 0
    var sum = 0
    
    for eachNumber in dataSet
    {
        sum += eachNumber
        count += 1
    }
    
    let average =  Double(sum) / Double(count)
    
    return (sum, count, average)
}

let result2 = sumAll2(12,32,5,23,78,3)
result2.count
result2.sum
result2.average

let result3 = sumAll2(123,234,543)
result3.count
result3.sum
result3.average

//: If we look at the example below, we create a result without entering any data set in this case count and sum return a zero but average return nan. This is because in Swift 0/0 will return nan (NotANumber)
let result4 = sumAll2()
result4.count
result4.sum
result4.average

//: To avoid a nan return, we will modified the program to the following:

func sumAll3(dataSet: Int...) -> (sum:Int, count: Int, average: Double)
{
    var count = 0
    var sum = 0
    var average = 0.0
    
    for eachNumber in dataSet
    {
        sum += eachNumber
        count += 1
    }
    
    let averageTemp =  Double(sum) / Double(count)
    
    if !(averageTemp.isNaN) {
        average = averageTemp
    }
    
    return (sum, count, average)
}

let result5 = sumAll3()
result5.count
result5.sum
result5.average

//: We can also created nested functions
//:
//: The following example use the common computation of voltage = current X resistence
//: The computation is as follows:
//:     voltage = current X resistence
//:     current = voltage / resistence
//:     resistence = voltage / current
//:
//: Instead of creating 3 different function, we create a main function that accept input base on the formula above. input1 is the first value and input2 is the second value.
//:
//: The main function also accept a ask code, if you are asking for voltage use "v", if you are asking for current use "i" and if you are asking for resistence use "r"
//:
//: In this example, we nest the 3 function into a main function. In the main function user need to input the first value and second value together with ask code.
//:
//: See example below:
func produceVIR(input1: Double, input2: Double, ask: String ) -> Double?
{
    var answer: Double? = nil
    
    func returnV(inputI: Double, inputR: Double)
    {
        answer = inputI * inputR
    }
    
    func returnI(inputV: Double, inputR: Double)
    {
        answer = inputV / inputR
    }
    
    func returnR(inputV: Double, inputI: Double)
    {
        answer = inputV / inputI
    }
    
    switch ask {
        case "v": returnV(input1, inputR: input2)
        case "i": returnI(input1, inputR: input2)
        case "r": returnR(input1, inputI: input2)
        default: print("code not recognize")
    }
    
    return answer
}

let myI1 = 13.0
let myR1 = 20.0
if let myV1 = produceVIR(myI1, input2: myR1, ask: "v")
{
    print("The voltage with current of \(myI1)A and \(myR1)ohm is \(myV1)v")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}

let myV2 = 240.0
let myR2 = 10000.0
if let myI2 = produceVIR(myV2, input2: myR2, ask: "i")
{
    print("The current with voltage of \(myV2)v and \(myR2)ohm is \(myI2)A")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}


let myV3 = 240.0
let myI3 = 0.001
if let myR3 = produceVIR(myV3, input2: myI3, ask: "r")
{
    print("The resistence with voltage of \(myV3)v and \(myI3)A is \(myR3)ohm")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}

let myV4 = 240.0
let myI4 = 0.001
if let myR4 = produceVIR(myV4, input2: myI4, ask: "g")
{
    print("The resistence with voltage of \(myV4)v and \(myI4)A is \(myR4)ohm")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}

//: We can assign a function to a variable
let vIR = produceVIR
let v = vIR(13.0, input2: 20.0, ask: "v")
v


//: We can use another function within a function.
//: The example below create a function that return the area and perimeter of a square.
func square(lengthOfSides: Double) -> (area:Double, perimeter: Double)
{
    var area = 0.0
    var perimeter = 0.0
    
    area = lengthOfSides * lengthOfSides
    perimeter = lengthOfSides * 4
    return (area, perimeter)
}

let sq1 = square(5)
sq1.area
sq1.perimeter

//: The next function calculate the volume of a cube with equal sides. Effectively, we can use the previous function and multiple by height
func cubeVol(side:Double, height: Double) -> Double
{
    var vol = 0.0
    
    
    vol = square(side).area * height
    return vol
    
}

cubeVol(5,height:3)


//: We can also create a function that return another function as its value. Such function are first class function
func makeHalf() -> ((Double, Double) ->Double)
{
    
    func halfCube(side:Double, height: Double) -> Double
    {
        return cubeVol(side, height: height)/2
        
    }
    return halfCube
}

var halfcube = makeHalf()
halfcube(5, 3)

//: Another example of using first class function and returning function as its value.
//:
//: In this example, we just input ask string and we get return as a function
func produceVIRFormula(ask: String ) -> ((Double, Double) -> Double)?
{
 
    
    func returnV(inputI: Double, inputR: Double) -> Double
    {
        return inputI * inputR
    }
    
    func returnI(inputV: Double, inputR: Double) -> Double
    {
        return inputV / inputR
    }
    
    func returnR(inputV: Double, inputI: Double) -> Double
    {
        return inputV / inputI
    }
    
    switch ask {
    case "v": return returnV
    case "i": return returnI
    case "r": return returnR
    default: print("ask code not recognize"); return nil
    }
    
}

let myI5 = 13.0
let myR5 = 20.0
if let myFormula5 = produceVIRFormula("v")
{
    let myV5 = myFormula5(myI5, myR5)
    print("The voltage with current of \(myI5)A and \(myR5)ohm is \(myV5)v")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}

let myV6 = 240.0
let myR6 = 10000.0
if let myFormula6 = produceVIRFormula("i")
{
    let myI6 = myFormula6(myV6, myR6)
    print("The current with voltage of \(myV6)v and \(myR6)ohm is \(myI6)A")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}


let myV7 = 240.0
let myI7 = 0.001
if let myFormula7 = produceVIRFormula("r")
{
    let myR7 = myFormula7(myV7, myI7)
    print("The resistence with voltage of \(myV7)v and \(myI7)A is \(myR7)ohm")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}

let myV8 = 240.0
let myI8 = 0.001
if let myFormula8 = produceVIRFormula("j")
{
    let myR8 = myFormula8(myV8, myI8)
    print("The resistence with voltage of \(myV8)v and \(myI8)A is \(myR8)ohm")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}

let myV9 = 0.0
let myI9 = 0.0
if let myFormula9 = produceVIRFormula("r")
{
    let myR9 = myFormula9(myV9, myI9)
    print("The resistence with voltage of \(myV9)v and \(myI9)A is \(myR9)ohm")
} else {
    print("Something wrong with your ask code. The system can only accept i, r or v in lower case")
}



//: A function can take another function as one if its argument
//:
//: In the following example, we have a function to check if a number is even and we have a function called processData. We use processData to accept a list of numbers and we accept a functionas argument to evaluate a list. Any function that accept Int and produce a boolean is acceptable.
//:

func isEven (number: Int) -> Bool {
    
    if Double(number) % 2 == 0 {
        return true
    } else {
        return false
    }
}

func processData(dataList: [Int], evaluate: Int -> Bool)  {
    
    for eachData in dataList {
        
        if eachData < 10000 {
            
            if evaluate(eachData) {
                print(eachData)
            }
            
        }
    }
    
}

let sampleData = [25, 54, 67, 254, 254754, 457, 36568, 142, 254, 36563, 47, 589]

processData(sampleData, evaluate: isEven)




//: **Closure**
//:
//: Closure is a block of code similar to function except without name. Closure can capture variables in the same scope where it was created.
//:
//: The syntax of closure is as follows:
//:
//:     { (argument: datatype) -> returnDataType in
//:       ...the rest of the code... }
//: 
//: We use closure to implement a generic function. For example, an array has a map function that accepts closure. You can apply any type of code in this map method. The map method will iterate through every element in the array and applied the closure you supply to each element
//:

//: The following closure just add 1 for each element
let myArrayNumbers = [1, 2, 3, 4, 5]
let newArray1 = myArrayNumbers.map({ (no: Int) -> Int in
                    return no + 1})

newArray1
myArrayNumbers

//: The following closure multiple each element by 14
let newArray2 = myArrayNumbers.map({ (no: Int) -> Int in
    return no * 14})

newArray2
myArrayNumbers


//: The following closure filter out the even number change change all odd number to 0
let newArray3 = myArrayNumbers.map({ (no: Int) -> Int in
    if no % 2 == 0 {
        return no }
    else { return 0 }
    })

newArray3
myArrayNumbers

//: **Simplified Closure**
//:
//: We can simplified the previous clsoure as follows:
let newArray4 = myArrayNumbers.map({ (no: Int) -> Int in return no * 14})
newArray4
//: When a closure type is known, we can simplified it by omitting the argument type and return type
let newArray5 = myArrayNumbers.map({ no in return no * 14})
newArray5
//: We can also omit `return`
let newArray6 = myArrayNumbers.map({ no in no * 14})
newArray6
//: We can refer to parameters by number instead of by name. We can also omit `in`
let newArray7 = myArrayNumbers.map({ $0 * 14})
newArray7
//: Finally, when the closure is the only argument, we can omit ()
let newArray8 = myArrayNumbers.map{ $0 * 14 }
newArray8


