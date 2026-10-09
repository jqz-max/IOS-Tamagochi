import SwiftUI

struct GrupoBotones: View {
    let alimentar: () -> Void
    let jugar: () -> Void
    let dormir: () -> Void
    let limpiar: () -> Void
    var body: some View {
        VStack(spacing: 10) {
            BotonAccion(titulo: "Alimentar", accion: alimentar)
            BotonAccion(titulo: "Jugar", accion: jugar)
            BotonAccion(titulo: "Dormir", accion: dormir)
            BotonAccion(titulo: "Limpiar", accion: limpiar)
        }
    }
}
