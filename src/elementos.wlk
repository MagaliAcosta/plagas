import plagas.*

class Hogar {
	var property nivelMugre
	var property confort
	
	method esBueno() = nivelMugre <= confort / 2
	
	method ataque(plaga) {
		nivelMugre =+ plaga.nivelDanio()
	}
	
}

class Huerta {
	var property capacidadProduccion
	var property nivel 
	
	method esBueno() = capacidadProduccion > nivel 
	
	method ataque(plaga) {
		if (plaga.trasmiteEnfermedades()) 
		capacidadProduccion =- 10 + plaga.nivelDanio() * 0.10 
		else capacidadProduccion =- plaga.nivelDanio() * 0.10
	}
	
}

class Mascota {
	var property nivelSalud
	
	method esBueno() = nivelSalud > 250
	
	method ataque(plaga) {
		if (plaga.trasmiteEnfermedades()) nivelSalud =- plaga.nivelDanio()
	}
	
	
}

class Barrio {
	const property elementos
	
	method esCopado() = self.elementosBuenos().size() > self.elementosMalos().size()
	
	method elementosBuenos() = elementos.filter({ elemento => elemento.esBueno() })
		
	method elementosMalos() = elementos.filter({ elemento => not elemento.esBueno() })
	
}