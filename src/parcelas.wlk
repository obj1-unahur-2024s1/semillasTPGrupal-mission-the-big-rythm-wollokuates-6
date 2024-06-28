class Parcela {
	
	const ancho
	const largo
	const horasDeSolPorDia
	const plantas = []
	
	method horasDeSolPorDia() { return horasDeSolPorDia }
	method superficie() { return ancho * largo }
	method cantidadMaximaDePlantas() { return if(ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo }
	method tieneComplicaciones() { return plantas.any({ planta => planta.horasDeSolQueTolera() < horasDeSolPorDia }) }
	method alcanzoElLimite() { return self.cantidadMaximaDePlantas() == plantas.size() }
	method noPuedeTolerarlo(planta) { return horasDeSolPorDia - planta.horasDeSolQueTolera() >= 2 }
	method plantar(planta) {
		if(self.alcanzoElLimite() or self.noPuedeTolerarlo(planta)){
			self.error("La parcela alcanzó el límite y/o la planta no tolera la cantidad de horas de sol")
		}
		else {
			plantas.add(planta)
		}
	}
	method algunaPlantaSuperaMetroYMedio() { return plantas.any({ planta => planta.altura() > 1.5 }) }
	method cantidadDePlantas() { return plantas.size() }
	method tieneMasDeCuatroPlantas() { return self.cantidadDePlantas() > 4 }
	method seAsociaBien(planta)
	method cantidadDePlantasBienAsociadas() { return plantas.count({ planta => self.seAsociaBien(planta) }) }
	
}

class ParcelaEcologica inherits Parcela {
	
	override method seAsociaBien(planta) { return not self.tieneComplicaciones() and planta.esIdeal(self) }
	
}

class ParcelaIndustrial inherits Parcela {
	
	override method seAsociaBien(planta) { return plantas.size() <= 2 and planta.esFuerte() }
	
}

object inta {
	
	const parcelas = []
	
	method agregar(parcela) { parcelas.add(parcela) }
	method promedioDePlantas() { return parcelas.sum({ parcela => parcela.cantidadDePlantas() }) / parcelas.size() }
	method filtrarParcelas() { return parcelas.filter({ parcela => parcela.tieneMasDeCuatroPlantas() }) }
	method parcelaMasAutosustentable() { return self.filtrarParcelas().max({ parcela => parcela.cantidadDePlantasBienAsociadas() }) }
	
}