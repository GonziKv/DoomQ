import wollSlayer.*
import armas.*


object cofre {
  // esto se puede cambiar a listaDeObjetos y que tenga espadas e items o vida/perks
  var property listaDeArmas = [espadaComun, espadaRara, espadaEpico]
  var property position = game.at(7, 4)

  method image() {
    // cambiar por la imagen del cofre cuando este disponible.
    return "TeleWollSlayer.png"
  }

  method abrir() {
    return listaDeArmas.anyOne() // .anyOne() devuelve un elemento aleatorio de una lista/conjunto.
  }

  method esEnemigo() {
    return false
  }
}