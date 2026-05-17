import wollok.game.*
import direcciones.*
import cofre.*

object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var ataque = 1
  var position = game.origin()
  var image = "doomSlayer-derecha.png"
  var apuntado = derecha
  
  

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
    image = "doomSlayer-walk-" + direccion.toString() + "1.png"
    game.schedule(150, {image = "doomSlayer-" + direccion.toString() + ".png"})
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

  method abrirCofre() {
    self.validarQueHayCofre()
    inventario.add(cofre.abrir())
  }

  method eliminarEnemigoEn(posicion) { 
    game.getObjectsIn(posicion).filter({ e => e.esEnemigo() }).forEach({ enemigo => enemigo.bajarVida(ataque)
                                                                          if (enemigo.vida()< 1) {
                                                                            game.removeVisual(enemigo) } } )                                            // Eliminar enemigo en la posicion dada
  }

  // Consultas

  method validarQueHayCofre() {
    // tambien se podria hacer que el personaje este en la celda lindante y no necesariamente encima.
    if (not(game.onSameCell(position, cofre.position()))){
		self.error("No puedo abrir si no estoy en la misma posicion")
	  }
  }

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

  method cantItems() { // LO USAMOS PARA TESTEAR EL COFRE
    return inventario.size().toString()
  }
}

