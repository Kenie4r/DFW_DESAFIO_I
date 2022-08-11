package www.sv.cuponera.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	public static void main(String[] params) {
		Mensaje("knthnolasco@gmail.com", "", ""); 
	}
	

	
	public static void Mensaje(String receptor, String tema, String cuerpo) {
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
			
			
			mensaje.setSubject("Prueba");
			
			mensaje.setText("Es solo una prueba de esta libreria");
			
			Transport.send(mensaje);
			
			System.out.print("se envio el correo de manera correcta");
		}catch(MessagingException mex) {
			mex.printStackTrace();
		}
		
	}
}
