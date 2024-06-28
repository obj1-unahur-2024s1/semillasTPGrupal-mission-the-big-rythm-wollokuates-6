class Planta {
	
	const anioDeObtencion
	const altura
	
	method anioDeObtencion() { return anioDeObtencion }
	method altura() { return altura }
	method horasDeSolQueTolera()
	method esFuerte() { return self.horasDeSolQueTolera() > 10 }
	method segundaCondicion() 
	method daNuevasSemillas() { return self.esFuerte() or self.segundaCondicion() }
	method espacioQueOcupa()
	method esIdeal(parcela)
	
}

class Menta inherits Planta {
	
	override method horasDeSolQueTolera() { return 6 }
	override method segundaCondicion() { return altura > 0.4 }
	override method espacioQueOcupa() { return altura * 3 }
	override method esIdeal(parcela) { return parcela.superficie() > 6 }
	
}

class Soja inherits Planta {
	
	override method horasDeSolQueTolera() { return if(altura > 1) 9 else if(altura >= 0.5) 7 else 6 }
	override method segundaCondicion() { return anioDeObtencion > 2007 and altura > 1 }
	override method espacioQueOcupa() { return altura / 2 }
	override method esIdeal(parcela) { return parcela.horasDeSolPorDia() == self.horasDeSolQueTolera() }
	
}

class Quinoa inherits Planta {
	
	const horasDeSolQueTolera
	
	override method horasDeSolQueTolera() { return horasDeSolQueTolera }
	override method segundaCondicion() { return anioDeObtencion < 2005 }
	override method espacioQueOcupa() { return 0.5 }
	override method esIdeal(parcela) { return not parcela.algunaPlantaSuperaMetroYMedio() }
	
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() { return false }
	override method esIdeal(parcela) { return parcela.cantidadMaximaDePlantas() == 1 }
	
}

class Hierbabuena inherits Menta {
	
	override method espacioQueOcupa() { return super() * 2 }
	
}