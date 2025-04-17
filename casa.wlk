import cosas.* 
import cuentas.*

object casaDePepeYJulian {
  const property compras = []
  var property cuenta = cuentaCorriente

  method comprar(cosa) {
    cuenta.retirar(cosa.precio())
    
    compras.add(cosa)
  }

  method cantidadDeCosasCompradas() = compras.size()

  method tieneAlgun(categoria) = compras.any{ cosa => cosa.categoria() == categoria }

  method vieneDeComprar(categoria) {
    self.validarQueHayanCompras()

    return compras.last().categoria() == categoria
  }

  method esDerrochona() = compras.sum{ cosa => cosa.precio() } >= 9000

  method compraMasCara() {
    self.validarQueHayanCompras()

    return compras.max{ cosa => cosa.precio() }
  }

  method comprados(categoria) = compras.filter{ cosa => cosa.categoria() == categoria }

  method malaEpoca() = compras.all{ cosa => cosa.categoria() == comida }

  method queFaltaComprar(lista) = lista.filter{cosa => !compras.contains(cosa) }

  method faltaComida() = compras.count{ cosa => cosa.categoria() == comida } < 2

  method categoriasCompradas() = compras.map{ cosa => cosa.categoria() }.asSet()

  method validarQueHayanCompras() {
    if(compras.isEmpty()) self.error("No hay compras realizadas")
  }
}
