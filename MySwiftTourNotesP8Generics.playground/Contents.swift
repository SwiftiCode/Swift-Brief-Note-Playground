//: ## Generics
//:
//: Generics are those with unknown data type
//: We can create genertic forms of function, class, methods, structure and enumeration
//:
//: The purpose of creating generic form of function, methods or class is for developer to apply different data type to the function, method or class.
//:
//: To define generic, we need to postfix a generic `<T>` after the function name where T is the placeholder name for generic.
func print10Times<T> (x: T) {
    for _ in 1...10 {
        print(x)
    }
}

let genA = 10
print10Times(genA)
let genB = "Test"
print10Times(genB)
let genC = 12.2
print10Times(genC)

//: We can use `where` after the type name to specify a set of condition or requirement for the data type we called type constraint.
//: We can demand the generic data type to be subsclass from a specific class or to implement certain protocol.
//: 
//: In the following example, we compare if the first input is larger than second input. We use T as generic type. However, without the statement "where T: Comparable". The system will have error as we cannot compare generic unless we constraint the generic type to comparable
func isLarger<T where T: Comparable >(first: T, second: T) -> Bool {
    return first > second
}

isLarger(100, second: 20)
isLarger(12.0212, second: 124.25)

//: The can include other constraint such as T must conform to a protocol or T and U must be the same.

//: ##End


