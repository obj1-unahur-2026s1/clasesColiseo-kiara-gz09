import gladiadores.*

//GRUPOS
class Grupo {
    const property nombre
    const property miembros = []
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
    method curar() {
    miembros.forEach { m => m.curar() }
    }
}

//COLISEO
object coliseo{
    const combatientes = []
    method ingresar(grupoOGladiador) {
      combatientes.add(grupoOGladiador)
    }
    method combatePorGrupos(grupo1, grupo2) {
        grupo1.combatirGrupo(grupo2)
    }
    method combate1vsGrupo(unGladiador, unGrupo) {
        const grupoSolo = new Grupo(nombre = "SoySolito", miembros = [unGladiador])
        unGrupo.combatirGrupo(grupoSolo)
    }
    method curarGladiadores() {
      combatientes.forEach{c => c.curar()}
    }
}
