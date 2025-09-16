package Controlador;

import Modelo.Jornada;
import Modelo.JornadaDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.List;

@WebServlet("/JornadaServlet")
public class JornadaServlet extends HttpServlet {
    
    private JornadaDao jornadaDao = new JornadaDao();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        configurarHeadersCORS(response);
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "listar";
        }
        
        switch (action) {
            case "listar":
                listarJornadas(request, response);
                break;
            case "listarJSON":
                listarJornadasJSON(request, response);
                break;
            default:
                listarJornadas(request, response);
                break;
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            configurarHeadersCORS(response);
            
            String action = request.getParameter("action");
            
            if (action == null) {
                enviarRespuestaJSON(response, false, "Parámetro 'action' requerido");
                return;
            }
            
            switch (action) {
                case "crear":
                    crearJornada(request, response);
                    break;
                case "actualizar":
                    actualizarJornada(request, response);
                    break;
                case "eliminar":
                    eliminarJornada(request, response);
                    break;
                default:
                    enviarRespuestaJSON(response, false, "Acción no válida: " + action);
                    break;
            }
        } catch (Exception e) {
            try {
                enviarRespuestaJSON(response, false, "Error del servidor: " + e.getMessage());
            } catch (Exception e2) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }
    
    private void listarJornadas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Jornada> jornadas = jornadaDao.listarJornadas();
            request.setAttribute("jornadas", jornadas);
            request.getRequestDispatcher("Vistas/gestionJornadas.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            enviarRespuestaJSON(response, false, "Error al listar jornadas: " + e.getMessage());
        }
    }
    
    private void crearJornada(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String dia_semana = request.getParameter("dia_semana");
            String hora_jornada_str = request.getParameter("hora_jornada");
            
            // Validaciones
            if (dia_semana == null || hora_jornada_str == null) {
                enviarRespuestaJSON(response, false, "Faltan campos requeridos");
                return;
            }
            
            Time hora_jornada = Time.valueOf(hora_jornada_str + ":00");
            
            // Verificar si ya existe una jornada con el mismo día y hora
            if (jornadaDao.existeJornada(dia_semana, hora_jornada, 0)) {
                enviarRespuestaJSON(response, false, "Ya existe una jornada para " + dia_semana + " a las " + hora_jornada_str);
                return;
            }
            
            Jornada jornada = new Jornada();
            jornada.setDia_semana(dia_semana);
            jornada.setHora_jornada(hora_jornada);
            
            boolean exito = jornadaDao.crear(jornada);
            
            if (exito) {
                enviarRespuestaJSON(response, true, "Jornada creada exitosamente");
            } else {
                enviarRespuestaJSON(response, false, "Error al crear la jornada");
            }
            
        } catch (Exception e) {
            enviarRespuestaJSON(response, false, "Error del sistema: " + e.getMessage());
        }
    }
    
    private void actualizarJornada(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String dia_semana = request.getParameter("dia_semana");
            String hora_jornada_str = request.getParameter("hora_jornada");
            
            // Validaciones
            if (dia_semana == null || hora_jornada_str == null) {
                enviarRespuestaJSON(response, false, "Faltan campos requeridos");
                return;
            }
            
            Time hora_jornada = Time.valueOf(hora_jornada_str + ":00");
            
            // Verificar si ya existe una jornada con el mismo día y hora (excluyendo la actual)
            if (jornadaDao.existeJornada(dia_semana, hora_jornada, id)) {
                enviarRespuestaJSON(response, false, "Ya existe una jornada para " + dia_semana + " a las " + hora_jornada_str);
                return;
            }
            
            Jornada jornada = new Jornada();
            jornada.setIdjornada(id);
            jornada.setDia_semana(dia_semana);
            jornada.setHora_jornada(hora_jornada);
            
            boolean exito = jornadaDao.actualizar(jornada);
            
            if (exito) {
                enviarRespuestaJSON(response, true, "Jornada actualizada exitosamente");
            } else {
                enviarRespuestaJSON(response, false, "Error al actualizar la jornada");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            enviarRespuestaJSON(response, false, "Error del sistema: " + e.getMessage());
        }
    }
    
    private void eliminarJornada(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            
            boolean exito = jornadaDao.eliminar(id);
            
            if (exito) {
                enviarRespuestaJSON(response, true, "Jornada eliminada exitosamente");
            } else {
                enviarRespuestaJSON(response, false, "Error al eliminar la jornada");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            enviarRespuestaJSON(response, false, "Error del sistema: " + e.getMessage());
        }
    }
    
    private void enviarRespuestaJSON(HttpServletResponse response, boolean success, String message) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        out.print("{\"success\":" + success + ",\"message\":\"" + message + "\"}");
        out.flush();
    }
    
    private void listarJornadasJSON(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Jornada> jornadas = jornadaDao.listarJornadas();
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            StringBuilder json = new StringBuilder();
            json.append("{\"success\":true,\"count\":").append(jornadas.size()).append(",\"jornadas\":[");
            
            for (int i = 0; i < jornadas.size(); i++) {
                Jornada jornada = jornadas.get(i);
                if (i > 0) json.append(",");
                
                json.append("{");
                json.append("\"id\":").append(jornada.getIdjornada()).append(",");
                json.append("\"dia_semana\":\"").append(jornada.getDia_semana()).append("\",");
                
                // Formatear hora para mostrar solo HH:mm
                String horaStr = jornada.getHora_jornada().toString();
                if (horaStr.length() > 5) {
                    horaStr = horaStr.substring(0, 5); // Tomar solo HH:mm
                }
                json.append("\"hora_jornada\":\"").append(horaStr).append("\"");
                json.append("}");
            }
            
            json.append("]}");
            
            PrintWriter out = response.getWriter();
            out.print(json.toString());
            out.flush();
            
        } catch (Exception e) {
            e.printStackTrace();
            enviarRespuestaJSON(response, false, "Error al obtener jornadas: " + e.getMessage());
        }
    }
    
    private void configurarHeadersCORS(HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
        response.setHeader("Access-Control-Max-Age", "3600");
    }
    
    @Override
    protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        configurarHeadersCORS(response);
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
