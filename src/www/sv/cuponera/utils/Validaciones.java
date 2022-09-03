package www.sv.cuponera.utils;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validaciones {

    private static int entero;
    private static double decimal;
    private static String cadena;
    
    public static boolean esEntero(String cadena) {
        try {
            entero = Integer.parseInt(cadena.trim());
            return true;
        } catch (Exception a) {
            return false;
        }
    }

    public static boolean esEnteroPositivo(String cadena) {
        try {
            entero = Integer.parseInt(cadena.trim());
            if (entero <= 0) {
                return false;
            }
            return true;
        } catch (Exception a) {
            return false;
        }
    }
    
    public static boolean isEmpty(String mensaje) {
        return mensaje.trim().equals("");
    }

    public static boolean esDecimalPositivo(String cadena) {
        try {
            decimal = Double.parseDouble(cadena.trim());
            if (decimal <= 0) {
                return false;
            }
            return true;
        } catch (Exception a) {
            return false;
        }
    }
    
    public static boolean esTelefono(String cadena) {
        Pattern pat = Pattern.compile("[0-9]{4}-[0-9]{4}");
        Matcher mat = pat.matcher(cadena);
        return mat.matches();
    }
    
    public static boolean esCodigoEmpresa(String cadena) {
        Pattern pat = Pattern.compile("[a-zA-Z]{3}[0-9]{3}");
        Matcher mat = pat.matcher(cadena);
        return mat.matches();
    }
    public static boolean isCodigoTarjeta(String cadena) {
    	   Pattern pat = Pattern.compile("^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$");
           Matcher mat = pat.matcher(cadena);
           return mat.matches();
    }
    public static boolean isCodigoV(String cadena) {
 	   Pattern pat = Pattern.compile("[0-9]{3,4}");
        Matcher mat = pat.matcher(cadena);
        return mat.matches();
    }
    public static boolean isFechaVe(String cadena) {
  	   Pattern pat = Pattern.compile("^(0[1-9]|1[0-2])/?([0-9]{4}|[0-9]{2})$");
         Matcher mat = pat.matcher(cadena);
         return mat.matches();
     }
}
