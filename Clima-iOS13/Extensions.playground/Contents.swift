import UIKit

let myDouble = 34.24345

let myRoundedDouble = myDouble.rounded()  // inbuilt functions in swift .rounded()

print(myRoundedDouble)


// with the concept of extension , we can add more functionality to the predefined function.

// let's make some addition to the rounded function over here

extension Double
{
    func rounded(to places : Int) -> Double
    {
        let precisionNumber = pow(10 , Double(places))
        var n = self
        n = n * precisionNumber
        n = n.rounded()
        n = n / precisionNumber
        return n
    }
}

print(myDouble.rounded(to: 2))


// MARK: - Next Example


/*
 ->there are many codes which are open source like the "Double" so we can see it's implementation , but there are many things like those
 which come from UIKit like "UIViewController" and "UITextField" and all is not open source . so we can't see the code of implementation os
 "UILabel" and "UIButton" , but
 ->we can extend those Classes even though we don't have access to it's codebase
*/

let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button1.backgroundColor = .red
// now  converting button into circular

button1.layer.cornerRadius = 25
button1.clipsToBounds = true
 
/*
 ->without clipsToBounds = true, the content inside the button (like text or images) could overflow beyond the rounded corners, and the
   button wouldn't appear fully circular.
 ->By setting clipsToBounds = true, you ensure that any parts of the button's content that extend outside its rounded corners are not
   shown, preserving the circular or rounded shape.
*/


// i don't want to write this code all the time , when i want to make my button circular , so

extension UIButton
{
    func makeCircular()
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}


let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button2.backgroundColor = .red
button2.makeCircular()


// MARK: - Next Example

// use of "extension" in 'protocol"
protocol canFly
{
    func canFly()
}

extension canFly
{
    func canFly()
    {
        print("The object takes off into the air.")
    }
}

class Aeroplane : canFly
{
    
}

let myPlane = Aeroplane()
myPlane.canFly() // The object takes off into the air.



class Bird : canFly
{
    func canFly() 
    {
        print("go go up!")
    }
}

let myBird = Bird()
myBird.canFly() // go go up!

/* 
 if there's nothing inside the class , and then "canFly" is called then func inside extension is used , otherwise func inside the class
 will be used !
*/
