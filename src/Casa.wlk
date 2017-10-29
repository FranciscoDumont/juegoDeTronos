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
	
	method patrimonioPorMiembro(){
		return patrimonio / miembros.length()
	}
	
	method solterosVivos(){
		return miembros.filter({persona => persona.noTienePareja() && persona.estaVivo() })
	}
	
	method solteroMasPobre(){
		return self.solterosVivos().min({persona => persona.patrimonio()})
	}
	
	method miembros() {return miembros}
}


object casaLannister inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.noTienePareja()
	}
}


object casaStark inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return !miembros.contains(otroPersonaje)
	}							  
}

object casaGuardiaDeLaNoche inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return false
	}
}