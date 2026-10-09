
import SwiftUI

struct PanelMascota: View {
    let nombre: String
    let edad: Int
    let estado: EstadoMascota
    var escala: CGFloat = 1.0

    var body: some View {
        VStack(spacing: 15) {
            InformacionMascota(
                nombre: nombre,
                edad: edad
            )

            ImagenMascota(
                estado: estado,
                escala: escala
            )

            Text("Estado: \(nombreEstado)")
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }

    private var nombreEstado: String {
        switch estado {
        case .huevo:
            return "Huevo"
        case .bebe:
            return "Bebé"
        case .nino:
            return "Niño"
        case .adulto:
            return "Adulto"
        case .muerto:
            return "Muerto"
        }
    }
}
