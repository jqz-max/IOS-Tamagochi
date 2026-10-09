import SwiftUI

struct BarraEstadistica: View {
    let titulo: String
    @Binding var valor: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("\(titulo): \(valor)").font(.caption)
            ProgressView(value: Double(valor), total: 100)
        }
    }
}
