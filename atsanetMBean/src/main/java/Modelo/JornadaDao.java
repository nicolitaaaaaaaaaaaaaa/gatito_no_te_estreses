package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase DAO para gestionar las operaciones CRUD de la tabla jornada
 * @author adminsena
 */
public class JornadaDao {
    
    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public JornadaDao() {
    }

    /**
     * Lista todas las jornadas de la base de datos
     * @return Lista de objetos Jornada
     */
    public List<Jornada> listarJornadas() {
        List<Jornada> lista = new ArrayList<>();
        String sql = "SELECT idjornada, dia_semana, hora_jornada FROM jornada ORDER BY FIELD(dia_semana, 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'), hora_jornada";
        
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            
            while (this.rs.next()) {
                Jornada jornada = new Jornada();
                jornada.setIdjornada(this.rs.getInt("idjornada"));
                jornada.setDia_semana(this.rs.getString("dia_semana"));
                jornada.setHora_jornada(this.rs.getTime("hora_jornada"));
                lista.add(jornada);
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.rs != null) this.rs.close();
                if (this.ps != null) this.ps.close();
                if (this.conn != null) this.conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return lista;
    }

    /**
     * Crea una nueva jornada
     * @param jornada Objeto Jornada con los datos a insertar
     * @return true si la inserción fue exitosa, false en caso contrario
     */
    public boolean crear(Jornada jornada) {
        boolean exito = false;
        String sql = "INSERT INTO jornada (dia_semana, hora_jornada) VALUES (?, ?)";
        
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setString(1, jornada.getDia_semana());
            this.ps.setTime(2, jornada.getHora_jornada());
            
            exito = this.ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.ps != null) this.ps.close();
                if (this.conn != null) this.conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return exito;
    }

    /**
     * Actualiza una jornada existente
     * @param jornada Objeto Jornada con los datos actualizados
     * @return true si la actualización fue exitosa, false en caso contrario
     */
    public boolean actualizar(Jornada jornada) {
        boolean exito = false;
        String sql = "UPDATE jornada SET dia_semana = ?, hora_jornada = ? WHERE idjornada = ?";
        
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setString(1, jornada.getDia_semana());
            this.ps.setTime(2, jornada.getHora_jornada());
            this.ps.setInt(3, jornada.getIdjornada());
            
            exito = this.ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.ps != null) this.ps.close();
                if (this.conn != null) this.conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return exito;
    }

    /**
     * Elimina una jornada de la base de datos
     * @param id ID de la jornada a eliminar
     * @return true si la eliminación fue exitosa, false en caso contrario
     */
    public boolean eliminar(int id) {
        boolean exito = false;
        String sql = "DELETE FROM jornada WHERE idjornada = ?";
        
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, id);
            
            exito = this.ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.ps != null) this.ps.close();
                if (this.conn != null) this.conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return exito;
    }

    /**
     * Verifica si ya existe una jornada con el mismo día y hora
     * @param diaSemana Día de la semana
     * @param hora Hora de la jornada
     * @param idExcluir ID a excluir en la búsqueda (para actualizaciones)
     * @return true si ya existe, false si no existe
     */
    public boolean existeJornada(String diaSemana, Time hora, int idExcluir) {
        boolean existe = false;
        String sql = "SELECT COUNT(*) FROM jornada WHERE dia_semana = ? AND hora_jornada = ? AND idjornada != ?";
        
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setString(1, diaSemana);
            this.ps.setTime(2, hora);
            this.ps.setInt(3, idExcluir);
            
            this.rs = this.ps.executeQuery();
            if (this.rs.next()) {
                existe = this.rs.getInt(1) > 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (this.rs != null) this.rs.close();
                if (this.ps != null) this.ps.close();
                if (this.conn != null) this.conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return existe;
    }
}
