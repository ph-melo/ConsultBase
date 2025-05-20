import java.sql.*;

import javax.swing.JOptionPane;

public class ConnectionClass {
	public static Connection dbconnect()
	{
		try {
			
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@//1.2.3.4.5:1521/NAME","hostname","password");
			return conn;
			
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return null;
		}
	}

}