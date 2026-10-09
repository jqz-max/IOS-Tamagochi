import SwiftUI

struct PanelEstadisticas: View {
    @Binding var hambre: Int
    @Binding var felicidad: Int
    @Binding var energia: Int
    @Binding var salud: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Estadísticas").font(.headline)
            EstadisticasMascota(hambre: $hambre, felicidad: $felicidad, energia: $energia, salud: $salud)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
