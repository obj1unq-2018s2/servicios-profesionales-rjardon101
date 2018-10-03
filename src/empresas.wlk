import profesionales.*
import solicitantes.*

class Empresa {
	var profesionales = #{}
    var property honorarioDeReferencia = 0
    var property clientes
    	
	method profesionalesCaros() = profesionales.filter({profesional => 
		                            profesional.honorariosPorHora() > self.honorarioDeReferencia()})
	
	method universidadesFormadoras() = profesionales.map({profesional => profesional.universidad()}).asSet()
		
	method profesionalMasBarato() = profesionales.min({profesional => profesional.honorariosPorHora()})
    
    method mapeoDeProvinciasDeProfesional() = profesionales.map({profesional => profesional.provinciasDondePuedeTrabajar()}).flatten()
   
    method hayProfesionalEn(unaProvincia) = self.mapeoDeProvinciasDeProfesional().contains(unaProvincia)
    
    method nroDeProfesionalesDeUniversidad(unaUniversidad) = profesionales.filter({profesional =>
    	                                                       profesional.universidad() == unaUniversidad}).size()

    
    method interseccionDeProvincias(unProfesional) = unProfesional.provinciasDondePuedeTrabajar().intersection(self.mapeoDeProvinciasDeProfesional())
    
    //si está vacío significa que no hay una provincia que el pueda ocupar 
    method noPuedeOcuparUnaProvincia(unProfesional) = unProfesional.provinciasDondePuedeTrabajar().difference(self.interseccionDeProvincias(unProfesional)).isEmpty()
    
   // me venció...por ahora
   // method esPocoAtractivo(unProfesional, unaProvincia) = self.noPuedeOcuparUnaProvincia(unProfesional) and  self.noEsTrabajadorMasBaratoEnLaProvincia(unProfesional, unaProvincia)
    
    method puedeSatisfacerA(unCliente) = unCliente.puedeSerAtendidoPor(self)
    
    method profesionalPorProvicia(unaProvincia) = profesionales.filter({profesional => profesional.provinciasDondePuedeTrabajar().contains(unaProvincia)}).any()
    
    
    method darServicio(unCliente) {
    	if(self.puedeSatisfacerA(unCliente)) {
    		self.profesionalPorProvicia(unCliente.provincia()).cobrarSueldo()
    		clientes.add(unCliente)
    	}
    	else self.error("el cliente no puede ser atendido")
    }
}
