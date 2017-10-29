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
//Cada casa indibidual tiene que ser un objeto singleton, no una clase. Porque hay solo 1 casa lannister por ejemplo.

object casaLannister inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.noTienePareja()
	}
}


object casaStark inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return unPersonaje.casa() == otroPersonaje.casa() //unPersonaje siempre es de la casa Stark, lo que vos querés hacer es fijarte si otroPersonaje es de la casa Stark también
              							  // Y si te fijás, estás rompiendo encapsulamiento. Tenés dos formas de hacer esto. Preguntarle a otroPersonaje si su casa es Stark
	}							  // O fijándote si otroPersonaje es parte de los miembros de la casa Stark.
}

object casaGuardiaDeLaNoche inherits Casa {
	override method puedenCasarse(unPersonaje,otroPersonaje) {
		return false
	}
}

