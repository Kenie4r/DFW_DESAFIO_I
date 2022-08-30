<%@page import="www.sv.cuponera.view.CreateMenu"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%if( request.getRequestURL().toString().equals("http://localhost:8080/LaCuponera/") ){%>


<%}else{
		
		//HttpSession sessionM = pageContext.getSession();  
		int rol = Integer.parseInt((String)session.getAttribute("idRol")); 
		
		 int[] casos = {
                    1, -1 , -1, -1, -1, -1, -1, -1, -1, -1 , -1
            }; 
		String url = "http://localhost:8080/LaCuponera/"; 
            String[] titulos = {
                    "Inicio" , "Mis ofertas", "Empresas","Usuarios de empresa", "Ofertas",
                    "Mis compras", "Validar ofertas", "Busqueda de Cupones", "Busqueda de Ofertas","Usuarios", 
                    "Rubros"

            };
            String[] Links = {
                    url + "/inicio.jsp",  url +"/ofertas/misOfertas.jsp",
                    url +"/empresas/index.jsp",   url +"/empresas/UsuariosEmpresa.jsp",
                    url +"/ofertas/index.jsp",   url +"/compras/misCompras.jsp",
                    url +"/ofertas/index.jsp",   url +"/cupones/cupones",  url + "/ofertas", 
                    url+ "/usuarios.do", url+"/rubros.do?op=listar"
            };
            switch (rol){
        	case 1: 
        		casos[2] = 1; 
        		casos[4] = 1; 
        		casos[9] = 1; 
        		casos[10] = 1; 
        	break ;
        	case 2: 
        		casos[1] = 1; 
        		casos[3] = 1; 
        		break;
        	case 3: 
        		casos[5] = 1; 
        		casos[8] = 1;
        		break; 
        }

            
          %>
	
<nav class="bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900">
  <div class="container flex flex-wrap justify-between items-center mx-auto">
  <a href="https://flowbite.com/" class="flex items-center">
      <img src="https://cdn-icons-png.flaticon.com/512/3706/3706131.png" class="mr-3 h-6 sm:h-9" alt="Flowbite Logo">
      <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">La Cuponera</span>
  </a>
  <input type='hidden' id='userRol' name='rolUser' value='<%=session.getAttribute("idRol")%>'>
    <input type='hidden' id='userID' name='user' value='<%=session.getAttribute("idUsuario")%>'>
    <input type='hidden' id='userToken' value='<%=session.getAttribute("passinit")%>'>
  <div class="flex items-center md:order-2">
      <button type="button" class="flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600" id="user-menu-button" aria-expanded="false" data-dropdown-toggle="user-dropdown" data-dropdown-placement="bottom">
        <span class="sr-only">Abrir menú</span>
        <img class="w-8 h-8 rounded-full" src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="user photo">
      </button>
      <!-- Dropdown menu -->
      <div class="z-50 my-4 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600" id="user-dropdown" data-popper-reference-hidden="" data-popper-escaped="" data-popper-placement="bottom" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(585px, 82px);">
        <div class="py-3 px-4">
          <span class="block text-sm text-gray-900 dark:text-white"><%=session.getAttribute("username") %></span>
          <span class="block text-sm font-medium text-gray-500 truncate dark:text-gray-400"><%=session.getAttribute("email") %></span>
        </div>
        <ul class="py-1" aria-labelledby="user-menu-button">
          <li>
            <a href="#" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white" id='cart_btn'>Mis carrito</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/inicio.jsp" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Mi perfil</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/ClienteRegistroController?op=logout" class="block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Salir</a>
          </li>
        </ul>
      </div>
      <button data-collapse-toggle="mobile-menu-2" type="button" class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="mobile-menu-2" aria-expanded="false">
        <span class="sr-only">Menu principal</span>
        <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
    </button>
  </div>
  <div class="hidden justify-between items-center w-full md:flex md:w-auto md:order-1" id="mobile-menu-2">
    <ul class="flex flex-col p-4 mt-4 bg-gray-50 rounded-lg border border-gray-100 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
     <%
     
     for(int index = 0; index<titulos.length; index++){
         if(casos[index]==1){
             
                String  menu =  	"<li>\r\n" + 
                 		"<a href=\""+Links[index]+"\" class=\"block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white\" aria-current=\"page\">"+titulos[index]+"</a>\r\n" + 
                 		"</li>\r\n"; 
            	out.println(menu); 
         }
     } 
     %>
    </ul>
  </div>
  </div>
</nav>
<form action='${pageContext.request.contextPath}/carrito' method='post' id='carrito_a'>
	<input type='hidden' name='ofertas'  id='arra-compras'value=''/>
</form>
<script>
	function llenarcammpos(){
		if(localStorage.getItem("carritoCupones")==null){
			document.getElementById("arra-compras").value = ''
		}else{
			let obj = JSON.parse( localStorage.getItem("carritoCupones"))
			let ant = new Array()
			for(const key in  obj){
				ant.push(obj[key])
			}
			document.getElementById("arra-compras").value = ant; 
		}
	}
	function irCarrito(){
		document.getElementById("carrito_a").submit();

	}
	
	document.getElementById("cart_btn").addEventListener("click", (e)=>{
		e.preventDefault(); 
		irCarrito();
	})
	llenarcammpos();

</script>
<%

if(session.getAttribute("passinit")!=null){
%>
		<script>
		
		
		Swal.fire({
				title: 'Código de verificación', 
				input: 'text', 
				icon: 'info', 
				inputLabel: 'Ingrese el código de verificación (enviado a tu correo)',
				inputValidator: (value)=>{
					if(value.length>5 || !value){
						return 'Ingrese el código enviado'
					}
				}, 
				closeOnConfirm: 'false',
				allowEscapeKey: false,
				allowOutsideClick: false,
				showDenyButton: true,
				denyButtonText: 'Cerrar sesión'
			}).then((result)=>{
				if(result.isConfirmed){
					if($("#swal2-input").val() == $("#userToken").val()){
						$.post("http://localhost:8080/LaCuponera/usuario", {
							"op": "passV",
							"codigo": $("#userID").val() 
						}, function(result){
							if(result=="Se ha confirmado el codigo"){
								Swal.fire({
									title: '¡Completado!',
									icon: 'success', 
									text: 'Se completo la verificación de cuenta, ¡Ya puedes usar tu cuenta de manera completa!', 
									confirmButtonText: 'Aceptar'
								})

							}else{
								Swal.fire({
									title: 'Error',
									text: 'No se ha podido comprobar la clave, vuelve a intentarlo luego', 
									allowEscapeKey: false,
									allowOutsideClick: false,
									icon: 'error'
								}).then((result)=>{
									window.location.reload(); 
								})
							}
						})
					}else{
						Swal.fire({
							title: 'Error',
							text: 'No se ha podido comprobar la clave, vuelve a intentarlo luego', 
							allowEscapeKey: false,
							allowOutsideClick: false,
							icon: 'error'
						}).then((result)=>{
							window.location.reload(); 
						})
					}
				}else{
					window.location.href = 'http://localhost:8080/LaCuponera/ClienteRegistroController?op=logout'
				}
			})
		</script>
<%
           }

	
	
	
	
	}%>