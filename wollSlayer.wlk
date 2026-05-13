import wollok.game.*
import direcciones.*
object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var ataque = 1
  var position = game.origin()
  var image = "Idle_WollSlayer.png"
  var direccionApuntado = null

  // Acciones

  method agarrarArma(arma) {
    self.validarEspacio()
    inventario.add(arma)
    game.removeVisual(arma)
  }

  method mover(direccion) {
    const nuevaPosition = direccion.siguiente(position)
    position = nuevaPosition
    direccionApuntado = direccion
    self.animacion1()
    game.onTick(800, "animacion de Movimiento", {image = "Idle_WollSlayer.png"})
  }

  method animacion1() {
    image = "Walk2_WollSlayer.png"
  }

  method atacar() {
    if (self.hayEnemigoEn(direccionApuntado.siguiente(position))) {
      game.getObjectsIn(direccionApuntado).forEach({objeto => game.removeVisual(objeto)})
    }
  }

  // Consultas

  method hayEnemigoEn(posicion) {
    return game.getObjectsIn(posicion).any({objeto => objeto.esEnemigo()})
	}

  method validarEspacio() {
    
  }

  method position() { //metodo necesario para wollok game
		return position
	}

  method image() { //metodo necesario para wollok game
    return image
  }

  method ataque() {
    return ataque
  }

  method vida() {
    return vida
  }
}