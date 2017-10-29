import Animal.*
import Conspiracion.*
import Personaje.*
import Casa.*


//Todas estas clases o son la personalidad de un personaje o son un personaje en si, pero no son clases sueltas que no se relacionan con nada de ninguna forma.
//Qué buscabas hacer? Composición o herencia?
class Sutil {
	var casas = #{casaLannister,casaStark,casaGuardiaDeLaNoche}
	
	method casaMasPobre(){
		return casas.min({casa => casa.patrimonio()}) //Necesitás a la persona más pobre de entre todas las casas
	}
	
	method solteroPobre(){
		return self.casaMasPobre().find({persona => persona.noTienePareja() && persona.estaVivo() }) //La validación de que no tenga pareja y que esté vivo lo puede hacer el método de arriba la casa.
                                                                                                             //Que la casa te devuelva su soltero, vivo, más pobre y tomás al que tenga el patrimonio mínimo de entre todos ellos.
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

class AsesinoPrecavido { //Asesino y asesino precavido comparten lógica, cómo lo solucionás?
	
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

