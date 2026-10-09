import SwiftUI

struct InformacionMascota: View {
    let nombre: String
    let edad: Int
    var body: some View {
        VStack(spacing: 5) {
            Text(nombre).font(.title).fontWeight(.bold)
            Text("Edad: \(edad)").font(.subheadline)
        }
    }
}
