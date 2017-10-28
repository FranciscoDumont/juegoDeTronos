import Animal.*
import Conspiracion.*
import Personaje.*
import Personalidades.*

class Casa {
	var patrimonio
	var ciudadProveniente
	var miembros = #{}


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

//Estaria mal que las casas sean clases ? 

object casaLannister inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.noTienePareja()
	}
}


object casaStark inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.casa() == otroPersonaje.casa()
	}
}

object casaGuardiaDeLaNoche inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return false
	}
}

