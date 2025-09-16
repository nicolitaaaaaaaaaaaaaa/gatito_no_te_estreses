/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Config.Conexion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonalTDao {

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    public PersonalTDao() {

    }

    public Personal_t Validar(Integer id_persona, String contrasena) throws ClassNotFoundException {
        Personal_t pt = new Personal_t();
        
        String sql = "SELECT "
        + "p.id, p.id_persona, p.tipo_id, p.nom1_persona, p.nom2_persona, p.ape1_persona, p.ape2_persona, "
        + "p.fecha_nacimiento, p.edad_persona, p.direc_persona, p.tel_persona, p.email_persona, p.fk_genero, "
        + "p.fk_eps, p.fk_rh, pt.fk_persona, pt.contrasena, pt.fk_tipo_personal, pt.persona_activa, "
        + "tp.nom_tipo_per "
        + "FROM persona p "
        + "INNER JOIN personal_t pt ON p.id = pt.fk_persona "
        + "INNER JOIN tipo_personal tp ON pt.fk_tipo_personal = tp.idtipopersonal "
        + "WHERE p.id_persona = ? AND pt.contrasena = ?";
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, id_persona);
            this.ps.setString(2, contrasena);
            this.rs = this.ps.executeQuery();

            if (this.rs.next()) {
                // atributos de Persona (heredados)
                pt.setId(this.rs.getInt("id"));
                pt.setId_persona(this.rs.getInt("id_persona"));
                pt.setTipo_Id(this.rs.getString("tipo_id"));
                pt.setNom1_persona(this.rs.getString("nom1_persona"));
                pt.setNom2_persona(this.rs.getString("nom2_persona"));
                pt.setApe1_persona(this.rs.getString("ape1_persona"));
                pt.setApe2_persona(this.rs.getString("ape2_persona"));
                pt.setFecha_nacimiento(this.rs.getDate("fecha_nacimiento"));
                pt.setEdad_persona(this.rs.getInt("edad_persona"));
                pt.setDirec_persona(this.rs.getString("direc_persona"));
                pt.setTel_persona(this.rs.getLong("tel_persona"));
                pt.setEmail_persona(this.rs.getString("email_persona"));
                pt.setFk_genero(this.rs.getInt("fk_genero"));
                pt.setFk_eps(this.rs.getInt("fk_eps"));
                pt.setFk_rh(this.rs.getInt("fk_rh"));
                // atributos de Personal_t
                pt.setFk_persona(this.rs.getInt("fk_persona"));
                pt.setContrasena(this.rs.getString("contrasena"));
                pt.setFk_tipo_personal(this.rs.getInt("fk_tipo_personal"));
                pt.setPersona_activa(this.rs.getBoolean("persona_activa"));
                
            }
        } catch (Exception var6) {
            var6.printStackTrace();
        }
        return pt;
        
    }

    /**
     * Inserta un postulante entrenador usando el procedimiento almacenado pa_addpostulanteentrenador
     * Recibe todos los datos personales y la contraseña en texto plano
     * @return true si la inserción fue exitosa, false en caso contrario
     */
    public boolean addpostulante(String tipo_id, String id_persona, String nom1_persona, String nom2_persona,
            String ape1_persona, String ape2_persona, String fecha_nacimiento, String direc_persona, String tel_persona,
            String email_persona, String fk_genero, String fk_eps, String fk_rh, String contrasena) {
        boolean exito = false;
        try {
            String hash = util.HashUtil.hashPassword(contrasena);
            this.conn = this.cn.getConexion();
            CallableStatement cs = this.conn.prepareCall("CALL pa_addpostulanteentrenador(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            cs.setString(1, id_persona); 
            cs.setString(2, tipo_id);    
            cs.setString(3, nom1_persona);
            cs.setString(4, nom2_persona);
            cs.setString(5, ape1_persona);
            cs.setString(6, ape2_persona);
            cs.setString(7, fecha_nacimiento);
            cs.setString(8, direc_persona);
            cs.setString(9, tel_persona);
            cs.setString(10, email_persona);
            cs.setString(11, fk_genero);
            cs.setString(12, fk_eps);
            cs.setString(13, fk_rh);
            cs.setString(14, hash);
            exito = cs.executeUpdate() > 0;
            cs.close();
            this.conn.close();
        } catch (Exception e) {
            System.err.println("Error en addpostulante: " + e.getMessage());
            e.printStackTrace();
        }
        return exito;
    }

    /**
     * Lista los postulantes a entrenador (personal_t con postulante=1), excluyendo la contraseña.
     * @return Lista de objetos Personal_t con los datos del postulante (sin contraseña)
     */
    public List<Personal_t> listarPostulantes() {
        List<Personal_t> lista = new ArrayList<>();
        String sql = "SELECT p.id, p.id_persona, p.tipo_id, p.nom1_persona, p.nom2_persona, p.ape1_persona, p.ape2_persona, "
                + "p.fecha_nacimiento, p.edad_persona, p.direc_persona, p.tel_persona, p.email_persona, p.fk_genero, "
                + "p.fk_eps, p.fk_rh, pt.fk_persona, pt.fk_tipo_personal, pt.persona_activa, pt.postulante "
                + "FROM persona p "
                + "INNER JOIN personal_t pt ON p.id = pt.fk_persona "
                + "WHERE pt.postulante = 1";
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                Personal_t pt = new Personal_t();
                pt.setId(this.rs.getInt("id"));
                pt.setId_persona(this.rs.getInt("id_persona"));
                pt.setTipo_Id(this.rs.getString("tipo_id"));
                pt.setNom1_persona(this.rs.getString("nom1_persona"));
                pt.setNom2_persona(this.rs.getString("nom2_persona"));
                pt.setApe1_persona(this.rs.getString("ape1_persona"));
                pt.setApe2_persona(this.rs.getString("ape2_persona"));
                pt.setFecha_nacimiento(this.rs.getDate("fecha_nacimiento"));
                pt.setEdad_persona(this.rs.getInt("edad_persona"));
                pt.setDirec_persona(this.rs.getString("direc_persona"));
                pt.setTel_persona(this.rs.getLong("tel_persona"));
                pt.setEmail_persona(this.rs.getString("email_persona"));
                pt.setFk_genero(this.rs.getInt("fk_genero"));
                pt.setFk_eps(this.rs.getInt("fk_eps"));
                pt.setFk_rh(this.rs.getInt("fk_rh"));
                pt.setFk_persona(this.rs.getInt("fk_persona"));
                // No se incluye la contraseña
                pt.setFk_tipo_personal(this.rs.getInt("fk_tipo_personal"));
                pt.setPersona_activa(this.rs.getBoolean("persona_activa"));
                // Puedes agregar el campo postulante si lo necesitas en el modelo
                lista.add(pt);
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
     * Acepta un postulante a entrenador, cambiando su estado de postulante a entrenador activo
     * Ejecuta el procedimiento almacenado pa_aceptarpostulante
     * @param fk_persona Identificador de la persona en la tabla personal_t
     * @return true si la operación fue exitosa, false en caso contrario
     */
    public boolean aceptarPostulante(int fk_persona) {
        boolean exito = false;
        try {
            this.conn = this.cn.getConexion();
            CallableStatement cs = this.conn.prepareCall("CALL pa_aceptarpostulante(?)");
            cs.setInt(1, fk_persona);
            exito = cs.executeUpdate() > 0;
            cs.close();
            this.conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exito;
    }
    
    /**
     * Rechaza un postulante a entrenador, cambiando su estado de postulante a NULL
     * @param fk_persona Identificador de la persona en la tabla personal_t
     * @return true si la operación fue exitosa, false en caso contrario
     */
    public boolean rechazarPostulante(int fk_persona) {
        boolean exito = false;
        try {
            this.conn = this.cn.getConexion();
            String sql = "UPDATE personal_t SET postulante = NULL WHERE fk_persona = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, fk_persona);
            exito = ps.executeUpdate() > 0;
            ps.close();
            this.conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exito;
    }
    
    /**
     * Lista todos los entrenadores activos (personal_t con persona_activa=1 y postulante=0)
     * @return Lista de objetos Personal_t con los datos de los entrenadores que no son postulantes
     */
    public List<Personal_t> listarEntrenadores() {
        List<Personal_t> lista = new ArrayList<>();
        String sql = "SELECT p.id, p.id_persona, p.tipo_id, p.nom1_persona, p.nom2_persona, p.ape1_persona, p.ape2_persona, "
                + "p.fecha_nacimiento, p.edad_persona, p.direc_persona, p.tel_persona, p.email_persona, p.fk_genero, "
                + "p.fk_eps, p.fk_rh, pt.fk_persona, pt.fk_tipo_personal, pt.persona_activa "
                + "FROM persona p "
                + "INNER JOIN personal_t pt ON p.id = pt.fk_persona "
                + "WHERE pt.postulante = 0 "
                + "ORDER BY pt.persona_activa DESC, p.nom1_persona ASC";
        try {
            this.conn = this.cn.getConexion();
            this.ps = this.conn.prepareStatement(sql);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                Personal_t pt = new Personal_t();
                pt.setId(this.rs.getInt("id"));
                pt.setId_persona(this.rs.getInt("id_persona"));
                pt.setTipo_Id(this.rs.getString("tipo_id"));
                pt.setNom1_persona(this.rs.getString("nom1_persona"));
                pt.setNom2_persona(this.rs.getString("nom2_persona"));
                pt.setApe1_persona(this.rs.getString("ape1_persona"));
                pt.setApe2_persona(this.rs.getString("ape2_persona"));
                pt.setFecha_nacimiento(this.rs.getDate("fecha_nacimiento"));
                pt.setEdad_persona(this.rs.getInt("edad_persona"));
                pt.setDirec_persona(this.rs.getString("direc_persona"));
                pt.setTel_persona(this.rs.getLong("tel_persona"));
                pt.setEmail_persona(this.rs.getString("email_persona"));
                pt.setFk_genero(this.rs.getInt("fk_genero"));
                pt.setFk_eps(this.rs.getInt("fk_eps"));
                pt.setFk_rh(this.rs.getInt("fk_rh"));
                pt.setFk_persona(this.rs.getInt("fk_persona"));
                pt.setFk_tipo_personal(this.rs.getInt("fk_tipo_personal"));
                pt.setPersona_activa(this.rs.getBoolean("persona_activa"));
                lista.add(pt);
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
     * Cambia el rol de un entrenador
     * @param id ID del entrenador
     * @param nuevoRol Nuevo rol (1: Administrador, 2: Entrenador)
     * @return true si el cambio fue exitoso, false en caso contrario
     */
    public boolean cambiarRolEntrenador(int id, int nuevoRol) {
        boolean exito = false;
        try {
            this.conn = this.cn.getConexion();
            String sql = "UPDATE personal_t SET fk_tipo_personal = ? WHERE fk_persona = ?";
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, nuevoRol);
            this.ps.setInt(2, id);
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
     * Cambia el estado de un entrenador (activo/inactivo)
     * @param id ID del entrenador
     * @param nuevoEstado Nuevo estado (true: activo, false: inactivo)
     * @return true si el cambio fue exitoso, false en caso contrario
     */
    public boolean cambiarEstadoEntrenador(int id, boolean nuevoEstado) {
        boolean exito = false;
        try {
            this.conn = this.cn.getConexion();
            String sql = "UPDATE personal_t SET persona_activa = ? WHERE fk_persona = ?";
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setBoolean(1, nuevoEstado);
            this.ps.setInt(2, id);
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
     * Actualiza un entrenador usando el procedimiento almacenado pa_updatepersonal
     * @param id ID de la persona
     * @param tipoId Tipo de identificación
     * @param idPersona Número de identificación
     * @param nom1 Primer nombre
     * @param nom2 Segundo nombre
     * @param ape1 Primer apellido
     * @param ape2 Segundo apellido
     * @param fechaNac Fecha de nacimiento
     * @param direccion Dirección
     * @param telefono Teléfono
     * @param email Email
     * @param genero Código de género
     * @param eps Código de EPS
     * @param rh Código de RH
     * @param rol Código de rol
     * @param activo Estado (activo/inactivo)
     * @return true si la actualización fue exitosa, false en caso contrario
     */
    public boolean actualizarEntrenador(int id, String tipoId, String idPersona, String nom1, String nom2, String ape1, String ape2, 
            java.util.Date fechaNac, String direccion, String telefono, String email, int genero, int eps, int rh, int rol, boolean activo) {
        boolean exito = false;
        try {
            this.conn = this.cn.getConexion();
            
            // Llamada al procedimiento pa_updatepersonal para actualizar datos personales
            CallableStatement cs = this.conn.prepareCall("CALL pa_updatepersonal(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            cs.setInt(1, id);
            cs.setString(2, tipoId);
            cs.setInt(3, Integer.parseInt(idPersona));
            cs.setString(4, nom1);
            cs.setString(5, nom2);
            cs.setString(6, ape1);
            cs.setString(7, ape2);
            cs.setDate(8, fechaNac != null ? new java.sql.Date(fechaNac.getTime()) : null);
            cs.setString(9, direccion);
            cs.setLong(10, Long.parseLong(telefono));
            cs.setString(11, email);
            cs.setInt(12, genero);
            cs.setInt(13, eps);
            cs.setInt(14, rh);
            
            exito = cs.executeUpdate() >= 0;
            
            // Actualizar rol y estado en personal_t en una consulta separada
            if (exito) {
                String sqlPersonal = "UPDATE personal_t SET fk_tipo_personal = ?, persona_activa = ? WHERE fk_persona = ?";
                PreparedStatement ps = this.conn.prepareStatement(sqlPersonal);
                ps.setInt(1, rol);
                ps.setBoolean(2, activo);
                ps.setInt(3, id);
                
                exito = ps.executeUpdate() > 0;
                ps.close();
            }
            
            cs.close();
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            exito = false;
        } finally {
            try {
                if (this.conn != null) this.conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return exito;
    }
}
