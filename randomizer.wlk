import wollok.game.*
object randomizer {
		
	method position() {
		return 	game.at( 
					(0.randomUpTo(game.width() - 1).truncate(0)),
					(0.randomUpTo(game.height() - 1).truncate(0))
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
}