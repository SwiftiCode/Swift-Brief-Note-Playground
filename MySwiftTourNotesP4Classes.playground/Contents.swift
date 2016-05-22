import UIKit
// import UIKit for math function
//:
//: ## Objects and Classes
//:
//: **Create Classes**
//:
//: + The syntax to create class is to use the keyword `class` follow by class name.
//: + A property declaration is the same as declaring constant and variables
//: + Declaration of a method is the same way as declaring function
//:

class Hi
{
    var hiName:String = "Name"
    func displayMessage()
    {
        print("Hi \(hiName), how are you?")
    }
}

//: + To create an instance of a class, we use className()
//: + We can assign instance to constant or variable
//: + To read or write the property of a class, we use period (.)
//:
//:        objectName.propertyName //read
//:
//:        objectName.propertyName = newValue  //write
//:
//: + To call the method of a class we use period (.) follow by the name of method and parentheses () with argument or without argument.
//:
//:        objectName.methodA()
//:

var hiObj1 = Hi()
hiObj1.hiName = "Thomas"
hiObj1.hiName
hiObj1.displayMessage()

class Circle1 {
    
    let myPi = 3.1415
    var myRadius = 0.0
    
    func circumference() -> Double {
        return 2 * myRadius * myPi
    }
}

let objCircle1 = Circle1()
objCircle1.myRadius
objCircle1.myRadius = 25
objCircle1.circumference()

//: **Initialization**
//:
//: + When creating an instance/object from a class, the properties must be initialized.
//: + This means that all properties in a class must be initialized, or all properties must have an assigned value.
//: + We accomplish such initialization by 2 methods: 
//: + The first method is to assigned a value immediately during declaration
//: + Another method is to assigned value by taking input from user using `init()`
//: + We use self.propertyName to refer to the current instance.
//:
//: The following example require user to initialized the instance first before we can use the object.

class Circle2 {
    
    let myPi = 3.1415
    var myRadius:Double
    
    init(myRadius: Double) {
        self.myRadius = myRadius
    }
    
    func circumference() -> Double {
        return 2 * myRadius * myPi
    }
    
    func area() -> Double {
        return myRadius * myRadius * myPi
    }
}

let objCircle2 = Circle2(myRadius: 25)
objCircle2.myRadius
objCircle2.circumference()
objCircle2.area()

//:
//: **Sub Class**
//:
//: To create a subclass, we use the same class syntax follow by a colon and the name of superclass
//: For initialization, we need to initialize the current properties before we can initialize the properties in the superclass.

class Cylinder:Circle2 {
    
    var height: Double
    
    init(height: Double, myRadius: Double) {
        self.height = height
        super.init(myRadius: myRadius)
    }
    
    func volume() -> Double {
        return self.area() * height
    }
}

let objCylinder1 = Cylinder(height: 10, myRadius: 25)
objCylinder1.myRadius
objCylinder1.circumference()
objCylinder1.area()
objCylinder1.height
objCylinder1.volume()

//: We can replace a method from the superclass by using the keyboard `override`

class HalfCylinder:Circle2 {
    
    var height: Double
    
    init(height: Double, myRadius: Double) {
        self.height = height
        super.init(myRadius: myRadius)
    }
    
    override func circumference() -> Double {
        return (2 * myRadius * myPi) / 2
    }
    
    override func area() -> Double {
        return (myRadius * myRadius * myPi) / 2
    }
    
    func volume() -> Double {
        return self.area() * height
    }
}

let objCylinder2 = HalfCylinder(height: 10, myRadius: 25)
objCylinder2.myRadius
objCylinder2.circumference()
objCylinder2.area()
objCylinder2.height
objCylinder2.volume()

//: **Computed Properties**
//:
//: In a class, we use `let` and `var` to store constant and variables.
//: Swift also allowed us to have computed properties. Such properties are computed and do not have its own value.
//: It is actually a function disguise as property
//:
//: The above example can be reconstructed with computed properties
class Circle3 {
    
    let myPi = 3.1415
    var myRadius:Double
    
    init(myRadius: Double) {
        self.myRadius = myRadius
    }
    
    var circumference: Double {
        return 2 * myRadius * myPi
    }
    
    var area: Double {
        return myRadius * myRadius * myPi
    }
}

let objCircle3 = Circle3(myRadius: 25)
objCircle3.myRadius
objCircle3.circumference
objCircle3.area

//: In the above example, circumference and area are considered computed properties. 
//: 
//: We can have getter and setter in computed properties
//: The example above is basically a getter, it can be written as the followings:

class Circle4 {
    
    let myPi = 3.1415
    var myRadius:Double
    
    init(myRadius: Double) {
        self.myRadius = myRadius
    }
    
    var circumference: Double {
        get {
            return 2 * myRadius * myPi
        }
    }
    
    var area: Double {
        get {
            return myRadius * myRadius * myPi
        }
    }
}

let objCircle4 = Circle4(myRadius: 25)
objCircle4.myRadius
objCircle4.circumference
objCircle4.area

//: Computed properties in Swift class can have getter and setter
//:
//: In the example above, we need to create instance by providing a radius. However, if we have only the circumference or area. We can set those value and calculate the radius in reverse as shown in the following example.
//:
//: Please note that when using setter, we use `newValue` as the new value of the computed properties. The code will compute the radius in reverse.
class Circle5 {
    
    let myPi = 3.1415
    var myRadius:Double
    
    init(myRadius: Double) {
        self.myRadius = myRadius
    }
    
    var circumference: Double {
        get {
            return 2 * myRadius * myPi
        }
        set {
            myRadius = newValue / ( 2 * myPi )
        }
    }
    
    var area: Double {
        get {
            return myRadius * myRadius * myPi
        }
        set {
            myRadius = sqrt(newValue/myPi)
        }
    }
}

let objCircle5 = Circle5(myRadius: 25)
objCircle5.myRadius
objCircle5.circumference
objCircle5.area

let objCircle6 = Circle5(myRadius: 25)
objCircle6.myRadius
objCircle6.circumference
objCircle6.area

objCircle6.circumference = 157
objCircle6.myRadius
objCircle6.circumference
objCircle6.area

objCircle6.area = 1963
objCircle6.myRadius
objCircle6.circumference
objCircle6.area

//: If we don't need computed properties but we would like to process some code before the variable is set and/or after the variable is set, we can use `willSet` an `didSet` keyword.
//: We use `willSet` and `didSet` to define how the variable will trigger some code before or after it is set.

class PersonalHealth {
    
    var name: String {
        willSet {
            print("Welcome \(name)")
            print("Disclaimer: We under take no liability")
        }
        didSet {
            heightMetric = 0
            weightMetric = 0
        }
    }
    
    var metric: Character
    
    var heightMetric: Double {
        didSet {
            if self.metric == "e" {
                self.heightMetric = self.heightMetric * 0.3048
            }
        }
    }
    
    var weightMetric: Double {
        didSet {
            if self.metric == "e" {
                self.weightMetric = self.weightMetric * 0.453592
            }
        }
    }

    var bmi: Double {
        return weightMetric / (heightMetric * heightMetric)
    }
    
    init(name: String, metric: Character, height: Double, weight:Double) {
        
        self.name = name
        self.metric = metric
        self.heightMetric = height
        self.weightMetric = weight
    }
    
}

let myHealth1 = PersonalHealth(name: "John", metric: "a", height: 1.58, weight: 57)

myHealth1.name
myHealth1.heightMetric
myHealth1.weightMetric
myHealth1.bmi

myHealth1.name = "Tom"
myHealth1.metric = "e"
myHealth1.heightMetric
myHealth1.weightMetric
// In the above, when a new name is set, the weight and height is set to zero

myHealth1.heightMetric = 5.2
myHealth1.weightMetric = 125
myHealth1.metric
myHealth1.heightMetric
myHealth1.weightMetric
myHealth1.bmi
// In the above code, when you entered height and weight and the system detect that you have set the metric code to "e", it will automatically convert the height and weight to metric.


//: In the example above, before a name is set, we show the welcome message with disclaimer. After a new name is set, we will set the height and weight to zero.
//:
//: Whenever a height or weight is set, the system will check the metric code, if the code is equal to "e" (for English). The system will assume the data entered is in feet and pound and perform automatic convertion.

//:
//: **Optional Instance**
//:
//: We can use optional with instances, initialization, method, and properties.
//:
//: Usually, we will include a optional marker `?` after init, so if initialization failed the instance will be nil.
//:
class Circle6 {
    
    let myPi = 3.1415
    var myRadius:Double
    
    init?(myRadius: Double) {
        if myRadius != 0 {
            self.myRadius = myRadius
        } else {
            return nil
        }
    }
    
    var circumference: Double {
        get {
            return 2 * myRadius * myPi
        }
        set {
            myRadius = newValue / ( 2 * myPi )
        }
    }
    
    var area: Double {
        get {
            return myRadius * myRadius * myPi
        }
        set {
            myRadius = sqrt(newValue/myPi)
        }
    }
}

let myCircle1 = Circle6(myRadius: 5)
myCircle1?.myRadius
myCircle1?.area
myCircle1?.circumference

let myCircle2 = Circle6(myRadius: 0)
myCircle2?.myRadius
myCircle2?.area
myCircle2?.circumference

//: We can also use `if` and `let` to check if an object is nil as follows
if let myCircle3 = Circle6(myRadius: 25) {
    print("Instances Set")
    myCircle3.myRadius
    myCircle3.circumference
    myCircle3.area
} else {
    print("error create object")
}

if let myCircle4 = Circle6(myRadius: 0) {
    print("Instances Set")
    myCircle4.myRadius
    myCircle4.circumference
    myCircle4.area
} else {
    print("error create object")
}

//:
//: **Classes and Reference Type**
//:
//: Classes and its instances/objects are reference data type. This means that when you create an instance/object and you assign the instance with another variable, you just pass the reference to the second variable instead of copying the instance to another variable.

let obj1 = Circle6(myRadius: 25.0)
obj1?.area
obj1?.circumference
obj1?.myRadius

let obj2 = obj1
obj2?.myRadius = 30
obj2?.myRadius
obj2?.area
obj2?.circumference

obj1?.myRadius
obj1?.area
obj1?.circumference

//: In the above example, when you assign obj2 with obj1, obj1 just pass its object reference to obj2.
//: 
//: Both obj1 and obj2 are referring to the same instance/object.
//:
//: Also notice that although we declared obj2 as a constant, we can still modified the properties inside obj2.
//: This happens because obj2 stored not the object but the reference address of the instances created by obj1.
//: However, you cannot assign other instance to obj2 again since it is a constant.

//:
//: **Polyphormism**
//:
//: The most exciting about class and instances is its ability to act as same object in the super class. We can group objects under the same super class into a meaningful collection and perform functions or manipulate properties that are common between different objects.
//: For example, we have another class called MainCircle, a sub class called MainCylinder which inherit from MainCircle and a subclass called Cone, which also inherit from MainCircle. We can mixed instances to 2 types (MainCylinder and Cone) and act as circle, however, we cannot mixed and down cast both as cylinder or cone.


class MainCircle {
    var radius: Double
    let pi = 3.1415
    
    init?(radius: Double) {
        if radius != 0 {
            self.radius = radius
        } else {
            return nil
        }
    }
    
    var area: Double {
        get {
            return radius * radius * pi
        }
    }
    
    var circumference: Double {
        get {
            return 2 * radius * pi
        }
    }
}

class MainCylinder: MainCircle {
    var height: Double
    
    init?(radius: Double, height: Double) {
        if radius != 0 && height != 0 {
            self.height = height
            super.init(radius: radius)
        } else {
            return nil
        }
    }
    
    var volume: Double {
        get {
            return self.area * self.height
        }
    }
}

class Cone: MainCircle {
    var height: Double
    
    init?(radius: Double, height: Double) {
        if radius != 0 && height != 0 {
            self.height = height
            super.init(radius: radius)
        } else {
            return nil
        }
    }
    
    var volume: Double {
        get {
            return self.area * (self.height/3)
        }
    }
}

//:

let arrayRoundObject = [MainCylinder(radius: 4.0, height: 10)!, MainCylinder(radius: 13.0, height: 16)!, Cone(radius:6.5, height: 14)!, Cone(radius: 7.5, height: 6.3)!]
//: Note: When creating an array such as the array above if your class init is optional then you need to add `!` at the end of init statement.
var totalNumberOfObject = 0
for eachObject in arrayRoundObject {
    print("Area is \(eachObject.area)")
    //print("Volume is \(eachObject.volume)") // This will produce error as now it recognize the object as super class MainCirlce
    // To get volume we need to cast each object into their respective type
    if let isCylinder = eachObject as? MainCylinder {
        print("This is cylinder, volume is \(isCylinder.volume)")
    }
    if let isCone = eachObject as? Cone {
        print("This is cone, volume is \(isCone.volume)")
    }
    totalNumberOfObject += 1
}

print("Total number of objects = \(totalNumberOfObject)")

/* ---- End ---- */

