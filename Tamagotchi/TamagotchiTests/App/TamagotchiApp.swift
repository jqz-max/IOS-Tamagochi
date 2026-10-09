import SwiftUI

@main
struct TamagotchiApp: App {
    @StateObject private var controlador = ControladorJuego()
    var body: some Scene {
        WindowGroup {
            NavigationStack { PantallaNombre(controlador: controlador) }
        }
    }
}
