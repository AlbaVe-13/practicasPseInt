//Para arreglar:
//El precio ingresado y las cantidades no pueden ser cero o negativo- HECHO
//La posicion no puede ser negativo, cero o mayor a tamanio - 
//Hacer una funcion para repetir una funcion
//Agregar mensajes de confirmacion- para la posicion y cada vez que se cambia una cosa
//Si entra mercaderia de un producto inexistente avisar y preguntar el precio y como se llama el producto 
//Si cambias un precio de un producto que todavia no cargaste que haga algo
//Indentar
//Declarar e inicializar variables globales
//parametros de las variables
//agregar precio (GERI)
//agregar confirmacion de si es el producto correcto

//opcional:
//El nombre no puede ser mayor o menor a x caracteres-- longitud(nombre)
//Agregar opciones de venta como consultar precio
//listar los 3 productos mas caros o mas baratos
//Agregar categorias de productos y listar los productos por categoria

Funcion volverAlMenuPrincipal()
	Escribir "Oprima cualquier tecla para volver al menu principal"
	Esperar Tecla
	Borrar Pantalla
FinFuncion

Funcion agregarProducto(nombres, precios, cantidades, tamanio)
	Para contador = 1 hasta tamanio Hacer
		Si precios[contador] = 0 entonces
			Escribir "Escriba el nombre del nuevo producto "
			Leer nombreNuevo
			Si longitud(nombreNuevo) < 2 Entonces
				Escribir "El nombre no puede tener menos de 2 caracteres"
			SiNo
				nombres[contador] = nombreNuevo
				Escribir "Escriba el precio "
				Leer nuevoPrecio
				Si nuevoPrecio < 1 Entonces
					Escribir "El precio no puede ser negativo o cero"
					nombres[contador] = " "
				Sino
					precios[contador] = nuevoPrecio
					Escribir "Escriba la cantidad "
					Leer nuevaCantidad
					Si nuevaCantidad < 1 Entonces
						Escribir "La cantidad no puede ser negativa o cero"
						nombres[contador] = " "
						precios[contador] = 0
					Sino
						cantidades[contador] = nuevaCantidad
					FinSi
				FinSi
			FinSi
			
			volverArriba = 1
			Mientras volverArriba = 1 hacer
				Escribir "Quiere agregar otro producto? 1) Si / 2) No"
				Leer opcionElegida
				Segun opcionElegida hacer
					1: 
						Si contador = tamanio Entonces
							Escribir "No hay mas espacio para agregar productos"
						FinSi
						volverArriba = 0
					2:
						contador = tamanio
						volverArriba = 0
					De Otro Modo:
						escribir "Opcion no valida"
				FinSegun
			FinMientras
		SiNo
			Si contador = tamanio
				Escribir "No hay mas espacio para agregar productos"
			FinSi
		FinSi
	FinPara
FinFuncion

//si es el mismo producto sumarlo ??

Funcion  mostrarInventario(contador, tamanio, nombres, precios, cantidades) 
	Escribir "   +----------+----------+----------+----------+  "
	Escribir "   |  Codigo  | Nombres  | Precios  |cantidades|"
	para contador= 1 hasta tamanio Hacer
		Si precios[contador] <> 0 Entonces
			Escribir "   +----------+----------+----------+----------+  "
			Escribir "   | ", contador,   "     " "   | ", nombres[contador], "  |   $", precios[contador], "    |    ", cantidades[contador], "  | "
			// me falta que quiero agregar que cada producto tenga su còdigo, tengo que agregar otra variable.
			//agregar en las variables el .length ej 25 caracteres sino espacio para completar y centrar
		FinSi		
	FinPara
	
FinFuncion


Funcion venderProducto(cantidades, posicion, nombres, precios, tamanio)
	volverArriba = 1
	Repetir
		Escribir "Que numero de producto vendio?"
		Leer posicion
		Si posicion < 1 o posicion > tamanio Entonces
			Escribir "El numero de producto ingresado es invalido"
		Sino
			Escribir "El producto a modificar es ", nombres[posicion], " y tiene ", cantidades[posicion], " unidades disponibles"
			Escribir "Cuantas unidades vendio?- Tenga en cuenta que si se venden todas las unidades se elimina el producto"
			Leer unidadesVendidas
			Si unidadesVendidas < 1 Entonces
				Escribir "Las unidades vendidas no pueden ser negativas o cero"
			SiNo
				Si unidadesVendidas > cantidades[posicion] Entonces
					Escribir "No tiene unidades suficientes, tiene ", cantidades[posicion], " unidades"
				Sino
					cantidades[posicion] = cantidades[posicion] - unidadesVendidas
					//Elimina el producto porque no hay mas unidades a la venta
					Si cantidades[posicion] = 0 Entonces
						nombres[posicion] = " "
						precios[posicion] = 0
					FinSi
				FinSi
			FinSi
		FinSi
		
		//Cambia de lugar los items para llenar los espacios vacios
		//Para contador = posicion hasta tamanio - 1 Hacer
		//Si precios[contador + 1] <> 0  y precios[contador] = 0 entonces  //ACA HAY UN ERROR
		//cantidades[contador] = cantidades[contador + 1]
		//precios[contador] = precios[contador+1]
		//nombres[contador] = nombres[contador + 1]
		
		//cantidades[contador + 1] = 0
		//precios[contador + 1] = 0
		//nombres[contador + 1] = " "
		
		//FinSi
		//FinPara
		
		
		Escribir "Volver a ejecutar? 1)Si/ 2)No"
		Leer intento
		Segun intento hacer
			1: 
				
				
			2:
				volverArriba = 0
				
			De Otro Modo:
				Escribir "Opcion no valida"
				
		FinSegun
	Hasta que volverArriba = 0
FinFuncion

Funcion ingresarMercaderia(cantidades, nombres, posicion, tamanio)
			Escribir "¿Ingreso un producto nuevo? 1)Sí / 2)No"
			Leer opcionElegida
			
			
			
			Si posicion < 1 o posicion > tamanio Entonces
				Escribir "El numero de producto ingresado es invalido"
			SiNo
				Escribir "El producto a modificar es ", nombres[posicion], " y tiene ", cantidades[posicion], " unidades"
				Escribir "Cuantas unidades entraron?"
				Leer unidadesIngresadas
				Si unidadesIngresadas < 1 Entonces
					Escribir "La mercaderia ingresada no puede ser 0 o menor a 0"
				SiNo
					cantidades[posicion] = cantidades[posicion] + unidadesIngresadas
					Escribir "Ahora el producto ", nombres[posicion], " tiene ", cantidades[posicion], " unidades"
				FinSi
			FinSi
FinFuncion

Funcion eliminarProducto(cantidades, precios, nombres, contador, tamanio, posicion)
	Escribir  "Que numero de producto desea eliminar?"
	Leer posicion
	Si posicion < 1 o posicion > tamanio Entonces
		Escribir "El numero de producto ingresado es invalido"
	SiNo
		Escribir "El producto ", nombres[posicion], " se elimino"
		cantidades[posicion] = 0
		precios[posicion] = 0
		nombres[posicion] = " "
		
		//Cambia de lugar los items para llenar los espacios vacios
		Para contador = posicion hasta tamanio - 1 Hacer
			Si  precios[contador + 1] <> 0 entonces
				cantidades[contador] = cantidades[contador + 1]
				precios[contador] = precios[contador+1]
				nombres[contador] = nombres[contador + 1]
				
				cantidades[contador + 1] = 0
				precios[contador + 1] = 0
				nombres[contador + 1] = " "
			FinSi
		FinPara
	FinSi
FinFuncion


funcion cambiarPrecio(precios, nombres, posicion, tamanio)
	volverArriba = 1
	Repetir
		Escribir "A que producto desea modificarle el precio? Escriba el numero"
		Leer posicion
		Si posicion < 1 o posicion > tamanio Entonces
			Escribir "El numero de producto ingresado es invalido"
		SiNo
			Escribir "El producto a modificar es ", nombres[posicion], " y tiene un precio de ", precios[posicion]
			Escribir "Escriba el nuevo precio"
			Leer nuevoPrecio
			precios[posicion] = nuevoPrecio
			Escribir "Ahora el producto numero ", posicion, "  -- ", nombres[posicion], " tiene un precio de ", precios[posicion]
		FinSi
		Escribir "Desea modificar otro precio? 1)Si/ 2) No"
		Leer opcionElegida
		Segun opcionElegida hacer
			1: 
				
			2: 
				volverArriba = 0
			De Otro Modo:
				Escribir "Opcion invalida"
		FinSegun
	Hasta que volverArriba= 0
FinFuncion




Algoritmo inventarioTienda
	
	Definir tamanio Como Entero
	tamanio = 5 // Cuantos items va a tener nuestra tienda?
	Dimension nombres[tamanio]
	Dimension cantidades[tamanio] 
	Dimension precios[tamanio]
	opciones = 1
	
	definir cantidades Como Entero
	definir precios Como Real
	definir nombres Como Caracter
	
	Mientras opciones <> 0 hacer  
		escribir "Bienvenido al Menu, ¿Qué desea hacer?: "
		escribir "1) Quiero ver el Inventario" //nik
		escribir "2) Quiero agregar un nuevo producto" //geri
		escribir "3) Quiero eliminar un producto" //ari
		escribir "4) Vendi un producto" //aldi
		escribir "5) Me entro mercaderia" //alba
		escribir "6) Quiero cambiar un precio" //laura
		escribir "0) Salir"
		leer opciones
		Segun opciones Hacer
			1:
				mostrarInventario(contador, tamanio, nombres, precios, cantidades) 
				volverAlMenuPrincipal()
			2:
				agregarProducto(nombres, precios, cantidades, tamanio)
				volverAlMenuPrincipal()
			3:
				eliminarProducto(cantidades, precios, nombres, contador, tamanio, posicion)
				volverAlMenuPrincipal()
			4: 
				venderProducto(cantidades, posicion, nombres, precios, tamanio)
				volverAlMenuPrincipal()
			5:   
				ingresarMercaderia(cantidades, nombres, posicion, tamanio)
				volverAlMenuPrincipal()
			6: 
				cambiarPrecio(precios, nombres, posicion, tamanio)
				volverAlMenuPrincipal()
			0:
				
				
				
			De Otro Modo:
				escribir "Opcion invalida"
				volverAlMenuPrincipal()
				
		Fin Segun
	FinMientras
	
	
FinAlgoritmo