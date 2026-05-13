import wollok.game.*
import direcciones.*
object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var ataque = 1
  var position = game.origin()
  var image = "Idle_WollSlayer.png"
  

  // Acciones

  method agarrarArma(arma) {
    self.validarEspacio()
    inventario.add(arma)
    game.removeVisual(arma)
  }

  method mover(direccion) {
    const nuevaPosition = direccion.siguiente(position)
    position = nuevaPosition
    self.animacion1()
    game.onTick(800, "animacion de Movimiento", {image = "Idle_WollSlayer.png"})
  }

  method animacion1() {
    image = "Walk2_WollSlayer.png"
  }

  method atacar() {
    const areaEfecto = [self.position().up(1),self.position().down(1),self.position().left(1),self.position().right(1)] //Area de efecto del ataque
    if (areaEfecto.any({p => self.hayEnemigoEn(p)})) {
      areaEfecto.forEach({p => self.eliminarEnemigoEn(p)})
    }
  }

  method eliminarEnemigoEn(posicion) { 
    game.getObjectsIn(posicion).filter({ e => e.esEnemigo() }).forEach({ enemigo => game.removeVisual(enemigo) }) // Eliminar enemigo en la posicion dada
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