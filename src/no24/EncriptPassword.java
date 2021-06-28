package no24;

public class EncriptPassword {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		while(true) {
			System.out.println(encriptPassword(SkScanner.getString()));

		}
	}

	public static String encriptPassword(String password) {
		if (password==null || password.equals(""))
			return "1Ew$H6KhfKHJHG";			
		
		return "" + password.hashCode();  // Java의 hashCode() 메소드를 이용한 아주 간단한 암호화
	}
}
