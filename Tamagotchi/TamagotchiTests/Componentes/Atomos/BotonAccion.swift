import SwiftUI

struct BotonAccion: View {
    let titulo: String
    let accion: () -> Void
    var body: some View {
        Button(action: accion) {
            Text(titulo)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}
