object electrodomestico {
	method esComestible() = false
}

object mueble {
	method esComestible() = false
}

object comida {
	method esComestible() = true
}

object heladera {
	const property categoria = electrodomestico
	const property precio = 20000
	
	method esDeCategoria(_categoria) = _categoria == categoria

	method esComestible() = categoria.esComestible()
}

object cama {
	const property categoria = mueble
	const property precio = 8000
	
	method esDeCategoria(_categoria) = _categoria == categoria
	
	method esComestible() = categoria.esComestible()
}

object tiraDeAsado {
	const property categoria = comida
	const property precio = 350
	
	method esDeCategoria(_categoria) = _categoria == categoria
	
	method esComestible() = categoria.esComestible()
}

object paqueteDeFideos {
	const property categoria = comida
	const property precio = 50
	
	method esDeCategoria(_categoria) = _categoria == categoria
	
	method esComestible() = categoria.esComestible()
}

object plancha {
	const property categoria = electrodomestico
	const property precio = 1200
	
	method esDeCategoria(_categoria) = _categoria == categoria
	
	method esComestible() = categoria.esComestible()
}