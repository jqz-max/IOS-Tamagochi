
import SwiftUI

struct PantallaJuego: View {
    @ObservedObject var controlador: ControladorJuego

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Información e imagen de la mascota
                PanelMascota(
                    nombre: controlador.mascota.nombre,
                    edad: controlador.mascota.edad,
                    estado: controlador.mascota.estado
                )

                // Estadísticas de la mascota
                PanelEstadisticas(
                    hambre: $controlador.mascota.hambre,
                    felicidad: $controlador.mascota.felicidad,
                    energia: $controlador.mascota.energia,
                    salud: $controlador.mascota.salud
                )

                // Acciones normales de la mascota
                PanelAcciones(
                    alimentar: {
                        controlador.ejecutar(.alimentar)
                    },
                    jugar: {
                        controlador.ejecutar(.jugar)
                    },
                    dormir: {
                        controlador.ejecutar(.dormir)
                    },
                    limpiar: {
                        controlador.ejecutar(.limpiar)
                    },
                    pasarTiempo: {
                        controlador.ejecutar(.pasarTiempo)
                    },
                    reiniciar: {
                        controlador.ejecutar(.reiniciar)
                    }
                )
            }
            .padding()
        }
        .navigationTitle("Tamagotchi")
        .navigationBarTitleDisplayMode(.inline)
    }
}
