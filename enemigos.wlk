import wollok.game.*
import randomizer.*
/*
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
*/

class Enemigo{
  var property position 
  var property vida 
  var property image 
  method esEnemigo(){
      return true
  }

}
object fabricaDeEnemigos{
  method crearOrnstein(){
    return new Enemigo(
      vida = 100,
      position = randomizer.emptyPosition(),
      image = "ornstein.png"
    )
  }
}