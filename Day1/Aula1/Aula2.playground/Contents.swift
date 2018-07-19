// Tratamento de erro
import Foundation

enum AcessError: Error {
    case wrongPassword
    case wrongUser
    case wrongLogin
}

func login(user:String, password:String) throws -> String {
    
    let correctUsers: String = "movile"
    let correctPass: String = "movile"
    
    if user != correctUsers && password != correctPass {
        throw AcessError.wrongLogin
    } else if user != correctUsers {
        throw AcessError.wrongUser
    } else if password != correctPass {
        throw AcessError.wrongPassword
    } else {
        return "Login com sucesso"
    }
}

do {
    let result = try login(user: "movilex", password: "movile")
    print(result)
} catch {
    print(error)
}

//Generics

func swapInt(_ a: inout Int,_ b: inout Int) {
    let t = a
    a = b
    b = t
}

var a = 10
var b = 20

swap(&a, &b)
a
b

func swap<Movile>(_ a: inout Movile,_ b: inout Movile) {
    let t = a
    a = b
    b = t
}

var name1 = "batata"
var name2 = "quente"

swap(&name1, &name2)

name1
name2

class Temperature {
    //Propriedade Armazenada
    var celsius: Double
    
    //Propriedades Computada
    var fahrenheit: Double {
        get {
            return celsius * 9 / 5 + 32
        }
        set {
            celsius = (newValue - 32) * 5 / 9
        }
        
    }
    
    init(celsius:Double) {
        self.celsius = celsius
    }
    
    convenience init () {
        self.init(celsius: 0)
    }
}

var temp = Temperature(celsius: 20)
temp.celsius
temp.fahrenheit

temp.fahrenheit = 68
temp.celsius


//Lazy

class Game {
    var score: Int = 0
    lazy var scoreDescription = "Score initial: \(score)"
    lazy var enemyManager: EnemyManager = EnemyManager()
    
    func add(enemy: Enemy) {
        enemyManager.register(enemy)
    }
    
}

class Enemy {
    
}

class EnemyManager {
    var enemies: [Enemy] = []
    
    func register(_ enemy: Enemy) {
        enemies.append(enemy)
    }
    
    init() {
        print("EnemyManager -> init")
    }
}

let game = Game()
game.add(enemy: Enemy())


//Extensions
extension String {
    var initials : String {
        get {
            return String(self.split(separator: " ").map( {$0.first ?? Character("")} ))
        }
    }
    
    subscript(a: Int) -> String {
        get {
            return String(Array(self)[a])
        }
        set {
            // Fazer em casa
        }
    }
}
"Eric Faria Brito".initials
"Eric Faria Brito"[7]


//Protocolos

class Vehicle {
    
}

protocol ACCapable {
    var hasAC: Bool {get set}
    func turn(on: Bool)
}

class Automobile: Vehicle, ACCapable {
    var hasAC: Bool
    
    func turn(on: Bool) {
        if on {
            print("Ligada")
        } else {
            print("Desligado")
        }
    }
    
    init(hasAc: Bool) {
        self.hasAC = hasAc
    }
}




