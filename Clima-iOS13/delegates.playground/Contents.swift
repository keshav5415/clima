import UIKit

// MARK: - Delegating class(Intern)
protocol InternDelegate
{
    func workIsDone()
}

class Intern
{
    var delegate: InternDelegate?
    
    func doingWork()
    {
        print("Intern : Doing work...and work is done!")
        delegate?.workIsDone()
    }
}


// MARK: - Delegate class(Boss)
class Boss : InternDelegate
{
    func workIsDone()
    {
        print("Boss : deploying the code and code is deployed!")
    }
}

var intern = Intern()
var boss = Boss()

intern.delegate = boss // // Assign the boss as the delegate of the intern



// MARK: - Execution
intern.doingWork()
