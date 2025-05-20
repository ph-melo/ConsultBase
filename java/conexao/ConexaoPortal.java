package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;


public class ConexaoPortal {
    private Connection conexao;

    public ConexaoPortal()
    {
        try {
          DriverManager.registerDriver (new oracle.jdbc.OracleDriver()); 
        } catch ( Exception e ) {
          System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
        
        
    }
    
    public Connection conectar(){
        try{
            InitialContext ctx = new InitialContext();
            //System.out.println("EXAMPLE_DS");
        DataSource ds = (DataSource) ctx.lookup("EXAMPLE_DS");
        conexao = ds.getConnection();
       // 
        }catch ( Exception e ) {
          
        }
        if(conexao == null) {
        	try {
        		Properties props = new Properties();
        		FileInputStream file = new FileInputStream(
        				// ALTERAR CONFORME LOCALIZAÇÃO DO ARQUIVO ODBC.PROPERTIES NA MAQUINA LOCAL
        				
        				"C:\\caminho\\odbc.properties"
        				
        				);
        		props.load(file);
        		
        		String conexaoprop = props.getProperty("prop.conexao.portal");
  				conexao = DriverManager.getConnection(conexaoprop);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        	
        
        return conexao;
    }
}

