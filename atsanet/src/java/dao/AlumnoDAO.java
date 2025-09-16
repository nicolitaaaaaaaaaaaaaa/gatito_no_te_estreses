
package dao;

import control.ConnBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Alumno;

public class AlumnoDAO {
    PreparedStatement ps;
    ResultSet rs;
    
    public List<Alumno> listar(){
        List<Alumno> listaAlumnos = new ArrayList<>();
        
        try{
            String sql = "SELECT * FROM persona "
                    + "INNER JOIN alumno ON persona.id = alumno.fk_persona_alumno;";
            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Alumno a = new Alumno();
                //campos de persona
                a.setId(rs.getInt("id"));
                a.setId_persona(rs.getInt("id_persona"));
                a.setTipo_Id(rs.getString("tipo_id"));
                a.setNom1_persona(rs.getString("nom1_persona"));
                a.setNom2_persona(rs.getString("nom2_persona"));
                a.setApe1_persona(rs.getString("ape1_persona"));
                a.setApe2_persona(rs.getString("ape2_persona"));
                a.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                a.setEdad_persona(rs.getInt("edad_persona"));
                a.setDirec_persona(rs.getString("direc_persona"));
                a.setTel_persona(rs.getLong("tel_persona"));
                a.setEmail_persona(rs.getString("email_persona"));
                a.setFk_genero(rs.getInt("fk_genero"));
                a.setFk_eps(rs.getInt("fk_eps"));
                a.setFk_rh(rs.getInt("fk_rh"));
                
                //campos de alumno
                a.setId(rs.getInt("fk_persona_alumno"));
                a.setTalla(rs.getString("talla"));
                a.setCalzado(rs.getByte("calzado"));
                a.setPieDomi(rs.getString("pie_dominante"));
                a.setFkAcudiente(rs.getInt("fk_acudiente"));
                a.setParentesco(rs.getString("parentesco"));
                a.setFkPosicion(rs.getInt("fk_posiciones"));
                a.setFoto(rs.getString("foto"));
                a.setFechaVenCarnet(rs.getDate("fecha_ven_carnet"));
                a.setFkCategoria(rs.getInt("fk_categoria"));
                a.setLeyDatos(rs.getString("leyDatos"));
                a.setAutoMedica(rs.getString("autoMedica"));
                a.setCertificaEps(rs.getString("certificaEps"));
                a.setEstadoAlumno(rs.getBoolean("estadoAlumno"));
                
                listaAlumnos.add(a);
      
            }
            
        }catch(SQLException e){ 
        }
        
        return listaAlumnos;
    }
    
    public void agregar(Alumno a){
        try {
            String sql = "";
        } catch (Exception e) {
        }
    }


    
}
