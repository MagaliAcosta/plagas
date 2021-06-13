class Plaga {
	var property poblacion
	var property nivelDanio
	
	method trasmiteEnfermedades() = poblacion >= 10
	
	method ataque(elemento) {
		self.aumentaPoblacion()
		elemento.ataque(self)
	}
	
	method aumentaPoblacion() { poblacion =+ poblacion * 0.10 }
}

class Cucarachas inherits Plaga {
	var property pesoPromedio
	
	override method nivelDanio() = poblacion / 2 
	
	override method trasmiteEnfermedades() = super() and pesoPromedio >= 10
	
	override method ataque(elemento) {
		pesoPromedio =+ 2
		super(elemento)
	}
	
}

class Mosquitos inherits Plaga {
	
	override method nivelDanio() = poblacion
	
	override method trasmiteEnfermedades() = super() and poblacion % 3 == 0 
	
}

class Pulgas inherits Plaga {
	
	override method nivelDanio() = poblacion * 2
	
}

class Garrapatas inherits Pulgas {
	
	override method aumentaPoblacion() { poblacion =+ poblacion * 0.20 }
}