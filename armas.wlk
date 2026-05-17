import wollok.game.*
class Espada{
  const property atq
  const property position
  const property image
  method recibirEspadazo(cant){
  }
   method esSolido(){
    return false
  }
}
object alijoDeEspadas{
  method crearEspadaComun(){
    return new Espada(
                      atq = 3,
                      position = game.at(1, 0),
                      image = "SwordNormal_WollSlayer.png")}
}
/*object espadaComun {
  const atq = 3
  var property position = game.at(1,0)

  method atq() {
    return atq
  }

  method image() {
    return "SwordNormal_WollSlayer.png"
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
}*/