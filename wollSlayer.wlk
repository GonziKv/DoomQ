import wollok.game.*
import direcciones.*

object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var property ataque = 1
  var property position = game.origin()
  var property image = "doomSlayer-derecha.png"
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
    self.validarEspacio(nuevaPosition)
    position = nuevaPosition
    image = "doomSlayer-walk-" + direccion.toString() + "1.png"
    game.schedule(150, {image = "doomSlayer-" + direccion.toString() + ".png"})
}

  method atacar() {
    const posicionApuntado = apuntado.siguiente(position) // Devuelve una posicion mas a la que se quedo mirando
    self.objetosRecibenEspadazo(posicionApuntado)

  }

  method position(_position) { //el setter solo lo necesito para testear
		position = _position 
	}

  method objetosRecibenEspadazo(posicion) { 
    game.getObjectsIn(posicion).forEach({ objeto => objeto.recibirEspadazo(self.ataqueTotal())})
  }

  method recibirDaño(cant){
    vida -= cant
    self.morir()
  }

  method morir(){
    if (vida <= 0){
      game.schedule(800, {game.stop()})
    }
  }

  // Consultas

  method hayEnemigoEn(posicion) {
    return game.getObjectsIn(posicion).any({enemigo => enemigo.esEnemigo()})  //Comprobacion si hay enemigos en la posicion dada
	}

  method validarEspacio(posicion) {
    if (game.getObjectsIn(posicion).any({objeto => objeto.esSolido()})){
      self.error("No puedo avanzar")
    }
  }

  method ataqueTotal(){
    return ataque + inventario.sum({arma => arma.atq()})
  }
}
