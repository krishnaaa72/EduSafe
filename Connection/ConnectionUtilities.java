package MASTER.Utilities;
import java.sql.*;
public class ConnectionUtilities {
	private Connection cn=null;
	public Connection getConn()
	{
		try
		{
		Class.forName("com.mysql.cj.jdbc.Driver");//REGISTER AND LOAD THE JDBC DRIVER
		//ESTABLISH THE CONNECTION
		 cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/disastermanagementapp","root","Rayet@797");
		
		}
		
		catch(ClassNotFoundException ce)
		{
			ce.printStackTrace();
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return cn;


	}

}
