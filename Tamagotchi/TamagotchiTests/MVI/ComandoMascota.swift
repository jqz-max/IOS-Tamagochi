
import Foundation

enum ComandoMascota {
    case alimentar
    case jugar
    case dormir
    case limpiar
    case pasarTiempo
    case reiniciar
    case cambiarNombre(String)

    // Controles para la presentación
    case crecerFase
    case morir
}
