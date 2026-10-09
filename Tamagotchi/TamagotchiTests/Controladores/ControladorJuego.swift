import SwiftUI
import Combine

class ControladorJuego: ObservableObject {
    @Published var mascota: Mascota
    init() { mascota = Mascota(nombre: "Jaquez") }

    func ejecutar(_ comando: ComandoMascota) {
        switch comando {
        case .alimentar: alimentar()
        case .jugar: jugar()
        case .dormir: dormir()
        case .limpiar: limpiar()
        case .pasarTiempo: pasarTiempo()
        case .reiniciar: reiniciar()
        case .cambiarNombre(let nombre): cambiarNombre(nombre)
        
        case .crecerFase:crecerFase()

        case .morir:
            mascota.estado = .muerto

        }
    }

    private func alimentar() {
        guard mascota.estado != .muerto else { return }
        mascota.hambre += 20
        mascota.salud += 5
        limitarEstadisticas()
    }

    private func jugar() {
        guard mascota.estado != .muerto else { return }
        mascota.felicidad += 20
        mascota.energia -= 10
        limitarEstadisticas()
    }

    private func dormir() {
        guard mascota.estado != .muerto else { return }
        mascota.energia += 30
        mascota.hambre -= 10
        limitarEstadisticas()
    }

    private func limpiar() {
        guard mascota.estado != .muerto else { return }
        mascota.salud += 15
        limitarEstadisticas()
    }

    private func pasarTiempo() {
        guard mascota.estado != .muerto else { return }
        mascota.edad += 1
        mascota.hambre -= 10
        mascota.energia -= 5
        mascota.felicidad -= 5
        limitarEstadisticas()
        actualizarSalud()
        actualizarEstado()
    }

    private func cambiarNombre(_ nombre: String) {
        let nombreLimpio = nombre.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !nombreLimpio.isEmpty else { return }
        mascota.nombre = nombreLimpio
    }

    private func reiniciar() { mascota = Mascota(nombre: "Jaquez") }

    private func limitarEstadisticas() {
        mascota.hambre = min(max(mascota.hambre, 0), 100)
        mascota.felicidad = min(max(mascota.felicidad, 0), 100)
        mascota.energia = min(max(mascota.energia, 0), 100)
        mascota.salud = min(max(mascota.salud, 0), 100)
    }

    private func actualizarSalud() {
        if mascota.hambre == 0 { mascota.salud -= 10 }
        if mascota.energia == 0 { mascota.salud -= 5 }
        if mascota.felicidad == 0 { mascota.salud -= 5 }
        limitarEstadisticas()
    }

    private func actualizarEstado() {
        if mascota.salud <= 0 {
            mascota.estado = .muerto
            return
        }
        evolucionarMascota()
    }

    private func evolucionarMascota() {
        switch mascota.estado {
        case .huevo:
            if mascota.edad >= 1 { mascota.estado = .bebe }
        case .bebe:
            if mascota.edad >= 3 { mascota.estado = .nino }
        case .nino:
            if mascota.edad >= 7 { mascota.estado = .adulto }
        case .adulto, .muerto:
            break
        }
    }
    
    private func crecerFase() {
        switch mascota.estado {
        case .huevo:
            mascota.estado = .nino
            mascota.edad = 3

        case .bebe:
            mascota.estado = .nino
            mascota.edad = 3

        case .nino:
            mascota.estado = .adulto
            mascota.edad = 7

        case .adulto, .muerto:
            break
        }
    }

    
    
}
