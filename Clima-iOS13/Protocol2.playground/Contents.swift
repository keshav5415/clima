/* 
 'AdvancedLifeSupport' is a certificate which is given to someone who has completed the basics of life-saving technique,
 so , the one who will be having this must know how to perform CPR , 'Paramedic' have this certificate.
*/
protocol AdvancedLifeSupport
{
    func performCPR()
}


/*
 ->'emergencyCallHandler' will be sitting on the bench receiving and sending calls , and notify the paramedic about the location for help.
 ->it will be a delegate property !
*/
class emergencyCallHandler
{
    var delegate : AdvancedLifeSupport?
    /*
    this means that whoever sets themselves as the delegate, any class or struct must have the advanced life support
    protocol adopted , so they must be able to know how to performCPR .
    */
    
    // couple of functionalities that 'emergencyCallHandler' has
    func assessSituation()
    {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency()
    {
        /*
        so in this case , what they are going to do is that they are going to call upon the delegate , whoever it maybe ,
        and they have no knowledge or care of who the delegate is , but all they need to do is say , "whoever is on call ,
        please perform CPR on this patient.
        */
        delegate?.performCPR()
        /*
        -> This syntax means if delegate is not nil, call the performCPR() method on the delegate.
        */
    }
}



// defining who the delegate may be !! maybe "paramedic , doctor , surgeon" !
struct paramedic : AdvancedLifeSupport
{
    /*
    ->when the paramedic goes on shift when they are initialized , they get told who the handler is  , so the handler is
    ofcourse , of class 'emergencyCallHandler' .
    ->so when the paramedic goes on shift , the first thing they do is they pick up the beep/call and they set the
     delegate property as themselves.
    -> so, now they are on call !
    */
    
    
    
//    init(handler: emergencyCallHandler)
//    {
//        handler.delegate = self
//    }
    
    func performCPR()
    {
        print("The paramedic does chest compressions , 30 per second.")
    }
    
}

//let emilio = emergencyCallHandler()
//let pete = paramedic(handler: emilio)
//
//emilio.assessSituation()
//emilio.medicalEmergency()

/*
-> now , this is all possible because we are able to use 'protocol' as a 'dataType'
*/


class Doctor : AdvancedLifeSupport
{
    init(handler: emergencyCallHandler)
    {
        handler.delegate = self
    }
    
    func performCPR()
    {
        print("The paramedic does chest compressions , 30 per second.")
    }
    
    func useStethoscope()
    {
        print("Listening for heart sounds")
    }
}

class surgeon : Doctor
{
    
    override func performCPR()
    {
        super.performCPR()
        // 'super' is a keyword used to access the properties and methods of a superclass.
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill()
    {
        print("Whirr....")
    }
}

let keshav = emergencyCallHandler()
let nitin = surgeon(handler: keshav)

keshav.assessSituation()
keshav.medicalEmergency()
