
import SwiftUI

struct ControlTamanio: View {
    let crecer: () -> Void
    let reducir: () -> Void
    let restablecer: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text("Tamaño de la mascota")
                .font(.headline)

            HStack(spacing: 12) {
                Button(action: reducir) {
                    Label("Reducir", systemImage: "minus.magnifyingglass")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button(action: restablecer) {
                    Label("Normal", systemImage: "arrow.counterclockwise")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button(action: crecer) {
                    Label("Crecer", systemImage: "plus.magnifyingglass")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
