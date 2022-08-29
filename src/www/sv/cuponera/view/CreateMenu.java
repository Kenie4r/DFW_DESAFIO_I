package www.sv.cuponera.view;
import java.util.ArrayList;
public class CreateMenu {

        public static  String Menu(int Active, int rol, String[] datos ){
            int[] casos = {
                    1, -1 , -1, -1, -1, -1, -1, -1, -1
            }; 
            switch (rol){
            	case 1: 
            		casos[2] = 1; 
            		casos[4] = 1; 
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

            String[] titulos = {
                    "Inicio" , "Mis ofertas", "Empresas","Usuarios de empresa", "Ofertas",
                    "Mis compras", "Validar ofertas", "Busqueda de Cupones", "Busqueda de Ofertas"

            };
            String[] Links = {
                    datos[2] + "/inicio.jsp",  datos[2] +"/ofertas/misOfertas.jsp",
                    datos[2] +"/empresas/index.jsp",  datos[2] +"/empresas/UsuariosEmpresa.jsp",
                    datos[2] +"/ofertas/index.jsp",  datos[2] +"/compras/misCompras.jsp",
                    datos[2] +"/ofertas/index.jsp",  datos[2] +"/cupones/cupones", datos[2] + "/ofertas"
            };
            String menu = "  <nav class=\"bg-white border-gray-200 px-2 sm:px-4 py-2.5 rounded dark:bg-gray-900\">\r\n" + 
            		"        <div class=\"container flex flex-wrap justify-between items-center mx-auto\">\r\n" + 
            		"            <a href=\"index.jsp\" class=\"flex items-center\">\r\n" + 
            		"                <img src=\"https://cdn-icons-png.flaticon.com/512/3706/3706131.png\" class=\"mr-3 h-6 sm:h-9\" alt=\"Flowbite Logo\">\r\n" + 
            		"                <span class=\"self-center text-xl font-semibold whitespace-nowrap dark:text-white\">La Cuponera</span>\r\n" + 
            		"            </a>\r\n" + 
            		"            <div class=\"flex items-center md:order-2\">\r\n" + 
            		"                <button type=\"button\" class=\"flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600\" id=\"user-menu-button\" aria-expanded=\"false\" data-dropdown-toggle=\"user-dropdown\" data-dropdown-placement=\"bottom\">\r\n" + 
            		"                    <span class=\"sr-only\">Open user menu</span>\r\n" + 
            		"                    <img class=\"w-8 h-8 rounded-full\" src=\"https://cdn-icons-png.flaticon.com/512/149/149071.png\" alt=\"user photo\">\r\n" + 
            		"                 </button>\r\n" + 
            		"        <!-- Dropdown menu -->\r\n" + 
            		"        <div class=\"z-50 my-4 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700 dark:divide-gray-600 block\" id=\"user-dropdown\" data-popper-reference-hidden=\"\" data-popper-escaped=\"\" data-popper-placement=\"bottom\" style=\"position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(585px, 82px);\">\r\n" + 
            		"          <div class=\"py-3 px-4\">\r\n" + 
            		"            <span class=\"block text-sm text-gray-900 dark:text-white\">\r\n" + 
            					datos[0]+
            		"            </span>\r\n" + 
            		"            <span class=\"block text-sm font-medium text-gray-500 truncate dark:text-gray-400\">"+datos[1]+"</span>\r\n" + 
            		"          </div>\r\n" + 
            		"          <ul class=\"py-1\" aria-labelledby=\"user-menu-button\">\r\n" + 
            		"            <li>\r\n" + 
            		"              <a href=\"#\" class=\"block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white\">Mi cuenta</a>\r\n" + 
            		"            </li>\r\n" + 
            		"            <li>\r\n" + 
            		"              <a href=\"#\" class=\"block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white\">Mis compras</a>\r\n" + 
            		"            </li>\r\n" + 
            		"        \r\n" + 
            		"            <li>\r\n" + 
            		"              <a href=\""+datos[2]+"/Carrito/index.jsp\" class=\"block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white\">Carrito</a>\r\n" + 
            		"            </li>\r\n" + 
            	    "<li>\r\n" + 
             		"              <a href=\""+datos[2]+"/cerrar.jsp\" class=\"block py-2 px-4 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white\">Salir</a>\r\n" + 
             		"            </li>\r\n" + 
            		"          </ul>\r\n" + 
            		"        </div>\r\n" + 
            		"        <button data-collapse-toggle=\"mobile-menu-2\" type=\"button\" class=\"inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600\" aria-controls=\"mobile-menu-2\" aria-expanded=\"false\">\r\n" + 
            		"          <span class=\"sr-only\">Abrir menu</span>\r\n" + 
            		"          <svg class=\"w-6 h-6\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\" xmlns=\"http://www.w3.org/2000/svg\"><path fill-rule=\"evenodd\" d=\"M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z\" clip-rule=\"evenodd\"></path></svg>\r\n" + 
            		"      </button>\r\n" + 
            		"    </div>\r\n" + 
            		"    <div class=\"hidden justify-between items-center w-full md:flex md:w-auto md:order-1\" id=\"mobile-menu-2\">\r\n" + 
            		"      <ul class=\"flex flex-col p-4 mt-4 bg-gray-50 rounded-lg border border-gray-100 md:flex-row md:space-x-8 md:mt-0 md:text-sm md:font-medium md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700\">\r\n"; 
	            for(int index = 0; index<titulos.length; index++){
	                if(casos[index]==1){
	                    if(Active == index){
	                        menu+= 	"<li>\r\n" + 
	                        		"<a href=\""+Links[index]+"\" class=\"block py-2 pr-4 pl-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 dark:text-white\" aria-current=\"page\">"+titulos[index]+"</a>\r\n" + 
	                        		"</li>\r\n"; 
	                    }else{
	                        menu+= "        <li>\r\n" + 
	                        		"          <a href=\""+Links[index]+"\" class=\"block py-2 pr-4 pl-3 text-gray-700 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 dark:text-gray-400 md:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700\">"+titulos[index]+"</a>\r\n" + 
	                        		"        </li>\r\n";
	                    }
	                }
	            } 
            	menu +="       \r\n" + 
            		"      </ul>\r\n" + 
            		"    </div>\r\n" + 
            		"    </div>\r\n" + 
            		"  </nav>";
          
            return menu;
        }
        
    }

