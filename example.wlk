class ArmaFilo{
    const filo
    const longitud
    
    method dañoAtaque() = filo * longitud
}

class ArmaContundente{
    const peso

    method dañoAtaque() = peso
}

object casco{
    method proteccionPara(unGladiador) = 10
}
object escudo{
    method proteccionPara(unGladiador) = 5 + unGladiador.destreza()*0.1
}

class Gladiador{
    var vida = 100

    method defensa()

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
}

class Mirmillon inherits Gladiador{
    var arma
    var armadura
    var fuerza

    method poderDeAtaque() = fuerza + arma.dañoAtaque()
    method destreza() = 15
    method fuerza() = fuerza
    override method defensa() = armadura.proteccionPara(self) + self.destreza()

    method cambiarArmadura(unaArmadura){
        armadura = unaArmadura
    }
    method cambiarArma(unArma){
        arma = unArma
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
 
    override method atacarA(unGladiador){
        super(unGladiador)
        destreza += 1
    }
}