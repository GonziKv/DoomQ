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

  method recibirEspadazo(cantidadDeDaño){
    vida -= cantidadDeDaño
    if (vida >= 0){
      self.morir()
    }
  }

  method morir(){
    if (vida <= 0){
      game.removeVisual(self)
    }
  }
}
object fabricaDeEnemigos{
  method crearEnemigo(){
    return new Enemigo(
                        vida = 1,
                        position = randomizer.emptyPosition(),
                        image = "enemigo-" + (0.randomUpTo(4)).toString() + ".png" 
    )// mantener esta nomenclatura de "enemigo-" + NUMERO + ".png" y cambiar la cantidad a ser randomizada si llegase a ser mas de 4
  }
}