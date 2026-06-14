import armas.*

class Gladiador {
    var property vida = 100
    method fuerza()
    method destreza()
    method poderAtaque()
    method defensa() 
    method atacar(enemigo){
        enemigo.recibirDaño(self.poderAtaque() - enemigo.defensa())
    }
    method recibirDaño(daño) {vida = vida - daño}
    method pelearCon(enemigo) {
      self.atacar(enemigo)
      enemigo.atacar(self)
    }
}

class Mirmillones inherits Gladiador{
    var fuerza
    var arma
    var armadura
    override method destreza() = 15
    override method fuerza() = fuerza
    override method poderAtaque() = arma.valorAtaque() + self.fuerza()
    override method defensa() = armadura.puntos(self) + self.destreza()
}

class Dimachaerus inherits Gladiador{
    const property arma = []
    var destreza
    override method fuerza() = 10
    override method destreza() = destreza
    override method poderAtaque() = self.fuerza() + self.fuerzaTotalArmas()
    method fuerzaTotalArmas() = arma.sum{a => a.valorAtaque()}
    override method defensa() = destreza * 0.5
    override method atacar(enemigo){
        super(enemigo)
        destreza +=1
    }
}