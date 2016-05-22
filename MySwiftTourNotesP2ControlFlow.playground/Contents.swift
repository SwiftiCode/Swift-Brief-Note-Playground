//: ## Control Flow
//: For conditional branch we use `if` and `switch`
//:
//: For loops we use `for-in`, `while` and `repeat-while`
//:
//: Parentheses around the condition or loop variable are optional. Braces around the body are required.
//:
//: **if**
//:
//: Syntax: if (Boolean expression) {...} else {...} elseif {...}. See example below:
//:
//:     if someVar3 >= 50 {
//:        //Do something for pass
//:     } else {
//:        //Do someThing for fail
//:     }
//:
//: Below is an example using if:
//:
var student1 = 40
var student2 = 80

if student1 > 50
{
    print("Pass")
}
else
{
    print("Fail")
}

if student2 > 50
{
    print("Pass")
}
else
{
    print("Fail")
}

//:
//: Please note that previously in C, any variable contains a 1 is considered true. However, in Swift, conditional expression must be evaluated to true or false
let checksum1 = 1
//if checksum1 { print("0k") } else { print("Not OK") } //: This expression failed because checksum1 is 1 not True

let checksum2 = true
if checksum2 { print("0k") }  else { print("Not OK") }

//:
//: **Optional Variable**
//:
//: Now, we would like to introduce optionals. Optionals are variable that could be nil (no value at all). The syntax of these variables are added with ? after the variable names and data type declaration.
//: + var someData = 12 is not optional
//: + var someData: Int? is optional
//:
//: To test optional we use a few method, one of them is to use ?? as conditional test, if test failed, a substitute will be use.
//: See example below:

let someVar3: Int? = nil
let someVarCheck1 = someVar3 ?? 0 //: In this statement if someVar3 is nil, we will assign 0 to someVarCheck1

//: Another way to test optional is to use `if` and `let`.
let someVar4: Int? = nil
if let someVarCheck2 = someVar4
{
    print(someVarCheck2)
}
else
{
    print("No Values in someVar4")
}

//: Another example
var optionalNumber: Int? = 3
if let checkNum = optionalNumber
{
    print("Got value")
}
else
{
    print("No Value")
}

optionalNumber = nil
if let checkNum = optionalNumber
{
    print("Got value")
}
else
{
    print("No Value")
}
//: If the optional is nil, the let statement is false thus it will skipped to else statement
//:
//: Note: Both methods of testing optional are very common in Swift programming. If an optional must not be nil then we should use `??` to substitute a default value when the optional happens to be nil.
//:
//: If we just want to trap an error using optional, then we should use `if` and `let` method.
//:
//:
//: **Switches**
//:
//: We use `switch` and `case` to support multiple conditional testing. Please note that the testing must be exhaustive, therefore, we need to add a `default` as a catch all condition at the last conditional check.
//:
//:
//:      switch keyVariable {
//:           case (number or string): code
//:           case (number or string): code
//:      default: doSomeOtherThing }
//:
//: Please note that `default` is required, no `break` is necessary, and the testing of each condition must be exhaustive.
//:
//: We usually use `switch` where there are few option that we want to test.

let option = 5

switch option {
    
case 1 : print("You have selected option 1")
case 2 : print("You have selected option 2")
case 3 : print("You have selected option 3")
case 4 : print("You have selected option 4")
case 5 : print("You have selected option 5")
default: print("Your selection is invalid!")
    
}

//: Another example

var someNum1 = 3000
switch someNum1
{
case 1000 : let result1 = "your case is 1000"
case 2000 : let result1 = "your case is 2000"
case 3000, 4000 : let result1 = "your case is 3000 or 4000"
case 5000: let result1 = "your case is 5000"
default : let result1 = "you have no case"
}

//: We can use string for `switch`, we can use `let x where x.hasPrefix("somePrefix"):` as a conditional text for string.
let food = "curry rice"
switch food {
    
case "chicken salad" : print("You have chicken rice")
case "duck rice" : print("You have duck rice")
case let x where x.hasPrefix("curry"): print("You like curry")
case "fried chicken": print("You have fried chicken")
default: print("Your food choice is something we don't know")
    
}

//: `let` can be used with `where` in a pattern to assign the value that matched that part of a pattern to a constant
//:
//: Another example
let fruits = "waterchestnut"
switch fruits {
case "orange":
    let fruitComm = "This is orange"
case "apple":
    let fruitComm = "An Apple a day"
case let x where x.hasPrefix("water"):
    let fruitComm = "Is this fruit \(x) taste watery?"
default:
    let fruitComm = "Fruit is good for you."
}


//: We can also allow multiple condition to flow through as the example below:

let partNumber = "7500A"
switch partNumber {
    
case "6100A", "7500A", "7000C" : print("The part \(partNumber) is in our store")
default : print("We do not sell this part")
    
}



//: **for-in**
//:
//: We use `for` and `in` to iterate through every items in a collection.
//:
//: Iterating through an array:
let someArray1 = [12, 34, 65, 87, 23, 87]
var sum: Int = 0

for eachItem in someArray1 {
    
    sum += eachItem
    
}

print(sum)

//: We can also use dictionary to iterate each set of item

let someDictionary1 = [1:"A1", 2:"B2", 3:"C3"]
var total = 0
for (key, description) in someDictionary1 {
    
    print(key)
    print(description)
    total += 1
    
}

print(total)

//: We can also have nested loop using `for` and `in`
//:
//: + We can use range indicator such as `..<` or `...`.
//: + For example, we use 0..<100 to indicate a range of number 0 to 99. This statement include 0 but exclude 100.
//: + We use 0...100 to indicate the range of number 0 to 100.
//: + To exclude the lower range we can just start the lower value from where we want such as: 1..<99 to exclude 0.

for number1 in 0..<100 {
    
    print(number1)
    // Shows from 0 to 99
}

for number2 in 1..<100 {
    
    print(number2)
    // Shows from 1 to 99
}

for number3 in 0...100 {
    
    print(number3)
    // Shows from 0 to 100
    
}

for number4 in 1...98 {
    
    print(number4)
    // Shows from 1 to 98
    
}



//: **while, repeat-while**
//:
//: Usually we have `while` and `do-while`. In Swift, we use `while` and `repeat-while`.
//: We list the basic example where every programmer knows

var sum1 = 0
var n1 = 1

while n1 <= 100 {
    
    sum1 += n1
    n1 += 1
}

print(sum1)


//: Our next example use `repeat` and `while`. This is similar with do-while, just replace `do` with `repeat`

var sum2 = 0
var n2 = 1

repeat {
    
    sum2 += n2
    n2 += 1
    
} while n2 <= 100

print(sum2)

//: Usually we use `repeat-while` to run the loop at least once

var sum3 = 0
var n3 = 20
repeat {
    
    sum3 += n3
    n3 += 1
    
} while n3 <= 20

print(sum3)

//: We also use `repeat-while` to run the loop and check for condition as shown in the example below.

var sum4 = 0
var additive = 20
repeat {
    
    sum4 += additive
    
} while sum4 < 100

print(sum4)


/* ---- End ---- */

