import wollok.game.*
import direcciones.*
import cofre.*

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
  
  method position(_position) { //el setter solo lo necesito para testear
		position = _position 
	}

  method abrirCofre() {
    self.validarQueHayCofre()
    inventario.add(cofre.abrir())
  }

  // Consultas

  method validarQueHayCofre() {
    // tambien se podria hacer que el personaje este en la celda lindante y no necesariamente encima.
    if (not(game.onSameCell(position, cofre.position()))){
		self.error("No puedo abrir si no estoy en la misma posicion")
	  }
  }

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

  method cantItems() { // LO USAMOS PARA TESTEAR EL COFRE
    return inventario.size().toString()
  }
}