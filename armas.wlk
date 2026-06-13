//ARMAS
class Arma{
  method valorAtaque()
}

class ArmaFilo inherits Arma{
  const property longitud
  const property filo
  override method valorAtaque() = filo * longitud 
  
}

class Contundente inherits Arma{
  const property peso
  override method valorAtaque() = peso 
}

//ARMADURA
object casco {
  method puntos(luchador) = 10 
}

object escudo{
  method puntos(luchador) = 5 + luchador.destreza()*0.10 
}