import SwiftUI

struct PanelAcciones: View {
    let alimentar: () -> Void
    let jugar: () -> Void
    let dormir: () -> Void
    let limpiar: () -> Void
    let pasarTiempo: () -> Void
    let reiniciar: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Acciones").font(.headline)
            GrupoBotones(alimentar: alimentar, jugar: jugar, dormir: dormir, limpiar: limpiar)
            BotonAccion(titulo: "Pasar tiempo", accion: pasarTiempo)
            BotonAccion(titulo: "Reiniciar", accion: reiniciar)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}


