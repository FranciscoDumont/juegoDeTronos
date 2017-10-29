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

	method puedeCasarseCon(otroPersonaje){
		return casa.puedenCasarse(self,otroPersonaje) 
	}
	
	method casarseCon(otroPersonaje) {
		if (self.puedeCasarseCon(otroPersonaje) && otroPersonaje.puedeCasarseCon(self)) {
			conyuges.add(otroPersonaje)
		}else throw new Exception("No se pueden casar")
	}

	method patrimonio() {
		return casa.patrimonioPorMiembro()
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
	
	method esDeCasaRica(){
		return casa.esRica()
	}

	method conyugesDeCasaRica() {
		return conyuges.all({conyuge => conyuge.esDeCasaRica() })
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
