import profesionales.*

class Persona {
	
	var property provincia
	
	method puedeSerAtendidoPor(unaEmpresa) =  unaEmpresa.universidadesFormadoras().contains(provincia)
}

class Institucion {
	var property universidadesReconocidas = #{}
	
	method puedeSerAtendidoPor(unaEmpresa) = ! universidadesReconocidas.intersection(unaEmpresa.universidadesFormadoras()).isEmpty()
}