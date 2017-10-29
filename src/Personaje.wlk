import Animal.*
import Casa.*
import Conspiracion.*
import Personalidades.*

class Personaje {
	var casa
	var conyuges = #{}
	var acompaniantes= #{}
	var estaVivo = true
	
	constructor (unaCasa,unosConyuges){
		casa=unaCasa
		conyuges=unosConyuges
	}

	method noTienePareja() {
		return conyuges.isEmpty()
	}

	method puedeCasarseCon(otroPersonaje){ // se pueden casar si ambos pueden
		return casa.puedenCasarse(self,otroPersonaje) && otroPersonaje.casa().puedenCasarse(otroPersonaje,self) //No rompas encapsulamiento con el otro personaje! Si él mismo te puede decir si se puede casar o no!
	}                                                                                                               //De todos modos, no tenés que preguntar si el otro se puede casar con vos, el método es puede Casarse, no pueden*

	method casarseCon(otroPersonaje) { //Acá preguntás si el otro puede casarse con vos, y hacés que se casen 
		if (self.puedeCasarseCon(otroPersonaje)) {
			conyuges.add(otroPersonaje)
		}else throw new Exception("No se pueden casar") //Bien con la excepción
	}

	method patrimonio() {
		return casa.patrimonio() / casa.cantidadDeMiembros() //esto es responsabilidad del personaje no ? //Esto es responsabilidad de la casa, estás rompiendo encapsulamiento.
	}

	method estaSolo() {
		return acompaniantes.isEmpty()
	}

	method aliados() {
		return acompaniantes + conyuges + casa.miembros()
	}

	method patrimonioAliados() {
		return self.aliados().sum({aliado => aliado.patrimonio()}) 
	}

	method conyugesDeCasaRica() {
		return conyuges.all({conyuge => conyuge.casa().esRica()}) //Estás rompiendo encapsulamiento, tendría que ser conyuge.esDeCasaRica()
	}

	method esAliadoDeAlguienPeligroso() {
		return self.aliados().any({aliado => aliado.esPeligroso()})
	}

	method esPeligroso() {
		return estaVivo && 
		( self.patrimonioAliados()>10000 || self.conyugesDeCasaRica() || self.esAliadoDeAlguienPeligroso() )
	}

	method morir() {
		estaVivo = false
	}

	method matar(unPersonaje) {
		unPersonaje.morir()
	}

	method derrocharPlata(porcentaje){
		casa.derrocharPlata(porcentaje)
	}

	method esAliadoDe(otroPersonaje){
		return self.aliados().contains(otroPersonaje)
	}

	//getters setters
	method casa() {return casa}
	method conyuges() {return conyuges}	
}
