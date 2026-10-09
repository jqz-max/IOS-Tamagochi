
import SwiftUI

struct BotonesCicloVida: View {
    let crecer: () -> Void
    let morir: () -> Void
    let reiniciar: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text("Ciclo de vida")
                .font(.headline)

            Button(action: crecer) {
                Label("Crecer de fase", systemImage: "arrow.up.circle.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)

            Button(action: morir) {
                Label("Morir", systemImage: "heart.slash.fill")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)

            Button(action: reiniciar) {
                Label("Volver a huevo", systemImage: "arrow.counterclockwise")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
