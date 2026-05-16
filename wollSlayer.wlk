import wollok.game.*
import direcciones.*

object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var ataque = 1
  var position = game.origin()
  var image = "Idle_WollSlayer.png"
  var apuntado = arriba
  
  

  // Acciones

  method agarrarArma(arma) {
    self.validarEspacio()
    inventario.add(arma)
    game.removeVisual(arma)
  }

  method mover(direccion) {
    const nuevaPosition = direccion.siguiente(position)
    apuntado = direccion
    position = nuevaPosition
    self.animacion1()
    game.onTick(800, "animacion de Movimiento", {image = "Idle_WollSlayer.png"})
  }

  method animacion1() {
    image = "Walk2_WollSlayer.png"
  }

  method atacar() {
    const posicionApuntado = apuntado.siguiente(position) // Devuelve una posicion mas a la que se quedo mirando
    if (self.hayEnemigoEn(posicionApuntado)) {
      self.eliminarEnemigoEn(posicionApuntado)
    }
  }
  
  method position(_position) { //el setter solo lo necesito para testear
		position = _position 
	}

  method eliminarEnemigoEn(posicion) { 
    game.getObjectsIn(posicion).filter({ e => e.esEnemigo() }).forEach({ enemigo => enemigo.bajarVida(ataque)
                                                                          if (enemigo.vida()< 1) {
                                                                            game.removeVisual(enemigo) } } )                                            // Eliminar enemigo en la posicion dada
  }

  // Consultas

  method hayEnemigoEn(posicion) {
    return game.getObjectsIn(posicion).any({enemigo => enemigo.esEnemigo()})  //Comprobacion si hay enemigos en la posicion dada
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