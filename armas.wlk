object espadaComun {
  const atq = 3
  var position = game.at(1,0)

  method atq() {
    return atq
  }

  method image() {
    return "SwordNormal_WollSlayer.png"
  }

  method position() { //metodo necesario para wollok game
	    return position
  }

  method esEnemigo() {
    return false
  }
}

object espadaRara {
  const atq = 6

  method atq() {
    return atq
  }

  method esEnemigo() {
    return false
  }
}

object espadaEpico {
  const atq = 10

  method atq() {
    return atq
  }

  method esEnemigo() {
    return false
  }
}