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
  var property ataque
  method esEnemigo(){
      return true
  }

  method recibirEspadazo(cantidadDeDaño){
    vida -= cantidadDeDaño
    self.morir()

  }

  method morir(){
    if (vida <= 0){
      game.removeVisual(self)
    }
  }
  
  method colisionar(personaje) {
    personaje.recibirDaño(ataque)
  }

  method esSolido(){
    return false
  }
  method esArmamento(){
    return false
  }
}
object fabricaDeEnemigos{
  method crearEnemigo(){
    return new Enemigo(
                        vida = 100,
                        ataque = 10,
                        position = randomizer.emptyPosition(),
                        image = "enemigo-" + (0.randomUpTo(4)).toString() + ".png" 
    )// mantener esta nomenclatura de "enemigo-" + NUMERO + ".png" y cambiar la cantidad a ser randomizada si llegase a ser mas de 4
  }
}