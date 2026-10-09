import SwiftUI

struct EstadisticasMascota: View {
    @Binding var hambre: Int
    @Binding var felicidad: Int
    @Binding var energia: Int
    @Binding var salud: Int
    var body: some View {
        VStack(spacing: 10) {
            BarraEstadistica(titulo: "Hambre", valor: $hambre)
            BarraEstadistica(titulo: "Felicidad", valor: $felicidad)
            BarraEstadistica(titulo: "Energía", valor: $energia)
            BarraEstadistica(titulo: "Salud", valor: $salud)
        }
    }
}
