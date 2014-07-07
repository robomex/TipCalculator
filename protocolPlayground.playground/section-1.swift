// Protocol Playground


@objc protocol Speaker {
    func Speak()
    @optional func TellJoke()
}

class Vicki: Speaker {
    func Speak() {
        println("Hello, I am Vicki!")
    }
    func TellJoke() {
        println("Q: What did Sushi A say to Sushi B?")
    }
}

class Ray: Speaker {
    func Speak() {
        println("Yo, I am Ray!")
    }
    func TellJoke() {
        println("Q: What's the object-oriented way to become wealthy?")
    }
    func WriteTutorial() {
        println("I'm on it!")
    }
}

class Animal {
}

class Dog : Animal, Speaker {
    func Speak() {
        println("Woof!")
    }
}


var speaker: Speaker
speaker = Ray()
speaker.Speak()
// speaker.WriteTutorial() // error! error since WriteTutorial() doesn't exist in the speaker protocol
(speaker as Ray).WriteTutorial()
speaker = Vicki()
speaker.Speak()

speaker.TellJoke?()
speaker = Dog()
speaker.TellJoke?()

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker)
}

class LoggingDateSimulator: DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
        println("Date started!")
    }
    func dateSimulatorDidEnd(sim:DateSimulator, a:Speaker, b:Speaker) {
        println("Date ended!")
    }
}

class DateSimulator {
    
    let a:Speaker
    let b:Speaker
    var delegate:DateSimulatorDelegate?
    
    init(a:Speaker, b:Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        delegate?.dateSimulatorDidStart(self, a:a, b:b)
        println("Off to dinnder...")
        a.Speak()
        b.Speak()
        println("Walking back home...")
        a.TellJoke?()
        b.TellJoke?()
        delegate?.dateSimulatorDidEnd(self, a:a, b:b)
    }
}

let sim = DateSimulator(a:Vicki(), b:Ray())
sim.delegate = LoggingDateSimulator()
sim.simulate()
