class Gladiador{
    var vida = 100

    method defensa()
    method vida() = vida

    method atacarA(unGladiador){
        unGladiador.recibirAtaqueDe(self)
    }
    method recibirAtaqueDe(unGladiador){
        vida = 0.max(vida - unGladiador.poderDeAtaque() - self.defensa())
    }

    method pelearCon(unGladiador){ //Delegar al colseo
        self.atacarA(unGladiador)
        unGladiador.atacarA(self)
    }
    method curar(){
        vida = 100
    }
}

class Mirmillon inherits Gladiador{
    var arma
    var armadura
    var fuerza

    method poderDeAtaque() = fuerza + arma.dañoAtaque()
    method destreza() = 15
    method fuerza() = fuerza
    override method defensa() = armadura.proteccionPara(self) + self.destreza()

    method cambiarFuerza(unaCant){
        fuerza = unaCant
    }
    method cambiarArmadura(unaArmadura){
        armadura = unaArmadura
    }
    method cambiarArma(unArma){
        arma = unArma
    }

    method armarGrupoCon(unGladiador){
        return new Grupo(nombreGrupo="Mirmillolandia", miembros=#{self, unGladiador})
    }

}

class Dimachaerus inherits Gladiador{
    const armas = []
    var destreza

    method poderDeAtaque() = self.fuerza() + armas.sum({a => a.dañoAtaque()})
    method destreza()  = destreza
    method fuerza() = 10
    override method defensa() = destreza/2

    method agregarArma(unArma){
        armas.add(unArma)
    }
    method quitarArma(unArma){
        armas.remove(unArma)
    }
 
    override method atacarA(unGladiador){
        super(unGladiador)
        destreza += 1
    }

    method armarGrupoCon(unGladiador){
        return new Grupo(nombreGrupo="D-"+(self.poderDeAtaque()+unGladiador.poderDeAtaque()).toString(), miembros=#{self, unGladiador})
    }

}

class Grupo{
    const miembros = #{}
    var cantPeleas = 0
    const property nombreGrupo

    method agregarMiembro(unGladiador){
        miembros.add(unGladiador)
    }
    method quitarMiembro(unGladiador){
        miembros.remove(unGladiador)
    }

    method puedenCombatir() = miembros.filter({m => m.vida() > 0})
    method campoeon() = self.puedenCombatir().max({m => m.poderDeAtaque()})

    method combatirCon(unGrupo){
        3.times({i => self.campoeon().pelearCon(unGrupo.campoeon())
        cantPeleas += 1})
    }
}
