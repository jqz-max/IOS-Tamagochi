import Foundation

struct Mascota {
    var nombre: String
    var hambre: Int = 70
    var felicidad: Int = 70
    var energia: Int = 70
    var salud: Int = 100
    var edad: Int = 0
    var estado: EstadoMascota = .huevo
}
