
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
   Connection conn;
   String url = "jdbc:mysql://localhost:3306/atsanet";
   String user = "root";
   String pass = "";

   public Conexion() {
   }

   public Connection getConexion() throws ClassNotFoundException {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         this.conn = DriverManager.getConnection(this.url, this.user, this.pass);
      } catch (SQLException var2) {
         var2.printStackTrace();
      }

      return this.conn;
   }
}

