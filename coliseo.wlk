import gladiadores.*

//GRUPOS
class Grupo {
    const property nombre
    const miembros = []
    var cantPeleas = 0

    method agregarMiembro(gladiador) {
        if (!miembros.contains(gladiador))
            miembros.add(gladiador)
    }
    method quitarMiembro(gladiador) {
        if (miembros.contains(gladiador))
            miembros.remove(gladiador)
    }
    method miembrosDisponibles() = miembros.filter{m => m.puedeCombatir()}
    method campeon() = self.miembrosDisponibles().max{m => m.fuerza()}
    method campeonCombate(otroCampeon) {
        self.campeon().pelearCon(otroCampeon)
    }
    method combatirGrupo(otroGrupo){
        self.campeonCombate(otroGrupo.campeon())
        self.campeonCombate(otroGrupo.campeon())
        self.campeonCombate(otroGrupo.campeon())
        self.registrarPelea()
        otroGrupo.registrarPelea()
    }
    method registrarPelea() {
      cantPeleas += 1
    }
}

