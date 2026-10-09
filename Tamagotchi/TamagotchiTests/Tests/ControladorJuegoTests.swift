import XCTest
@testable import Tamagotchi

final class ControladorJuegoTests: XCTestCase {
    func testMascotaIniciaCorrectamente() {
        let c = ControladorJuego()
        XCTAssertEqual(c.mascota.nombre, "Jaquez")
        XCTAssertEqual(c.mascota.hambre, 70)
        XCTAssertEqual(c.mascota.felicidad, 70)
        XCTAssertEqual(c.mascota.energia, 70)
        XCTAssertEqual(c.mascota.salud, 100)
        XCTAssertEqual(c.mascota.edad, 0)
        XCTAssertEqual(c.mascota.estado, .huevo)
    }
    func testAlimentarAumentaHambreYSalud() {
        let c = ControladorJuego(); c.ejecutar(.alimentar)
        XCTAssertEqual(c.mascota.hambre, 90); XCTAssertEqual(c.mascota.salud, 100)
    }
    func testJugarAumentaFelicidadYReduceEnergia() {
        let c = ControladorJuego(); c.ejecutar(.jugar)
        XCTAssertEqual(c.mascota.felicidad, 90); XCTAssertEqual(c.mascota.energia, 60)
    }
    func testDormirAumentaEnergiaYReduceHambre() {
        let c = ControladorJuego(); c.ejecutar(.dormir)
        XCTAssertEqual(c.mascota.energia, 100); XCTAssertEqual(c.mascota.hambre, 60)
    }
    func testLimpiarAumentaSalud() {
        let c = ControladorJuego(); c.mascota.salud = 80; c.ejecutar(.limpiar)
        XCTAssertEqual(c.mascota.salud, 95)
    }
    func testPasarTiempoModificaEstadisticas() {
        let c = ControladorJuego(); c.ejecutar(.pasarTiempo)
        XCTAssertEqual(c.mascota.edad, 1); XCTAssertEqual(c.mascota.hambre, 60)
        XCTAssertEqual(c.mascota.energia, 65); XCTAssertEqual(c.mascota.felicidad, 65)
    }
    func testMascotaEvolucionaDeHuevoABebe() {
        let c = ControladorJuego(); c.ejecutar(.pasarTiempo)
        XCTAssertEqual(c.mascota.estado, .bebe)
    }
    func testMascotaEvolucionaDeBebeANino() {
        let c = ControladorJuego(); c.mascota.estado = .bebe; c.mascota.edad = 2
        c.ejecutar(.pasarTiempo)
        XCTAssertEqual(c.mascota.edad, 3); XCTAssertEqual(c.mascota.estado, .nino)
    }
    func testMascotaEvolucionaDeNinoAAdulto() {
        let c = ControladorJuego(); c.mascota.estado = .nino; c.mascota.edad = 6
        c.ejecutar(.pasarTiempo)
        XCTAssertEqual(c.mascota.edad, 7); XCTAssertEqual(c.mascota.estado, .adulto)
    }
    func testEstadisticasNoSuperanCien() {
        let c = ControladorJuego(); c.mascota.hambre = 95; c.mascota.salud = 95
        c.ejecutar(.alimentar)
        XCTAssertEqual(c.mascota.hambre, 100); XCTAssertEqual(c.mascota.salud, 100)
    }
    func testEstadisticasNoBajanDeCero() {
        let c = ControladorJuego(); c.mascota.energia = 5; c.mascota.hambre = 5; c.mascota.felicidad = 5
        c.ejecutar(.pasarTiempo)
        XCTAssertGreaterThanOrEqual(c.mascota.energia, 0); XCTAssertGreaterThanOrEqual(c.mascota.hambre, 0)
        XCTAssertGreaterThanOrEqual(c.mascota.felicidad, 0); XCTAssertGreaterThanOrEqual(c.mascota.salud, 0)
    }
    func testCambiarNombre() {
        let c = ControladorJuego(); c.ejecutar(.cambiarNombre("Firulais"))
        XCTAssertEqual(c.mascota.nombre, "Firulais")
    }
    func testNoPermiteNombreVacio() {
        let c = ControladorJuego(); c.ejecutar(.cambiarNombre(""))
        XCTAssertEqual(c.mascota.nombre, "Jaquez")
    }
    func testMascotaMuereCuandoSuSaludLlegaACero() {
        let c = ControladorJuego(); c.mascota.salud = 5; c.mascota.hambre = 0; c.mascota.energia = 0; c.mascota.felicidad = 0
        c.ejecutar(.pasarTiempo)
        XCTAssertEqual(c.mascota.salud, 0); XCTAssertEqual(c.mascota.estado, .muerto)
    }
    func testMascotaMuertaNoPuedeRealizarAcciones() {
        let c = ControladorJuego(); c.mascota.estado = .muerto; c.mascota.hambre = 50; c.mascota.felicidad = 50; c.mascota.energia = 50; c.mascota.salud = 50
        c.ejecutar(.alimentar); c.ejecutar(.jugar); c.ejecutar(.dormir); c.ejecutar(.limpiar); c.ejecutar(.pasarTiempo)
        XCTAssertEqual(c.mascota.hambre, 50); XCTAssertEqual(c.mascota.felicidad, 50); XCTAssertEqual(c.mascota.energia, 50); XCTAssertEqual(c.mascota.salud, 50)
    }
    func testReiniciarDevuelveMascotaAEstadoInicial() {
        let c = ControladorJuego(); c.ejecutar(.pasarTiempo); c.ejecutar(.jugar); c.ejecutar(.cambiarNombre("Firulais")); c.ejecutar(.reiniciar)
        XCTAssertEqual(c.mascota.nombre, "Jaquez"); XCTAssertEqual(c.mascota.hambre, 70); XCTAssertEqual(c.mascota.felicidad, 70)
        XCTAssertEqual(c.mascota.energia, 70); XCTAssertEqual(c.mascota.salud, 100); XCTAssertEqual(c.mascota.edad, 0); XCTAssertEqual(c.mascota.estado, .huevo)
    }
}
