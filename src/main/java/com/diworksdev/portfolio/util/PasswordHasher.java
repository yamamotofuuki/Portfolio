package com.diworksdev.portfolio.util;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordHasher {
	
	public static void main(String[] args) {
        // パスワードのハッシュ化
        String hashedPassword = PasswordHasher.hashPassword("test123");

        // 生成されたハッシュを表示
        System.out.println("Generated Hash: " + hashedPassword);

        // パスワードの照合
        boolean passwordMatch = PasswordHasher.checkPassword("test123", hashedPassword);
        System.out.println("Password Match: " + passwordMatch);
    }
	
	// パスワードをハッシュ化するメソッド
	public static String hashPassword(String plainTextPassword) {
		return BCrypt.hashpw(plainTextPassword,BCrypt.gensalt());
	}
	
	// パスワードの照合を行うメソッド
	public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
		return BCrypt.checkpw(plainTextPassword,hashedPassword);
	}
	
}
