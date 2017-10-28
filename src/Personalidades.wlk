import Animal.*
import Casa.*
import Conspiracion.*
import Personaje.*

class Sutil {
	method accion(complotado,unObjetivo){
		//no se
	}
}

class Asesino {
	method accion(complotado,unObjetivo){
		complotado.matar(unObjetivo)
	}
}

class AsesinoPrecavido {
	
	method accion(complotado,unObjetivo){
		if( unObjetivo.estaSolo() ){
			complotado.matar(unObjetivo)
		}
	}
}

class Disipado {
	var porcentaje = 10
	method accion(complotado,unObjetivo){
		unObjetivo.derrocharPlata(porcentaje)
	}
}

class Miedoso{
	method accion(complotado,unObjetivo){

	}
}

