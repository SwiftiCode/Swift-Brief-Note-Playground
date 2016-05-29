import UIKit
//:
//: ## Enumerations and Structures
//:
//: **Enumerations**
//:
//: To create enumerations, use keyword `enum`
//:
//: In Swift, we can associate methods in enumerations
//:


enum Direction1 {
    case North, South, East, West
}
Direction1.South
Direction1.North.hashValue
Direction1.West.hashValue

let east = Direction1.East
east.hashValue

//: By default, Swift starts its enum hash value from 0. We can define the enum as above and use the elements above without considering the hash value if the underlying number is not important
//:
//: However, in cases where underlying number is important, we need to set the starting number. But first lets look at enum if we do not set a starting number as shown below.
enum Month1 {
    case Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
}

Month1.Jan.hashValue
Month1.Jul.hashValue

//: The example above shows that the hash value for months are not exactly right. If we need to utilize the underlying number, Swift allows us to reset the starting number. But first we need to define the raw data type first before we can assign a start number.

enum Month2: Int {
    case Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
}

Month2.Apr
Month2.Jan.hashValue
Month2.Jan.rawValue

//: In the above example, since we define `Int` as its underlying raw value data type, we can set the raw value as per our preference. The hash value remain the same.
//:
//: We can also define the raw value other than `Int`

enum Metric: String {
    case metric = "y", english = "n"
}

Metric.metric.rawValue
Metric.metric.hashValue
Metric.english.rawValue
Metric.english.hashValue

let userInput1 = 130.0
let userInputMetric = "n"
if userInputMetric == Metric.english.rawValue {
    print("Your weight which is \(userInput1) pounds is \(userInput1 * 0.453592) kg.")
}


//: We can also create enum base on yes and no answer
enum GotMetric {
    case no, yes
}

let userInput2 = 250.0
let userInputMetric2 = GotMetric.no
if userInputMetric2 == GotMetric.no {
    print("Your weight which is \(userInput2) pounds is \(userInput2 * 0.453592) kg.")
}


//: We can also add function in the enumeration.
//:
//: In the following example, we will be using the months example and include a function that will return number of days in a month. We ignore leap year in this example.
enum Months: Int {
    case Jan = 1, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    func days() -> Int {
        switch self {
        case .Jan, .Mar, .May, .Jul, .Aug, .Oct, .Dec:
            return 31
        case .Apr, .Jun, .Sep, .Nov:
            return 30
        case .Feb:
            return 28
        }
    }
}

Months.Jul
Months.Jul.rawValue
Months.Jul.days()
Months.Nov.days()
Months.Feb.days()

//: We can use init?(rawValue:) to create an instance from raw value
//:
//: Using the Months example above

let sep = Months.init(rawValue: 9)
sep


//: Another example without meaningful raw value
enum Direction {
    case North, South, East, West
    func displayHeading() -> String {
        switch self {
        case .North:
            return "Heading North"
        case .South:
            return "Heading South"
        case .East:
            return "Heading East"
        case .West:
            return "Heading West"
        }
    }
}

Direction.East.displayHeading()


//: When defining enumeration, we can create an enumeration without raw value and we can associated different value while creating different instance of enum.

enum Metric2 {
    case metric(String)
    case english(String)
}


var myMetric = Metric2.metric("yes")
myMetric
myMetric = Metric2.english("english")
myMetric

var myMetric2 = Metric2.metric("aye")
myMetric2 = Metric2.english("pounds")
myMetric

//: The above example is different from the example below where raw value is predefined. When you set raw value, all difference instances will be the same whereas associated value (example above) can be different.

enum Metric3: String {
    case metric = "y", english = "n"
}

var myMetric3 = Metric3.metric
myMetric3.rawValue

myMetric3 = Metric3.english
myMetric3.rawValue

var myMetric4 = Metric3.metric
myMetric4.rawValue


//: **Structure**
//:
//: In Swift, structures not only contain variables or constant, it can also include function. We can also initialize the structures and include computed properties.
//:
//: The difference between structures and class instances is that structures are copied when assigning to a instance variable whereas instances from objects are referenced.
//:
struct Circle {
    
    var radius: Double
    let myPi = 3.1415
    
    init(radius: Double) {
        self.radius = radius
    }
    
    var area: Double {
        return radius * radius * myPi
    }
    
    var circumference: Double {
        return 2 * radius * myPi
    }
    
    func display() -> String {
        return "The area and circumference of a radius \(radius) is \(area) and \(circumference) respectively."
    }
    
}

let s1 = Circle(radius: 25.0)
s1.area
s1.circumference
s1.radius
s1.display()

var s2 = s1
s2.radius = 30
s2.radius
s2.area
s2.circumference
s2.display()

s1.radius
s1.area
s1.circumference
s1.display()


//: In the above example, when you assign s2 with s1, the entire structure is copied to s2. If you declared s2 as constant, it will be an exact copy of s1. If you declared s2 as a variable, you can modified s2 and the results of s2 and s1 will be different after modification is done on s2.

/* ---- End ---- */
