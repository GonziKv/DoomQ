import wollok.game.*
import direcciones.*
object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var ataque = 1
  var position = game.origin()
  var direccionApuntado = derecha
  var image = "doomSlayer-derecha.png"

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
    image = "doomSlayer-walk-" + direccion.toString() + "1.png"
    game.schedule(150, {image = "doomSlayer-" + direccion.toString() + ".png"})
}

  method atacar() {
    if (self.hayEnemigoEn(direccionApuntado.siguiente(position))) {
      game.getObjectsIn(direccionApuntado).forEach({objeto => game.removeVisual(objeto)})
    }
  }
  
  method position(_position) { //el setter solo lo necesito para testear
		position = _position 
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
