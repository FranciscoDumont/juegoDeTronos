import Animal.*
import Conspiracion.*
import Personaje.*
import Casa.*


class Personalidad{
	method accion(complotado,unObjetivo)
}

object sutil inherits Personalidad{
	var casas = #{casaLannister,casaStark,casaGuardiaDeLaNoche}
	
	method casaMasPobre(){
		return casas.min({casa => casa.patrimonio()})
	}
		
	override method accion(complotado,unObjetivo){
		unObjetivo.casarseCon( self.casaMasPobre().solteroMasPobre() )
		//si no se puede casar va a fallar en "casarseCon"
		//si no encuentra con quien casarse falla en el find de solteroPobre()	
	}
}

class Asesino inherits Personalidad{
	override method accion(complotado,unObjetivo){
		complotado.matar(unObjetivo)
	}
}

object asesinoPrecavido inherits Asesino{
	
	override method accion(complotado,unObjetivo){
		if( unObjetivo.estaSolo() ){
			super(complotado,unObjetivo)
		}
	}
}

object disipado inherits Personalidad{
	var porcentaje = 10
	override method accion(complotado,unObjetivo){
		unObjetivo.derrocharPlata(porcentaje)
	}
}

object miedoso inherits Personalidad{
	override method accion(complotado,unObjetivo){

	}
}