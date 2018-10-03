// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrarSueldo() {
		asociacionDeProfesionales.donacionesRecibidas(self)
	}
}


object asociacionDeProfesionales {
	var donacionesRecibidas
	 
	method donacionesRecibidas(unProfesional) {
		donacionesRecibidas += unProfesional.honorariosPorHora() 
	}  
	
}

// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() = universidad.provincia()
	method honorariosPorHora()= universidad.honorariosPorHora()
	
	method cobrarSueldo() {
		universidad.donacionesRecibidas(self) 
	} 
	
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var provinciasDondePuedeTrabajar = #{}
	var honorariosPorHora
	var totalRecaudado
	
	method universidad() { return universidad }
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() = provinciasDondePuedeTrabajar
	method honorariosPorHora() = honorariosPorHora
	method cobrarSueldo() {totalRecaudado += self.honorariosPorHora()}
	method recibirDonacion(unMonto) {
		totalRecaudado += unMonto
	}
	
	method pasarDinero(otroProfesional, unMonto) {
		otroProfesional.recibirDonacion(unMonto) 
		totalRecaudado -= unMonto
	}
}


class Universidad {
	var donacionesRecibidas = 0
	var property  provincia = #{}
	var property honorariosPorHora = 0
	
	method donacionesRecibidas(unProfesional) {
		donacionesRecibidas += unProfesional.honorariosPorHora() / 2
	} 
	
}
















