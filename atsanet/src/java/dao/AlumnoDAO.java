package dao;

import control.ConnBD;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import modelo.Acudiente;
import modelo.Alumno;
import modelo.Matricula;
import modelo.Posicion;

public class AlumnoDAO {
    PreparedStatement ps;
    ResultSet rs;

    //METODOS DE AGREGAR
    //Metodo para agreagar a un postulante
    public void agregarAspirante(Alumno a) {
        try {
            Acudiente acu = new Acudiente();
            a.setAcudiente(acu);
            String sql = "CALL pa_ma_agregarAlumno(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = ConnBD.conectar().prepareStatement(sql);

            ps.setInt(1, a.getId_persona());
            ps.setString(2, a.getTipo_Id());
            ps.setString(3, a.getNom1_persona());
            ps.setString(4, a.getNom2_persona());
            ps.setString(5, a.getApe1_persona());
            ps.setString(6, a.getApe2_persona());
            
            //util.Date --> sql.Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date f_nac = Date.valueOf(sdf.format(a.getFecha_nacimiento()));
            ps.setDate(7, f_nac);

            ps.setString(8, a.getDirec_persona());
            ps.setLong(9, a.getTel_persona());
            ps.setString(10, a.getEmail_persona());
            ps.setInt(11, a.getFk_genero());
            ps.setInt(12, a.getFk_eps());
            ps.setInt(13, a.getFk_rh());

            ps.setString(14, a.getTalla());
            ps.setByte(15, a.getCalzado());
            ps.setString(16, a.getPie_domi());
            ps.setString(17, a.getParentesco());
            ps.setInt(18, a.getFk_posicion());
            ps.setString(19, a.getFoto());
            ps.setString(20, a.getLeyDatos());
            ps.setString(21, a.getAutoMedica());
            ps.setString(22, a.getCertificaEps());

            ps.setInt(23, acu.getId());
            ps.setString(24, acu.getTipo_id());
            ps.setString(25, acu.getNom1_acudiente());
            ps.setString(26, acu.getNom2_acudiente());
            ps.setString(27, acu.getApe1_acudiente());
            ps.setString(28, acu.getApe2_acudiente());
            ps.setLong(29, acu.getTel_acudiente());

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //METODOS DE LISTAR
    //Metodo de listar postulantes
    public List<Alumno> listarPostulantes() {
        List<Alumno> listaPostulantes = new ArrayList<>();

        try {
            String sql = "SELECT per.id_persona, per.tipo_id, per.nom1_persona, per.nom2_persona, per.ape1_persona, per.ape2_persona, per.fecha_nacimiento, per.direc_persona, per.tel_persona, per.email_persona, per.fk_genero, per.fk_eps, per.fk_rh, \n"
                    + "alu.fk_persona_alumno, alu.talla, alu.calzado, alu.pie_domi, alu.fk_acudiente, alu.parentesco, alu.fk_posicion, alu.foto, alu.leyDatos, alu.autoMedica, alu.certificaEps, alu.estado_alumno, alu.postulante,\n"
                    + "acu.id, acu.tipo_id, acu.nom1_acudiente, acu.nom2_acudiente, acu.ape1_acudiente, acu.ape2_acudiente, acu.tel_acudiente\n"
                    + "FROM persona per \n"
                    + "INNER JOIN alumno alu ON alu.fk_persona_alumno = per.id\n"
                    + "INNER JOIN acudiente acu ON acu.idacudiente = alu.fk_acudiente "
                    + "WHERE alu.postulante = 1 AND alu.estado_alumno = 0; ";

            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Alumno a = new Alumno();
                Acudiente acu = new Acudiente();
                a.setId_persona(rs.getInt("id_persona"));
                a.setTipo_Id(rs.getString("tipo_id"));
                a.setNom1_persona(rs.getString("nom1_persona"));
                a.setNom2_persona(rs.getString("nom2_persona"));
                a.setApe1_persona(rs.getString("ape1_persona"));
                a.setApe2_persona(rs.getString("ape2_persona"));
                a.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                a.setDirec_persona(rs.getString("direc_persona"));
                a.setTel_persona(rs.getLong("tel_persona"));
                a.setEmail_persona(rs.getString("email_persona"));
                a.setFk_genero(rs.getInt("fk_genero"));
                a.setFk_eps(rs.getInt("fk_eps"));
                a.setFk_rh(rs.getInt("fk_rh"));
                
                a.setId(rs.getInt("fk_persona_alumno"));
                a.setTalla(rs.getString("talla"));
                a.setCalzado(rs.getByte("calzado"));
                a.setPie_domi(rs.getString("pie_domi"));
                a.setFk_acudiente(rs.getInt("fk_acudiente"));
                a.setParentesco(rs.getString("parentesco"));
                a.setFk_posicion(rs.getInt("fk_posicion"));
                a.setFoto(rs.getString("foto"));
                a.setLeyDatos(rs.getString("leyDatos"));
                a.setAutoMedica(rs.getString("autoMedica"));
                a.setCertificaEps(rs.getString("certificaEps"));
                a.setEstado_alumno(rs.getBoolean("estado_alumno"));
                a.setPostulante(rs.getBoolean("postulante"));
                 
                acu.setId(rs.getInt("id"));
                acu.setTipo_id(rs.getString("tipo_id"));
                acu.setNom1_acudiente(rs.getString("nom1_acudiente"));
                acu.setNom2_acudiente(rs.getString("nom2_acudiente"));
                acu.setApe1_acudiente(rs.getString("ape1_acudiente"));
                acu.setApe2_acudiente(rs.getString("ape2_acudiente"));
                acu.setTel_acudiente(rs.getLong("tel_acudiente"));

                a.setAcudiente(acu);
                listaPostulantes.add(a);
            }
        } catch (SQLException e) {
        }

        return listaPostulantes;
    }

    //Metodo de listar alumnos ya matriculados y activos
    public List<Alumno> listarMatricula() {
        List<Alumno> listaAlumnos = new ArrayList<>();

        try {
            String sql = "SELECT per.id_persona, per.tipo_id, per.nom1_persona, per.nom2_persona, per.ape1_persona, per.ape2_persona, per.fecha_nacimiento, per.direc_persona, per.tel_persona, per.email_persona, per.fk_genero, per.fk_eps, per.fk_rh, \n"
                    + "alu.fk_persona_alumno, alu.talla, alu.calzado, alu.pie_domi, alu.fk_acudiente, alu.parentesco, alu.fk_posicion, alu.foto, alu.leyDatos, alu.autoMedica, alu.certificaEps, alu.estado_alumno, alu.postulante,\n"
                    + "acu.id, acu.tipo_id, acu.nom1_acudiente, acu.nom2_acudiente, acu.ape1_acudiente, acu.ape2_acudiente, acu.tel_acudiente,\n"
                    + "mat.idmatricula, mat.fecha_inicio, mat.fecha_ven_carnet, mat.fk_categoria\n"
                    + "FROM persona per \n"
                    + "INNER JOIN alumno alu ON alu.fk_persona_alumno = per.id\n"
                    + "INNER JOIN acudiente acu ON acu.idacudiente = alu.fk_acudiente\n"
                    + "INNER JOIN matricula mat ON mat.fk_alumno = alu.fk_persona_alumno\n"
                    + "WHERE alu.estado_alumno = 1 AND alu.postulante = 0 AND YEAR(mat.fecha_inicio) = YEAR(CURDATE());";

            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Alumno a = new Alumno();
                Acudiente acu = new Acudiente();
                Matricula mat = new Matricula();
                
                a.setId_persona(rs.getInt("id_persona"));
                a.setTipo_Id(rs.getString("tipo_id"));
                a.setNom1_persona(rs.getString("nom1_persona"));
                a.setNom2_persona(rs.getString("nom2_persona"));
                a.setApe1_persona(rs.getString("ape1_persona"));
                a.setApe2_persona(rs.getString("ape2_persona"));
                a.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                a.setDirec_persona(rs.getString("direc_persona"));
                a.setTel_persona(rs.getLong("tel_persona"));
                a.setEmail_persona(rs.getString("email_persona"));
                a.setFk_genero(rs.getInt("fk_genero"));
                a.setFk_eps(rs.getInt("fk_eps"));
                a.setFk_rh(rs.getInt("fk_rh"));
                

                /* ETE FUNCIONA
                AlumnoDAO aluDAO = new AlumnoDAO();
                PersonaDAO perDAO = new PersonaDAO();
                    a.setGenero(perDAO.buscarGenero(rs.getInt("fk_genero")));
                    a.setRh(perDAO.buscarRh(rs.getInt("fk_rh")));
                    a.setEps(perDAO.buscarEps(rs.getInt("fk_eps")));
                    a.setPosicion(aluDAO.buscarPosicion(rs.getInt("fk_posicion")));
                    */
                
                a.setId(rs.getInt("fk_persona_alumno"));
                a.setTalla(rs.getString("talla"));
                a.setCalzado(rs.getByte("calzado"));
                a.setPie_domi(rs.getString("pie_domi"));
                a.setFk_acudiente(rs.getInt("fk_acudiente"));
                a.setParentesco(rs.getString("parentesco"));
                a.setFk_posicion(rs.getInt("fk_posicion"));
                a.setFoto(rs.getString("foto"));
                a.setLeyDatos(rs.getString("leyDatos"));
                a.setAutoMedica(rs.getString("autoMedica"));
                a.setCertificaEps(rs.getString("certificaEps"));
                a.setEstado_alumno(rs.getBoolean("estado_alumno"));
                a.setPostulante(rs.getBoolean("postulante"));
                
                acu.setId(rs.getInt("id"));
                acu.setTipo_id(rs.getString("tipo_id"));
                acu.setNom1_acudiente(rs.getString("nom1_acudiente"));
                acu.setNom2_acudiente(rs.getString("nom2_acudiente"));
                acu.setApe1_acudiente(rs.getString("ape1_acudiente"));
                acu.setApe2_acudiente(rs.getString("ape2_acudiente"));
                acu.setTel_acudiente(rs.getLong("tel_acudiente"));

                mat.setIdmatricula(rs.getInt("idmatricula"));
                mat.setFecha_inicio(rs.getTimestamp("fecha_inicio"));
                mat.setFecha_ven_carnet(rs.getDate("fecha_ven_carnet"));
                mat.setFk_categoria(rs.getInt("fk_categoria"));
                
               
                a.setMatricula(mat);
                a.setAcudiente(acu);

                listaAlumnos.add(a);
            }
        } catch (SQLException e) {
        }

        return listaAlumnos;
    }
    
    //Metodo para listar todas las posiciones
    public List<Posicion> listarPosiciones(){
        List<Posicion> listarP = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM posicion";
            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Posicion p = new Posicion();
                p.setIdposicion(rs.getInt("idposicion"));
                p.setNom_posicion(rs.getString("nom_posicion"));
                p.setDesc_posicion(rs.getString("desc_posicion"));
                
                listarP.add(p); 
            }
            
        } catch (SQLException e) {
        }
        
        return listarP;
    }

    
    //METODOS DE BUSCAR
    //Metodo de buscar un solo postulante para rechazarlo o aceptarlo
    public Alumno buscarPostulane(Alumno alum) {
        Alumno a = new Alumno();
        try {
            String sql = "SELECT per.id_persona, per.tipo_id, per.nom1_persona, per.nom2_persona, per.ape1_persona, per.ape2_persona, per.fecha_nacimiento, per.direc_persona, per.tel_persona, per.email_persona, per.fk_genero, per.fk_eps, per.fk_rh, \n"
                    + "alu.fk_persona_alumno, alu.talla, alu.calzado, alu.pie_domi, alu.fk_acudiente, alu.parentesco, alu.fk_posicion, alu.foto, alu.leyDatos, alu.autoMedica, alu.certificaEps, alu.estado_alumno, alu.postulante,\n"
                    + "acu.id, acu.tipo_id, acu.nom1_acudiente, acu.nom2_acudiente, acu.ape1_acudiente, acu.ape2_acudiente, acu.tel_acudiente\n"
                    + "FROM persona per \n"
                    + "INNER JOIN alumno alu ON alu.fk_persona_alumno = per.id\n"
                    + "INNER JOIN acudiente acu ON acu.idacudiente = alu.fk_acudiente \n"
                    + "WHERE per.id_persona = ? AND alu.postulante = 1;";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, alum.getId_persona());

            rs = ps.executeQuery();

            while (rs.next()) {
                Acudiente acu = new Acudiente();
                Matricula mat = new Matricula();
                a.setId_persona(rs.getInt("id_persona"));
                a.setTipo_Id(rs.getString("tipo_id"));
                a.setNom1_persona(rs.getString("nom1_persona"));
                a.setNom2_persona(rs.getString("nom2_persona"));
                a.setApe1_persona(rs.getString("ape1_persona"));
                a.setApe2_persona(rs.getString("ape2_persona"));
                a.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                a.setDirec_persona(rs.getString("direc_persona"));
                a.setTel_persona(rs.getLong("tel_persona"));
                a.setEmail_persona(rs.getString("email_persona"));
                a.setFk_genero(rs.getInt("fk_genero"));
                a.setFk_eps(rs.getInt("fk_eps"));
                a.setFk_rh(rs.getInt("fk_rh"));

                a.setId(rs.getInt("fk_persona_alumno"));
                a.setTalla(rs.getString("talla"));
                a.setCalzado(rs.getByte("calzado"));
                a.setPie_domi(rs.getString("pie_domi"));
                a.setFk_acudiente(rs.getInt("fk_acudiente"));
                a.setParentesco(rs.getString("parentesco"));
                a.setFk_posicion(rs.getInt("fk_posicion"));
                a.setFoto(rs.getString("foto"));
                a.setLeyDatos(rs.getString("leyDatos"));
                a.setAutoMedica(rs.getString("autoMedica"));
                a.setCertificaEps(rs.getString("certificaEps"));
                a.setEstado_alumno(rs.getBoolean("estado_alumno"));
                a.setPostulante(rs.getBoolean("postulante"));

                acu.setId(rs.getInt("id"));
                acu.setTipo_id(rs.getString("tipo_id"));
                acu.setNom1_acudiente(rs.getString("nom1_acudiente"));
                acu.setNom2_acudiente(rs.getString("nom2_acudiente"));
                acu.setApe1_acudiente(rs.getString("ape1_acudiente"));
                acu.setApe2_acudiente(rs.getString("ape2_acudiente"));
                acu.setTel_acudiente(rs.getLong("tel_acudiente"));

                mat.setIdmatricula(rs.getInt("idmatricula"));
                mat.setFecha_inicio(rs.getTimestamp("fecha_inicio"));
                mat.setFecha_ven_carnet(rs.getDate("fecha_ven_carnet"));
                mat.setFk_categoria(rs.getInt("fk_categoria"));

                a.setMatricula(mat);
                a.setAcudiente(acu);
            }

        } catch (SQLException e) {
        }
        return a;
    }

    //Metodo de buscar alumno matriculado para editar su informacion
    public Alumno buscarMatriculado(Alumno alum) {
        Alumno a = new Alumno();
        try {
            String sql = "SELECT per.id_persona, per.tipo_id, per.nom1_persona, per.nom2_persona, per.ape1_persona, per.ape2_persona, per.fecha_nacimiento, per.direc_persona, per.tel_persona, per.email_persona, per.fk_genero, per.fk_eps, per.fk_rh, \n"
                    + "alu.fk_persona_alumno, alu.talla, alu.calzado, alu.pie_domi, alu.fk_acudiente, alu.parentesco, alu.fk_posicion, alu.foto, alu.leyDatos, alu.autoMedica, alu.certificaEps, alu.estado_alumno, alu.postulante,\n"
                    + "acu.id, acu.tipo_id, acu.nom1_acudiente, acu.nom2_acudiente, acu.ape1_acudiente, acu.ape2_acudiente, acu.tel_acudiente,\n"
                    + "mat.idmatricula, mat.fecha_inicio, mat.fecha_ven_carnet, mat.fk_categoria\n"
                    + "FROM persona per \n"
                    + "INNER JOIN alumno alu ON alu.fk_persona_alumno = per.id\n"
                    + "INNER JOIN acudiente acu ON acu.idacudiente = alu.fk_acudiente\n"
                    + "INNER JOIN matricula mat ON mat.fk_alumno = alu.fk_persona_alumno\n"
                    + "WHERE per.id_persona = ? AND alu.estado_alumno = 1 AND alu.postulante = 0;";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, alum.getId_persona());

            rs = ps.executeQuery();

            if (rs.next()) {
                Acudiente acu = new Acudiente();
                Matricula mat = new Matricula();
                a.setId_persona(rs.getInt("id_persona"));
                a.setTipo_Id(rs.getString("tipo_id"));
                a.setNom1_persona(rs.getString("nom1_persona"));
                a.setNom2_persona(rs.getString("nom2_persona"));
                a.setApe1_persona(rs.getString("ape1_persona"));
                a.setApe2_persona(rs.getString("ape2_persona"));
                a.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                a.setDirec_persona(rs.getString("direc_persona"));
                a.setTel_persona(rs.getLong("tel_persona"));
                a.setEmail_persona(rs.getString("email_persona"));
                a.setFk_genero(rs.getInt("fk_genero"));
                a.setFk_eps(rs.getInt("fk_eps"));
                a.setFk_rh(rs.getInt("fk_rh"));

                a.setId(rs.getInt("fk_persona_alumno"));
                a.setTalla(rs.getString("talla"));
                a.setCalzado(rs.getByte("calzado"));
                a.setPie_domi(rs.getString("pie_domi"));
                a.setFk_acudiente(rs.getInt("fk_acudiente"));
                a.setParentesco(rs.getString("parentesco"));
                a.setFk_posicion(rs.getInt("fk_posicion"));
                a.setFoto(rs.getString("foto"));
                a.setLeyDatos(rs.getString("leyDatos"));
                a.setAutoMedica(rs.getString("autoMedica"));
                a.setCertificaEps(rs.getString("certificaEps"));
                a.setEstado_alumno(rs.getBoolean("estado_alumno"));
                a.setPostulante(rs.getBoolean("postulante"));

                acu.setId(rs.getInt("id"));
                acu.setTipo_id(rs.getString("tipo_id"));
                acu.setNom1_acudiente(rs.getString("nom1_acudiente"));
                acu.setNom2_acudiente(rs.getString("nom2_acudiente"));
                acu.setApe1_acudiente(rs.getString("ape1_acudiente"));
                acu.setApe2_acudiente(rs.getString("ape2_acudiente"));
                acu.setTel_acudiente(rs.getLong("tel_acudiente"));

                mat.setIdmatricula(rs.getInt("idmatricula"));
                mat.setFecha_inicio(rs.getTimestamp("fecha_inicio"));
                mat.setFecha_ven_carnet(rs.getDate("fecha_ven_carnet"));
                mat.setFk_categoria(rs.getInt("fk_categoria"));

                a.setMatricula(mat);
                a.setAcudiente(acu);
            }

        } catch (SQLException e) {
        }

        return a;
    }
    
    //Metodo para buscar una posicion
    public Posicion buscarPosicion(int fk_posicion) {
        Posicion p = new Posicion();

        try {
            String sql = "SELECT * FROM posicion WHERE idposion = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, fk_posicion);
            rs = ps.executeQuery();

            if (rs.next()) {
                p.setIdposicion(rs.getInt("idposicion"));
                p.setNom_posicion(rs.getString("nom_posicion"));
                p.setDesc_posicion(rs.getString("desc_posicion"));
            }
        } catch (Exception e) {
        }

        return p;
    }
    
    public Posicion buscarPosicion(Posicion pos) {
        Posicion p = new Posicion();

        try {
            String sql = "SELECT * FROM posicion WHERE idposion = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, pos.getIdposicion());
            rs = ps.executeQuery();

            if (rs.next()) {
                p.setIdposicion(rs.getInt("idposicion"));
                p.setNom_posicion(rs.getString("nom_posicion"));
                p.setDesc_posicion(rs.getString("desc_posicion"));
            }
        } catch (Exception e) {
        }

        return p;
    }

    //METODOS DE ACTUALIZAR
    //Metodo para editar un alumno matriculado
    public void actualizarMatriculado(Alumno a) {
        try {
            Acudiente acu = new Acudiente();
            Matricula mat = new Matricula();
            String sql = "CALL pa_ma_actualizarAlumno(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = ConnBD.conectar().prepareStatement(sql);

            ps.setInt(1, a.getId_persona());
            ps.setString(2, a.getTipo_Id());
            ps.setString(3, a.getNom1_persona());
            ps.setString(4, a.getNom2_persona());
            ps.setString(5, a.getApe1_persona());
            ps.setString(6, a.getApe2_persona());
            ps.setString(7, a.getDirec_persona());
            ps.setLong(8, a.getTel_persona());
            ps.setString(9, a.getEmail_persona());
            ps.setInt(10, a.getFk_genero());
            ps.setInt(11, a.getFk_eps());

            ps.setString(12, a.getTalla());
            ps.setByte(13, a.getCalzado());
            ps.setString(14, a.getPie_domi());
            ps.setString(15, a.getParentesco());
            ps.setInt(16, a.getFk_posicion());
            ps.setString(17, a.getFoto());
            ps.setString(18, a.getAutoMedica());
            ps.setString(19, a.getCertificaEps());

            ps.setInt(20, acu.getId());
            ps.setString(21, acu.getTipo_id());
            ps.setString(22, acu.getNom1_acudiente());
            ps.setString(23, acu.getNom2_acudiente());
            ps.setString(24, acu.getApe1_acudiente());
            ps.setString(25, acu.getApe2_acudiente());
            ps.setLong(26, acu.getTel_acudiente());

            ps.setInt(27, mat.getFk_categoria());

            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //OTROS METODOS
    //Metodo para descativar un alumno matriculado
    public void suspenderMatricula(Alumno a) {
        try {
            String sql = "UPDATE alumno alu INNER JOIN persona per ON per.id = alu.fk_persona_alumno "
                    + "SET alu.estado_alumno = 0 "
                    + "WHERE per.id_persona = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, a.getId_persona());

            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    //Metodo para aceptar un postulante
    public void aceptarPostulante(Alumno a) {
        try {
            String sql = "UPDATE alumno alu\n"
                    + "INNER JOIN persona per ON per.id = alu.fk_persona_alumno\n"
                    + "SET alu.estado_alumno = 1,\n"
                    + "alu.postulante = 0\n"
                    + "WHERE per.id_persona = ?;";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, a.getId_persona());

            ps.executeUpdate();

        } catch (SQLException e) {
        }
    }

    //Metodo para rechazar un postulante
    public void rechazarPostulante(Alumno a) {
        try {
            String sql = "UPDATE alumno alu\n"
                    + "INNER JOIN persona per ON per.id = alu.fk_persona_alumno\n"
                    + "SET alu.estado_alumno = 0,\n"
                    + "alu.postulante = 0\n"
                    + "WHERE per.id_persona = ?;";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, a.getId_persona());

            ps.executeUpdate();

        } catch (SQLException e) {
        }

    }
}
