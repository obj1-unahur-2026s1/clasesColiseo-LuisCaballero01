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
