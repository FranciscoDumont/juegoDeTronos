import Casa.*
import Conspiracion.*
import Personaje.*
import Personalidades.*

class Animal{

	method patrimonio(){
		return 0
	} // defino este metodo para que se use polimorficamente en personaje.patrimonioAliados()
}

class Lobo inherits Animal{
	method esPeligroso(){
		return false
	}
}
class LoboHuargo inherits Lobo{
	override method esPeligroso(){
		return true
	}
}

class Dragon inherits Animal{
	method esPeligroso(){
		return true
	}
}

// Estoy repitiendo logica cuando creo estos 3 esPeligroso()s ?