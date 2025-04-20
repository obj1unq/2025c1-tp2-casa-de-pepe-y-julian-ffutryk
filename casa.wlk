import cosas.* 
import cuentas.*

object casaDePepeYJulian {
  const property compras = []
  var cuenta = cuentaCorriente

  method cuenta(_cuenta) {
    cuenta = _cuenta
  }

  method comprar(cosa) {
    cuenta.retirar(cosa.precio())
    
    compras.add(cosa)
  }

  method cantidadDeCosasCompradas() = compras.size()

  method tieneAlgun(categoria) = compras.any{ cosa => cosa.esDeCategoria(categoria)}

  method vieneDeComprar(categoria) = !compras.isEmpty() && compras.last().esDeCategoria(categoria)

  method esDerrochona() = self.gastoTotal() >= 9000

  method compraMasCara() {
    self.validarQueHayanCompras()

    return compras.max{ cosa => cosa.precio() }
  }

  method comprados(categoria) = compras.filter{ cosa => cosa.esDeCategoria(categoria) }

  method malaEpoca() = compras.all{ cosa => cosa.esComestible() }

  method queFaltaComprar(lista) = lista.filter{cosa => !compras.contains(cosa) }

  method faltaComida() = compras.count{ cosa => cosa.esComestible() } < 2

  method categoriasCompradas() = compras.map{ cosa => cosa.categoria() }.asSet()

  method validarQueHayanCompras() {
    if(compras.isEmpty()) self.error("No hay compras realizadas")
  }

  method gastoTotal() = compras.sum{ cosa => cosa.precio() } 
}
