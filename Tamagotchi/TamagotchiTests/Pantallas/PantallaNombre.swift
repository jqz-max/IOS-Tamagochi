import SwiftUI

struct PantallaNombre: View {
    @ObservedObject var controlador: ControladorJuego
    @State private var nombre = ""
    @State private var mostrarJuego = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Tu nueva mascota").font(.largeTitle).fontWeight(.bold)
            ImagenMascota(estado: controlador.mascota.estado)
            Text("¿Cómo quieres llamarla?").font(.headline)
            TextField("Nombre de tu mascota", text: $nombre)
                .textFieldStyle(.roundedBorder)
            BotonAccion(titulo: "Comenzar", accion: comenzarJuego)
        }
        .padding()
        .navigationDestination(isPresented: $mostrarJuego) {
            PantallaJuego(controlador: controlador)
        }
    }
    private func comenzarJuego() {
        let nombreLimpio = nombre.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !nombreLimpio.isEmpty else { return }
        controlador.ejecutar(.cambiarNombre(nombreLimpio))
        mostrarJuego = true
    }
}
