//: ## Error Handling
//:
//: + In, Swift, we use optional to test if a variable or instance is nil.
//: + For functions and method, we use `throws` to see if the function or method works and the cause of error if it fails.
//: + For errors, we use any data type that conforms to the protocol ErrorType.
//: + It is recommended to use enumeration so that we can group related errors together. Of course the enumeration must conform to ErrorType.
//:
//: The following is the error relating to e-commerce
enum mySellError: ErrorType {
    case soldOut
    case insufficentFund
    case doNotHaveSuchItem
}

//: + We create an inventory for online store
struct onlineItem {
    var price: Double
    var stock: Int
}

var onlineInventory = [
    "USB Cable": onlineItem(price: 5.50, stock: 200),
    "iPhone": onlineItem(price:699.50, stock: 50),
    "Wireless Earphone": onlineItem(price:62.50, stock: 0)
]

struct onlineUser {
    let userID: String
    var funds: Double
}

var user1 = onlineUser(userID: "2231", funds: 45.7)

struct buyStuff {
    let transactionID: Int
    var user: onlineUser
    let itemName: String
    let quantity: Int
}



//: + We use `throw` to throw an error and we use `throws` to indicate a function that can throw an error.


func executeBuy(transDetail: buyStuff) throws -> Bool {
    if let buyItem = onlineInventory[transDetail.itemName] {
        
        if transDetail.quantity > buyItem.stock {
            throw mySellError.soldOut
        }
        
        let totalAmount = Double(transDetail.quantity) * buyItem.price
        
        if totalAmount > transDetail.user.funds {
            throw mySellError.insufficentFund
        }
        
        return true

    } else {
        throw mySellError.doNotHaveSuchItem
    }
    
}

func completeBuy(transDetail: buyStuff) -> onlineUser {
    var newUser: onlineUser
    let totalAmount = Double(transDetail.quantity) * onlineInventory[transDetail.itemName]!.price
    let newFundAvailable = transDetail.user.funds - totalAmount
    newUser = transDetail.user
    newUser.funds = newFundAvailable
    return newUser
}



//: + To execute function with throws, we need to add `try` in front of the function execution expression.
//:
//: + Finally, we use `do-catch` to perform check and handle error. Under `do`, we try functions that throws. The keyword `catch` is to detect error and the code after catch is to handle error.

var transaction1 = buyStuff(transactionID: 10001, user: user1, itemName: "iPhone", quantity: 1)

user1.funds

do {
    let canBuy = try executeBuy(transaction1)
    if canBuy {
        user1 = completeBuy(transaction1)
    }
} catch mySellError.soldOut {
    print("Sorry! The item you want sold out! Return to cart!")
} catch mySellError.insufficentFund {
    print("Sorry! You do not have sufficient fund to purchase the item you want. Either the priceis higher than your available fund or the quantity you want is too much. Consider reducing your quantity. Return to cart!")
} catch mySellError.doNotHaveSuchItem {
    print("Sorry! We do not carry this item!")
}

user1.funds

//: + For function that return value, we can use `try?`. If there is an error, the result will be nil, otherwise the return value will be registered

var transaction2 = buyStuff(transactionID: 10001, user: user1, itemName: "USB Cable", quantity: 5)

user1.funds

if let canBuy = try? executeBuy(transaction2) {
    user1 = completeBuy(transaction2)
}

user1.funds

//: + Please note that when we use `try?` method, if there is any error, the error will de discarded so it is no use in using `do-catch`.
//:
//: + We can also use keyword `defer` to write a block of code that is executed regardless if the function throws an error.

func executeBuy2(transDetail: buyStuff) throws -> Bool {
    if let buyItem = onlineInventory[transDetail.itemName] {
        
        defer {
            print("This code will be executed regardless if this function throws error!")
        }
        
        print("First")
        
        if transDetail.quantity > buyItem.stock {
            throw mySellError.soldOut
        }
        
        let totalAmount = Double(transDetail.quantity) * buyItem.price
        
        if totalAmount > transDetail.user.funds {
            throw mySellError.insufficentFund
        }
        

        return true
        
    } else {
        
        throw mySellError.doNotHaveSuchItem
    }
    
    
}

user1.funds

do {
    let canBuy2 = try executeBuy2(transaction1)
    if canBuy2 {
        user1 = completeBuy(transaction1)
    }
} catch mySellError.soldOut {
    print("Sorry! The item you want sold out! Return to cart!")
} catch mySellError.insufficentFund {
    print("Sorry! Insufficient fund")
} catch mySellError.doNotHaveSuchItem {
    print("Sorry! We do not carry this item!")
}

user1.funds


let canBuy3 = try executeBuy2(transaction2)
canBuy3

/* ---- End ---- */
