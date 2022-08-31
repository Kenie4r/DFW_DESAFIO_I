package www.sv.cuponera.utils;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import www.sv.cuponera.beans.OfertaBean;

public class Email {
	public static boolean resumenCompra(String receptor , List<OfertaBean> compras, String nombre) {
		try {
			String html = "<h2 style='text-align:center; gap: 10px; '><img style='width: 25px'src='https://cdn-icons-png.flaticon.com/512/3706/3706131.png'> LA CUPONERA </h2>"
					+ " <p>Se ha realizado una compra en el sitio web La Cuponera, los articulos comprados son los siguientes: </p><br><ul>";
			for(OfertaBean of : compras) {
				html+="<li>"+of.getNombreOferta() + "		x"+of.getLimite()+"</li>";  
			}
			Mensaje(receptor, "Compra realizada" , html); 
			
			return true; 
		}catch(Exception ex) {
			return false; 
		}
	}
	public static boolean tokenUsuario(String receptor, String codigo) {
		try {
			String html = "<h2 style='text-align:center; gap: 10px; '><img style='width: 25px'src='https://cdn-icons-png.flaticon.com/512/3706/3706131.png'> LA CUPONERA </h2>"
					+ " <p>Se ha creado un nuevo usuario con este correo, si no has sido tu hacer caso omiso del código de confirmación de este correo. </p>"
					+ "<h3>Código de confirmación</h3><br>"
					+ "<h4 style='padding=1.5em; background-color: gray; color: black; font-weight: bolder; text-aling: center; '>"
					+ codigo+"</h4>"; 
			Mensaje(receptor, "Nuevo usuario creado, código de confirmación" , html); 
			
			return true; 
		}catch(Exception ex) {
			return false; 
		}
	}
	public static boolean dependientePass(String receptor, String usuario, String codigo, String empresa) {
		try {
			String html = "<h2 style='text-align:center; gap: 10px; '><img style='width: 25px'src='https://cdn-icons-png.flaticon.com/512/3706/3706131.png'> LA CUPONERA </h2>"
					+ " <p>Se ha creado un nuevo usuario de parte de la empresa <b>"+empresa+"</b>, para poder acceder a tu cuenta de dependiente de sucursal usa los siguiente datos. (Si existe error al ingresar contactarse con la empresa representante) </p>"
					+ "<h3>Datos para inicio de sesión:  </h3><br>"
					+ "<h4 style='padding=1.5em; background-color: gray; color: black; font-weight: bolder; text-aling: center; '>"
					+ "Usuario: tu correo<br>Contraseña: "+codigo+"</h4>"; 
			Mensaje(receptor, "Nuevo usuario creado para dependientes" , html); 
			
			return true; 
		}catch(Exception ex) {
			return false; 
		}
		
	}
	public static boolean recuperarPass(String receptor, String codigo) {
		try {
			String html = "<h2 style='text-align:center; gap: 5px; '><img style='width: 50px'src='https://cdn-icons-png.flaticon.com/512/3706/3706131.png'> LA CUPONERA </h2> <p>Se ha cambiado la contraseña ha una de respaldo, si tu no has pedido la contraseña, por favor verificar todos tus datos. </p>"
					+ "<h3>Contraseña de recuperación</h3><br><h4 style='padding=1.5em; background-color: gray; color: black; font-weight: bolder; text-aling: center; '>"+codigo+"</h4>"; 
			Mensaje(receptor, "Contraseña de recuperación." , html); 
			
			return true; 
		}catch(Exception ex) {
			return false; 
		}
	}

	
	private static void Mensaje(String receptor, String tema, String cuerpo) {
		String enviado = "cuponera2022@gmail.com";
		String pass = "gnpguwjoonzvnxop"; 
		String host   = "smtp.gmail.com"; 
		
		Properties propiedades = System.getProperties(); 
		
		propiedades.put("mail.smtp.host", host); 
		propiedades.put("mail.smtp.port", "587"); 
		propiedades.put("mail.smtp.starttls.enable", "true"); 
		propiedades.put("mail.smtp.auth", "true" ); 
		
		 Session session = Session.getInstance(propiedades, new Authenticator() {
			 	@Override
	            protected PasswordAuthentication getPasswordAuthentication() {

	                return new PasswordAuthentication(enviado,pass);

	            }

	        });
		session.setDebug(true);
		
		try {
			MimeMessage mensaje = new MimeMessage(session);
			
			mensaje.setFrom(new InternetAddress(enviado));
			
			mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(receptor));
			
			
			mensaje.setSubject(tema);
			
			mensaje.setContent(cuerpo, "text/html");
			
			Transport.send(mensaje);
			
			System.out.print("se envio el correo de manera correcta");
		}catch(MessagingException mex) {
			mex.printStackTrace();
		}
		
	}
}
