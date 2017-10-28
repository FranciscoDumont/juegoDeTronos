import Animal.*
import Conspiracion.*
import Personaje.*
import Personalidades.*

class Casa {
	var patrimonio
	var ciudadProveniente
	var miembros = #{}

	constructor (unPatrimonio,unaCiudadProveniente,unosMiembros){
		patrimonio = unPatrimonio
		ciudadProveniente = unaCiudadProveniente
		miembros = unosMiembros
	}

	method puedenCasarse(unPersonaje,otroPersonaje)

	method esRica() {
		return patrimonio > 1000
	}

	method cantidadDeMiembros() {
		return miembros.length()
	}

	method derrocharPlata(porcentaje){
		patrimonio -= patrimonio*porcentaje/100
	}
	
	method miembros() {return miembros}
}

class CasaLannister inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.noTienePareja()
	}
}


class CasaStark inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.casa() == otroPersonaje.casa()
	}
}

class CasaGuardiaDeLaNoche inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return false
	}
}