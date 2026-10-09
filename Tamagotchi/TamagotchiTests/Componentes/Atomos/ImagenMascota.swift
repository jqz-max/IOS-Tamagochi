
import SwiftUI

struct ImagenMascota: View {
    let estado: EstadoMascota
    var escala: CGFloat = 1.0

    var body: some View {
        VStack {
            switch estado {
            case .huevo:
                Text("🥚")
                    .font(.system(size: 120))

            case .bebe:
                Text("🐣")
                    .font(.system(size: 120))

            case .nino:
                Text("🐥")
                    .font(.system(size: 120))

            case .adulto:
                Text("🐤")
                    .font(.system(size: 120))

            case .muerto:
                Text("💀")
                    .font(.system(size: 120))
            }
        }
        .frame(maxWidth: .infinity)
        .scaleEffect(escala)
        .animation(.spring(response: 0.3), value: escala)
    }
}
