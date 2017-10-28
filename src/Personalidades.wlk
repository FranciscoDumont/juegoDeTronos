import Animal.*
import Conspiracion.*
import Personaje.*
import Casa.*

class Sutil {
	var casas = #{casaLannister,casaStark,casaGuardiaDeLaNoche}
	
	method casaMasPobre(){
		return casas.min({casa => casa.patrimonio()})
	}
	
	method solteroPobre(){
		return self.casaMasPobre().find({persona => persona.noTienePareja() && persona.estaVivo() })
	}
	
	method accion(complotado,unObjetivo){
		unObjetivo.casarseCon( self.solteroPobre())
		//si no se puede casar va a fallar en "casarseCon"
		//si no encuentra con quien casarse falla en el find de solteroPobre()	
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

