import armas.*
import coliseo.Grupo


class Gladiador {
    var property vida = 100
    method fuerza()
    method destreza()
    method poderAtaque()
    method defensa() 
    method atacar(enemigo){
        if (self.puedeCombatir())
            enemigo.recibirDaño(self.poderAtaque() - enemigo.defensa())
    }
    method recibirDaño(daño) {vida = (vida - daño).max(0)}
    method pelearCon(enemigo) {
      self.atacar(enemigo)
      enemigo.atacar(self)
    }
    method puedeCombatir() = vida > 0 
    method crearGrupoCon(otroGladiador)
}

class Mirmillones inherits Gladiador{
    var fuerza
    var arma
    var armadura
    override method destreza() = 15
    override method fuerza() = fuerza
    override method poderAtaque() = arma.valorAtaque() + self.fuerza()
    override method defensa() = armadura.puntos(self) + self.destreza()
    override method crearGrupoCon(otroGladiador) {
        return new Grupo(nombre = "mirmillolandia", miembros = [self, otroGladiador])
    }
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
    override method crearGrupoCon(otroGladiador) {
        const aux = self.poderAtaque() + otroGladiador.poderAtaque()
        return new Grupo(nombre = "D-" ++ aux, miembros = [self, otroGladiador])
    }
}