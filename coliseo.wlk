import gladiadores.*
import armas_armaduras.*

object coliseo{
    method organizarCombate(unGrupo, otroGrupo){
        unGrupo.combatirCon(otroGrupo)
    }
    method organizarCombateDesbalanceado(unGrupo, unGladiador){
        unGrupo.miembros().forEach({g => g.pelearCon(unGladiador)})
    }
    method curarGladiador(unGladiador){
        unGladiador.curar()
    }
    method curarGrupo(unGrupo){
        unGrupo.miembros().forEach({g => g.curar()})
    }
}