import Casa.*
import Conspiracion.*
import Personaje.*
import Personalidades.*

class Animal{

	method patrimonio(){
		return 0
	}
}

class Lobo inherits Animal{
	var raza
	method esPeligroso(){
		return raza=="Huargo"
	}
}

class Dragon inherits Animal{
	method esPeligroso(){
		return true
	}
}