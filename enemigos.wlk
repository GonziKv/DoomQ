object ornstein {
  var position = game.at(7, 8)
  var vida = 2

  method esEnemigo() {
    return true
  }

  method bajarVida(vidaPerdida) {
    vida -= vidaPerdida
  }

  method vida() {
    return vida
  }

  method position() {
    return position
  }

  method image() {
    return "doomSlayer-abajo.png"
  }
}