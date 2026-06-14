//ARMAS
class Arma{
  method valorAtaque()
}

class ArmaFilo inherits Arma{
  const property longitud
  const property filo
  override method valorAtaque() = filo * longitud 
  
}

class ArmaContundente inherits Arma{
  const property peso
  override method valorAtaque() = peso 
}

//ARMADURA
object casco {
  method puntos(gladiador) = 10 
}

object escudo{
  method puntos(gladiador) = 5 + gladiador.destreza()*0.10 
}