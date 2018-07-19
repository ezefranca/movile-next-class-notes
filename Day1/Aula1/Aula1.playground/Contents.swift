///*
///* Aula 1 */
//*/
//
//// Command + Option + /
//
///// Esta é a função Besta
/////
///// ### Lista
///// - Item 1
///// - Item 2
///// - Parameter maisBestaAinda: Parametro tão besta quanto a função
///// - Returns: Nada
////func besta(maisBestaAinda: Int) -> Int {
////    return 0
////}
////
////// Variaveis e constantes
////var grade: Double = 1.0
////let bestMobileOS = " iOS"
////
////// Tipos (São Structs)
////// Int, Double, Float, String, Character
////// Array, Dictionary
////
//////Inferência
////var age = 40
////var _age: Int = 40
////
////var name = "Eric"
////var letter: Character = "a"
////
////var salario: Float = 1000.0
////
//////Optional
////
////var driverLicense: String?
////
////// Optional Chaining
////driverLicense?.uppercased()
////
////driverLicense = "4737363"
////print(driverLicense?.uppercased())
////
//////Jeito vida loka (force wrapping)
////driverLicense!
////
//////Optional binding
////
////func test() {
////    if let driverLicense = driverLicense {
////        print(driverLicense)
////    } else {
////        print("sem carteira")
////    }
////
////    guard let driverLicense = driverLicense else { return }
////    print(driverLicense)
////}
////
//////Operadores
////
////// Nil Coalescing Operator
////
////let myDriverLicense = driverLicense ?? ""
////
//////Ternary
////
////let result = grade > 7 ? "passou" : "reprovou"
////
//////Operadores personalizados
////
////postfix operator >-
////postfix func >-(lhs: Int) -> Int {
////    return lhs * lhs
////}
////
////prefix operator -<
////prefix func -<(rhs: Int) -> Int {
////    return rhs + 1
////}
////
////infix operator >-<
////func >-<(lhs: Int, rhs: Int) -> Int {
////    return (lhs*rhs)/(lhs-rhs)
////}
////
////postfix operator ++
////postfix func ++(lhs: Int) -> Int {
////    return lhs + 1
////}
////
////9>-
////-<9
////9++
////6>-<60
////
////// Estruturas condicao
////
////var speed: Double = 95.0
////
////switch speed {
////case ..<0.0:
////    print("Ré")
////case 0.0..<20.0:
////    print("1 marcha")
////case 20..<50.0:
////    print("2 marcha")
////default:
////    print("Outra marcha qq")
////}
////
////// Controle de fluxo
////// for in
////
////
//////Coleções
////
//////Array
let names: [String] = ["Ezequiel", "Giovani", "Marcelo", "Michelle", "Augusto"]
var emptyArray: [String] = []
////
////names.count
////name.isEmpty
////
////
//////Dictionary
////var states: [String: String] = [:]
//////var dict: [Hashable:Any]
////states["SP"] = "Sao Paulo"
////states["MG"] = "Minas gerais"
////states["PA"] = "Pará"
////states["PA"] = nil
////
////print(states["PA"] ?? "")
////
////for name in names {
////    print(name)
////}
////
////for state in states {
////    print(state.key)
////    print(state.value)
////}
////
//////Set
////var movies: Set = ["Matrix", "Vingadores", "Mensagem pra voce", "Jurassic Park"]
////var myWifeMovies: Set<String> = ["De repente 30", "Mensagem pra voce", "Sintonia do Amor", "Jurassic Park"]
////
////let favorites = movies.intersection(myWifeMovies)
////print(favorites)
////let allMovies = movies.union(myWifeMovies)
////print(allMovies)
//
////Enumeradores
//
//enum Compass: String {
////    case north, south, east, west
//    case north = "norte"
//    case south = "sul"
//    case east = "leste"
//    case west = "oeste"
//}
//
//var compass : Compass = .east
//print(compass.rawValue)
//
//enum Measure {
//    case age(Int)
//    case weight(Double)
//    case size(width: Double, height: Double)
//}
//
////var measure: Measure = .age(30)
//var measure: Measure = .size(width: 10.0, height: 15.0)
//
//switch measure {
//case .age(let age):
//    print("Idade: \(age)")
//case .weight(let peso):
//    print("Peso: \(peso)")
//case .size(let largura, let altura):
//    print("Tamanho: \(largura) x \(altura) ")
//}
//
////Struct vc Classe
//
//class Person {
//    var name: String
//    weak var friend: Person?
//
//    init(name:String) {
//        self.name = name
//    }
//
//    deinit {
//        print("matando a \(name)")
//    }
//}
//
//struct Student {
//    var name: String
//    var friend: Person?
//}
//
//var s1 = Student(name: "Joao", friend: nil)
//var s2 = s1
//
//
//var joao = Person()
//joao.name = "Joao"
//
//var paula = Person()
//paula.name = "Paula"
//
//joao.friend = paula
//paula.friend = joao
//
//joao = nil
//paula = nil
//
//print(joao.name)
//print(paula.name)
//
//

//Funcoes

func say(_ sentence: String, to person: String) {
    print("\(sentence) \(person)")
}

say("Olá", to: "Paulo")


//First Class Citizen

//Closure
func sum(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func divide(_ a: Int, _ b: Int) -> Int {
    return a / b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func apply(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

apply(1, 2, operation: sum)

apply(9, 4) { (x: Int, y: Int) -> Int in
    return x%y
}

apply(9, 4) { (x, y) -> Int in
    return x%y
}

apply(9, 4) { (x, y) -> Int in
    return x%y
}

apply(9, 4, operation: %)

apply(9, 4){$0 % $1}

//High Order Function

class Person {
    var name: String
    let age:Int
    weak var friend: Person?
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("matando a \(name)")
    }
}

var persons = [
    Person(name: "Fernanda", age: 25),
    Person(name: "Carol", age: 33),
    Person(name: "Bia", age: 9),
    Person(name: "Pero", age: 37),
    Person(name: "Jaqueline", age: 22),
    Person(name: "Paula", age: 12)
]

persons.sort(by: {$0.name < $01.name})

let nextYearPersons = persons.map({$0.age+1})
let less30 = persons.filter({$0.age<30})
let totalAge = persons.reduce(0, {$0 + $1.age})




