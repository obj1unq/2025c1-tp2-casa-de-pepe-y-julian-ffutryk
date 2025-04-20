object cuentaCorriente {
  var saldo = 0

  method saldo() = saldo

  // ÚNICAMENTE PARA LOS TEST
  method saldo(_saldo) {
    saldo = _saldo
  }

  method depositar(cantidad) {
    saldo += cantidad
  }

  method retirar(cantidad) {
    self.validarSaldoSuficiente(cantidad)
    
    saldo -= cantidad
  }

  method validarSaldoSuficiente(cantidad) {
    if(self.puedeExtraer(cantidad)) self.error("Saldo insuficiente para realizar la operación")
  }

  method puedeExtraer(cantidad) = saldo < cantidad
}

object cuentaConGastos {
  var saldo = 0
  var costoPorOperacion = 0

  method saldo() = saldo

  // ÚNICAMENTE PARA LOS TEST
  method saldo(_saldo) {
    saldo = _saldo
  }

  method costoPorOperacion(_costoPorOperacion) {
    costoPorOperacion = _costoPorOperacion
  }

  method depositar(cantidad) {
    const cantidadNeta = cantidad - costoPorOperacion

    self.validarCantidadDepositada(cantidadNeta)

    saldo += cantidadNeta
  }

  method retirar(cantidad) {
    saldo -= cantidad
  }

  method validarCantidadDepositada(cantidad) {
    if(self.puedeDepositar(cantidad)) self.error("Una cuenta con gastos no permite depositar mas de 1000 pesos de una vez")
  }

  method puedeDepositar(cantidad) = cantidad > 1000
}