document.getElementById("recover").addEventListener("click", (e)=>{
	Swal.fire({
		icon: 'question',
		input: 'email', 
		inputLabel: 'Ingrese su correo electronico para recuperar tu cuenta', 
		showCancelButton: true, 
		confirmButtonText: 'Recuperar cuenta', 
		
	}).then((result)=>{
		let email = $("#swal2-input").val()
		if(result.isConfirmed){
			Swal.fire({
                title: 'Trabanjando en ello',
                text: 'Recuperando tu cuenta',
                allowOutsideClick: false,
                showConfirmButton: false, 
                willOpen: () => {
                    Swal.showLoading()
                },
            });

			$.post("http://localhost:8080/LaCuponera/usuario",
			{
				"op": "recoverPass", 
				"email" : email,
			}, 
			function(rs){
				
				if(rs=="actualizado"){
					Swal.fire({
						title: 'Enviado',
						text: 'Se ha enviado una contraseña provicional a tu correo', 
						icon: 'success'
					})
				}else{
					Swal.fire({
						title: 'Error',
						text: 'No se ha podido encontrar una cuenta con el correo ingresado, vuelve a intentarlo', 
						icon: 'error'
					})
				}
			}); 
		}
	})
})