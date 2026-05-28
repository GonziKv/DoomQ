import wollok.game.*
import direcciones.*
import cofre.*

object doomSlayer {
  var property vida = 100
  const inventario = #{}
  var property ataque = 100
  var property position = game.origin()
  var property image = "doomSlayer-derecha.png"
  var apuntado = derecha

  // Acciones

  method agarrarArma(arma) {
    self.validarAgarrarArma(position)
    inventario.add(arma)
    arma.serAgarrada()
  }

  method mover(direccion) {
    const nuevaPosition = direccion.siguiente(position)
    apuntado = direccion
    self.validarMovimiento(nuevaPosition)
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
    return game.getObjectsIn(posicion).any({enemigo => enemigo.esEnemigo()})  //Comprobacion si hay enemigos en la posicion dada
	}

  method validarMovimiento(posicion) {
    if (self.hayObjetoSolido(posicion)){
      self.error("No puedo avanzar")
    }
  }

  method validarAgarrarArma(posicion){
    if (!self.hayArma(posicion)){
      self.error("No hay arma para agarrar")
    }
  }
  method hayArma(posicion){
    return game.getObjectsIn(posicion).any({objeto => objeto.esArmamento()})
  }

  method hayObjetoSolido(posicion){
    return game.getObjectsIn(posicion).any({objeto => objeto.esSolido()})
  }

  method ataqueTotal(){
    return ataque + inventario.sum({arma => arma.atq()})
  }

  method esSolido(){
    return false
  }
  method cantItems() { // LO USAMOS PARA TESTEAR EL COFRE
    return inventario.size().toString()
  }
}