//opciones para cargar ofertas 
//1-leer el local Storage 
//2-hacer funciones para actualizar carrito
//3-compras de carrito


	let hechas = 0, necesarias = 0; 




$(document).ready(function(){
	let cartDiv = document.getElementById("cart-div")
	let btnBuy = $("#buy"); 
	let divOfertasN = document.getElementById("cantidad_total");  
	let ofertasSelect = JSON.parse(localStorage.getItem("carritoCupones")); 
	let sizeOfertas =sizeOfObj(ofertasSelect); 
	//console.log(divOfertasN)
	divOfertasN.innerText = sizeOfertas
	document.getElementById("of-c").innerText = sizeOfertas; 
	if(sizeOfertas<=0){
		cartDiv.innerHTML = "<h1>No se han encontrado Ofertas, añade más ofertas para pode continuar</h1>"
		btnBuy.disabled = true;
		
	}else{
		
		//lectura de todas las ofertas
		/*for(let key in ofertasSelect ){
			$.post("http://localhost:8080/LaCuponera/ofertas", {
				"op": "obtenerCarro", 
				"codigo": ofertasSelect[key]
			}, function(res){
				cartDiv.innerHTML += res; 
			})
		}*/
		
	}
	llenarcammpos();

	totalOriginal();

})

document.getElementById("pay").addEventListener("click", (e)=>{
	
	

	let inputs = document.getElementsByClassName("totales"); 
	let inputsArray = Array.from(inputs); 
	if(inputsArray.length == 0){
		Swal.fire({
			icon : 'error',
			title: '¡Error!', 
			text: 'No existen ofertas seleccionadas, selecciona al menos una para poder continuar', 
		})
	}else{
		let card = document.getElementById("card").value; 
		if(card=="null"){
			
			Swal.fire({
				icon: 'error',
				title: 'Error', 
				text : 'No se puede continuar, por favor ingresa o selecciona un metodo de pago'
			})
		}else{
			let ofertasID = document.getElementsByClassName("ofertasId");
			ofertasID = Array.from(ofertasID); 
			let cantidades = document.getElementsByClassName("cantidades"); 
			cantidades = Array.from(cantidades); 
			Swal.fire({
				icon : 'question',
				text: '¿Quieres realizar la compra?',
				showCancelButton: true, 
				confirmButtonText: 'Realizar compra', 
				cancelButtonText: 'Cancelar compra'
			}).then( (result)=>{
				Swal.fire({
					icon: 'question', 
					html : '<label class="swal2-label">Ingrese el CVV de su tarjeta</label><br><input class="swal2-input" id="cv" type="text" placheholder="Ingrese el CVV aqui">', 
					
				}).then((rs)=>{
					if(rs.isConfirmed){
						$.post("/LaCuponera/MetodosPago", {
							op: "verificar",
							codigo: card, 
							cv: $("#cv").val()
						}, 
						function (postR){
							if(postR=="Confirmado"){
								payMethod(rs)
							}else{
								Swal.fire({
									title: 'Error', 
									icon: 'error', 
									text: 'El codigo de seguridad de la tarjeta no es correcto, vuelve a intentarlo más tarde'
								})
							}
						
						})
					}
				})
				
				
			})
		}
	}
	
	
})

document.addEventListener("click", (e)=>{
	let target = e.target;
	if(target.tagName == "IMG"){
		let idTag = target.id.split("_"); 
		let idName = "cantidad_"+idTag[1]; 
		let cantidad = document.getElementById(idName).value; 
		cantidad = Number.parseInt(cantidad)

		if(Number.isInteger(cantidad)){
			if(target.id.includes("minus")){
				cantidad--; 
				document.getElementById(idName).value = cantidad

				if(cantidad == 0){
					//eliminar
					eliminarOferta(idTag[1])
					llenarcammpos();
					irCarrito()
				}
			}else if(target.id.includes("plus")){
				cantidad++; 
				document.getElementById(idName).value = cantidad
			}
			let precio = $("#precio_"+idTag[1]).val()
			
			let total = cantidad * Number.parseFloat(precio); 
			total = parseFloat(total); 
				$("#total_"+idTag[1]).val(total)
				document.getElementById("totalSpan_"+idTag[1]).innerText = "$" +  total
				totalOriginal();

		}
		
	}
	if(target.tagName == "A"){
		let idTag = target.id.split("_"); 
		if(idTag.id.includes("eliminar")){
			eliminarOferta(idTag[1])
			llenarcammpos();
			irCarrito()
		}
	}
})





//hacer funcion de contar todas los totales 

function totalOriginal (){
	let inputs = document.getElementsByClassName("totales")
	let total = 0; 
	Array.from(inputs).forEach((input)=>{
		total+= Number.parseFloat(input.value)
	})
	document.getElementById("stotal").innerText = "$"+total; 
	document.getElementById("stotal-2").innerText = "$"+total; 

}



function eliminarOferta(codigo){
	let ofertasSelect = JSON.parse(localStorage.getItem("carritoCupones")); 

	for(const key in ofertasSelect ){
		if(ofertasSelect[key] == codigo){
			delete ofertasSelect[key]
		}
	}
	
	localStorage.setItem("carritoCupones", JSON.stringify(ofertasSelect))
}

function eliminarOfertaAll(){
	let ofertasSelect = JSON.parse(localStorage.getItem("carritoCupones")); 

	for(const key in ofertasSelect ){
			delete ofertasSelect[key]
		
	}
	
	localStorage.setItem("carritoCupones", JSON.stringify(ofertasSelect))
}





function sizeOfObj (obj) { 
	  let c=0; 
	  for(let key in obj){
		  c++; 
		  
	  }
	  return c; 
	}



function payMethod(result){
	let ofertasID = document.getElementsByClassName("ofertasId");
	ofertasID = Array.from(ofertasID); 
	let cantidades = document.getElementsByClassName("cantidades"); 
	cantidades = Array.from(cantidades); 
	Swal.fire({
		title: 'Trabanjando en ello',
		text: 'Estamos realizando la compra de manera segura ;)',
		allowOutsideClick: false,
		showConfirmButton: false, 
		willOpen: () => {
			Swal.showLoading()
		},
	});
	if(result.isConfirmed){
		let codigosOfertas = new Array()
		let cantidaSA = new Array(); 
		for(let oferta  in ofertasID){
			codigosOfertas.push(ofertasID[oferta].value); 
			cantidaSA.push(cantidades[oferta].value); 
		}
		
		
		$.post("/LaCuponera/carrito?op=transation", {
			"ofertas": codigosOfertas.join(","),
			"cantidades":  cantidaSA.join(","), 
			"user": $("#userID").val()
		}, function(rs){
			if(rs=="exito"){
				eliminarOfertaAll()
				Swal.fire({
					icon: 'success',
					text: 'Se han realizado todas las compras, ya puedes ver todos tus cupones en el apartado de mis compras', 
					showDenyButton: true,
					confirmButtonText: 'ir a mis compras', 
					denyButtonText: 'Seguir comprando'
				}).then((result)=>{
					if(result.isConfirmed){
						location.href = "/LaCuponera/Miscompras"; 
					}else{
						location.href = "/LaCuponera/ofertas"; 
					}
				})

			}else if(rs == "exito2"){
				eliminarOfertaAll()
				Swal.fire({
					icon: 'success',
					text: 'Se han realizado las compras, algunas ofertas ya no pueden ser compradas debido a que se acabaron sus existencias', 
					showDenyButton: true,
					confirmButtonText: 'ir a mis compras', 
					denyButtonText: 'Seguir comprando',
					allowEscapeKey: false,
					allowOutsideClick: false,
				}).then((result)=>{
					if(result.isConfirmed){
						location.href = "/LaCuponera/Miscompras"; 
					}else{
						location.href = "/LaCuponera/ofertas"; 
					}
				})
			}else if(rs == "fracaso"){
				Swal.fire({
					icon: 'error',
					text: 'No se ha podido realizar las compras, vuelve a intentrarlo más tarde', 
					showDenyButton: true,
					confirmButtonText: 'Volver a ofertas', 
					denyButtonText: 'Ir a mis compras', 
					allowEscapeKey: false,
					allowOutsideClick: false,
				}).then((result)=>{
					if(result.isConfirmed){
						location.href = "/LaCuponera/Miscompras"; 
					}else{
						location.href = "/LaCuponera/ofertas"; 
					}
				})
			}
		})
		
	}
	
}





