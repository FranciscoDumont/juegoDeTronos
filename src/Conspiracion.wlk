import Animal.*
import Casa.*
import Personaje.*
import Personalidades.*

class Conspiracion {
	var personajeObjetivo 
	var complotados = #{}

	constructor (unPersonajeObjetivo,unosComplotados){
		
		if (unPersonajeObjetivo.esPeligroso() ) {
			personajeObjetivo = unPersonajeObjetivo
		}else throw new Exception("El personaje no es peligroso") 

		complotados = unosComplotados
	}

	method traidores(){
		return complotados.filter({complotado => complotado.esAliadoDe(personajeObjetivo)})	
	}
	

	method cantidadDeTraidores(){
		return self.traidores().length()
	}

	method ejecutarConspiracion(){
		complotados.forEach({complotado => complotado.accion(complotado,personajeObjetivo)})
	}

	method objetivoCompletado(){
		return !personajeObjetivo.esPeligroso()
	}

}