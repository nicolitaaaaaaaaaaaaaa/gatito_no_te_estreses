package Controlador;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Config.Conexion;
import Modelo.*;

@WebServlet("/ReporteServlet")
public class ReporteServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("cargarDatos".equals(action) || action == null) {
            cargarDatosIniciales(request, response);
        } else if ("obtenerAlumnosPorCategoria".equals(action)) {
            obtenerAlumnosPorCategoria(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("generarReporteIndividual".equals(action)) {
            generarReporteIndividual(request, response);
        } else if ("generarReporteGrupal".equals(action)) {
            generarReporteGrupal(request, response);
        }
    }
    
    private void cargarDatosIniciales(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Categoria> categorias = new ArrayList<>();
        
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();
            String sql = "SELECT idcategoria, nom_categoria FROM categoria ORDER BY idcategoria";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idcategoria"));
                categoria.setNomCategoria(rs.getString("nom_categoria"));
                categorias.add(categoria);
            }
            
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("categorias", categorias);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/reporte.jsp");
        dispatcher.forward(request, response);
    }
    
    private void obtenerAlumnosPorCategoria(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String categoriaId = request.getParameter("categoriaId");
        List<Alumno> alumnos = new ArrayList<>();
        
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();
            String sql = "SELECT a.fk_persona_alumno, CONCAT(p.nom1_persona, ' ', p.ape1_persona) as nombre_completo " +
                        "FROM alumno a " +
                        "INNER JOIN persona p ON a.fk_persona_alumno = p.id " +
                        "WHERE a.fk_categoria = ? AND a.estado_alumno = 1 " +
                        "ORDER BY p.nom1_persona, p.ape1_persona";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(categoriaId));
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Alumno alumno = new Alumno();
                alumno.setIdAlumno(rs.getInt("fk_persona_alumno"));
                alumno.setNombreCompleto(rs.getString("nombre_completo"));
                alumnos.add(alumno);
            }
            
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("alumnos", alumnos);
        request.setAttribute("categoriaSeleccionada", categoriaId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Vistas/fragments/alumnosFragment.jsp");
        dispatcher.forward(request, response);
    }
    
    private void generarReporteIndividual(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String categoriaId = request.getParameter("categoria");
        String idAlumno = request.getParameter("idAlumno");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");
        
        List<ReporteIndividual> reportes = new ArrayList<>();
        String nombreAlumno = "";
        String nombreCategoria = "";
        
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();
            // Obtener nombre de categoría
            String sqlCategoria = "SELECT nom_categoria FROM categoria WHERE idcategoria = ?";
            PreparedStatement stmtCat = conn.prepareStatement(sqlCategoria);
            stmtCat.setInt(1, Integer.parseInt(categoriaId));
            ResultSet rsCat = stmtCat.executeQuery();
            if (rsCat.next()) {
                nombreCategoria = rsCat.getString("nom_categoria");
            }
            
            // Consulta para reporte individual
            String sql = "SELECT " +
                        "se.fecha_entrenamiento, " +
                        "CASE WHEN a.asistencia = 1 THEN 'PRESENTE' ELSE 'AUSENTE' END as asistencia, " +
                        "e.nom_entrenamiento as tipo_entrenamiento, " +
                        "CASE WHEN se.valoracion_objetivo = 1 THEN 'SÍ' ELSE 'NO' END as objetivo_cumplido, " +
                        "se.observaciones, " +
                        "CONCAT(p.nom1_persona, ' ', p.ape1_persona) as nombre_completo " +
                        "FROM sesion_entrenamiento se " +
                        "INNER JOIN entrenamiento e ON se.fk_entrenamiento = e.identrenamiento " +
                        "INNER JOIN asistencia a ON se.fk_alumno = a.fk_alumno AND se.fecha_entrenamiento = a.fecha_asistencia " +
                        "INNER JOIN persona p ON se.fk_alumno = p.id " +
                        "INNER JOIN alumno al ON se.fk_alumno = al.fk_persona_alumno " +
                        "WHERE se.fk_alumno = ? " +
                        "AND al.fk_categoria = ? " +
                        "AND se.fecha_entrenamiento BETWEEN ? AND ? " +
                        "ORDER BY se.fecha_entrenamiento";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(idAlumno));
            stmt.setInt(2, Integer.parseInt(categoriaId));
            stmt.setString(3, fechaInicio);
            stmt.setString(4, fechaFin);
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                ReporteIndividual reporte = new ReporteIndividual();
                reporte.setFechaEntrenamiento(rs.getString("fecha_entrenamiento"));
                reporte.setAsistencia(rs.getString("asistencia"));
                reporte.setTipoEntrenamiento(rs.getString("tipo_entrenamiento"));
                reporte.setObjetivoCumplido(rs.getString("objetivo_cumplido"));
                reporte.setObservaciones(rs.getString("observaciones"));
                reporte.setNombreCompleto(rs.getString("nombre_completo"));
                reportes.add(reporte);
                
                if (nombreAlumno.isEmpty()) {
                    nombreAlumno = rs.getString("nombre_completo");
                }
            }
            
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("reportesIndividuales", reportes);
        request.setAttribute("nombreAlumno", nombreAlumno);
        request.setAttribute("nombreCategoria", nombreCategoria);
        request.setAttribute("idAlumno", idAlumno);
        request.setAttribute("fechaInicio", fechaInicio);
        request.setAttribute("fechaFin", fechaFin);
        request.setAttribute("tipoReporte", "individual");
        
        // Recargar categorías para el formulario
        cargarDatosIniciales(request, response);
    }
    
    private void generarReporteGrupal(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String categoriaId = request.getParameter("categoria");
        String fechaInicio = request.getParameter("fechaInicio");
        String fechaFin = request.getParameter("fechaFin");
        
        List<ReporteGrupal> reportes = new ArrayList<>();
        String nombreCategoria = "";
        
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.getConexion();
            // Obtener nombre de categoría
            String sqlCategoria = "SELECT nom_categoria FROM categoria WHERE idcategoria = ?";
            PreparedStatement stmtCat = conn.prepareStatement(sqlCategoria);
            stmtCat.setInt(1, Integer.parseInt(categoriaId));
            ResultSet rsCat = stmtCat.executeQuery();
            if (rsCat.next()) {
                nombreCategoria = rsCat.getString("nom_categoria");
            }
            
            String sql = "SELECT " +
                        "a.fk_persona_alumno as id_alumno, " +
                        "CONCAT(p.nom1_persona, ' ', p.ape1_persona) as nombre_completo, " +
                        "COUNT(se.idsesionentrenamiento) as total_entrenamientos, " +
                        "SUM(CASE WHEN ast.asistencia = 1 THEN 1 ELSE 0 END) as total_asistencias, " +
                        "ROUND((SUM(CASE WHEN ast.asistencia = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(se.idsesionentrenamiento)), 1) as porcentaje_asistencia, " +
                        "SUM(CASE WHEN se.valoracion_objetivo = 1 THEN 1 ELSE 0 END) as total_objetivos_cumplidos, " +
                        "ROUND((SUM(CASE WHEN se.valoracion_objetivo = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(se.idsesionentrenamiento)), 1) as porcentaje_objetivos " +
                        "FROM alumno a " +
                        "INNER JOIN persona p ON a.fk_persona_alumno = p.id " +
                        "INNER JOIN sesion_entrenamiento se ON a.fk_persona_alumno = se.fk_alumno " +
                        "INNER JOIN asistencia ast ON se.fk_alumno = ast.fk_alumno AND se.fecha_entrenamiento = ast.fecha_asistencia " +
                        "WHERE a.fk_categoria = ? " +
                        "AND a.estado_alumno = 1 " +
                        "AND se.fecha_entrenamiento BETWEEN ? AND ? " +
                        "GROUP BY a.fk_persona_alumno, p.nom1_persona, p.ape1_persona " +
                        "ORDER BY p.nom1_persona, p.ape1_persona";
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(categoriaId));
            stmt.setString(2, fechaInicio);
            stmt.setString(3, fechaFin);
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                ReporteGrupal reporte = new ReporteGrupal();
                reporte.setIdAlumno(rs.getInt("id_alumno"));
                reporte.setNombreCompleto(rs.getString("nombre_completo"));
                reporte.setTotalEntrenamientos(rs.getInt("total_entrenamientos"));
                reporte.setTotalAsistencias(rs.getInt("total_asistencias"));
                reporte.setPorcentajeAsistencia(rs.getDouble("porcentaje_asistencia"));
                reporte.setTotalObjetivosCumplidos(rs.getInt("total_objetivos_cumplidos"));
                reporte.setPorcentajeObjetivos(rs.getDouble("porcentaje_objetivos"));
                reportes.add(reporte);
            }
            
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("reportesGrupales", reportes);
        request.setAttribute("nombreCategoria", nombreCategoria);
        request.setAttribute("fechaInicio", fechaInicio);
        request.setAttribute("fechaFin", fechaFin);
        request.setAttribute("tipoReporte", "grupal");
        
        // Recargar categorías para el formulario
        cargarDatosIniciales(request, response);
    }
}
