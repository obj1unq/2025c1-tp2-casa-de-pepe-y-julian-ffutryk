object cuentaCorriente {
  var saldo = 0

  method saldo() = saldo

  // ÚNICAMENTE PARA LOS TEST
  method saldo(_saldo) {
    saldo = _saldo
  }

  method depositar(cantidad) {
    self.validarCantidadPositiva(cantidad)

    saldo += cantidad
  }

  method retirar(cantidad) {
    self.validarCantidadPositiva(cantidad)
    self.validarSaldoSuficiente(cantidad)
    
    saldo -= cantidad
  }

  method validarCantidadPositiva(cantidad) {
    if(cantidad <= 0) self.error("Se tiene que depositar un importe mayor a 0")
  }

  method validarSaldoSuficiente(cantidad) {
    if(saldo < cantidad) self.error("Saldo insuficiente para realizar la operación")
  }
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

    self.validarCantidadPositiva(cantidadNeta)
    self.validarCantidadDepositada(cantidadNeta)

    saldo += cantidadNeta
  }

  method retirar(cantidad) {
    self.validarCantidadPositiva(cantidad)

    saldo -= cantidad
  }

  method validarCantidadPositiva(cantidad) {
    if(cantidad <= 0) self.error("Se tiene que depositar un importe mayor a 0")
  }

  method validarCantidadDepositada(cantidad) {
    if(cantidad > 1000) self.error("Una cuenta con gastos no permite depositar mas de 1000 pesos de una vez")
  }
}