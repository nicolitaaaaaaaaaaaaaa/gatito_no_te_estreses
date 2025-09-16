package Controlador;

import Modelo.PersonalTDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

@WebServlet(name = "EditarEntrenadorServlet", urlPatterns = {"/EditarEntrenadorServlet"})
public class EditarEntrenadorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        Map<String, Object> responseData = new HashMap<>();
        
        try {
            String action = request.getParameter("action");
            
            switch (action) {
                case "actualizarEntrenador":
                    responseData = actualizarEntrenador(request);
                    break;
                case "cargarEntrenadores":
                    responseData = cargarEntrenadores();
                    break;
                case "cambiarRol":
                    responseData = cambiarRol(request);
                    break;
                case "cambiarEstado":
                    responseData = cambiarEstado(request);
                    break;
                default:
                    responseData.put("success", false);
                    responseData.put("message", "Acción no reconocida");
            }
        } catch (Exception e) {
            responseData.put("success", false);
            responseData.put("message", "Error al procesar la solicitud: " + e.getMessage());
            e.printStackTrace();
        }
        
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.putAll(responseData);
        out.print(jsonResponse.toString());
    }
    
    private Map<String, Object> actualizarEntrenador(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        PersonalTDao dao = new PersonalTDao();
        
        try {
            // Obtener datos del formulario
            int id = Integer.parseInt(request.getParameter("id"));
            String tipoId = request.getParameter("tipoId");
            String idPersona = request.getParameter("idPersona");
            String nom1 = request.getParameter("nom1");
            String nom2 = request.getParameter("nom2");
            String ape1 = request.getParameter("ape1");
            String ape2 = request.getParameter("ape2");
            
            // Validar que el número de identificación sea numérico
            try {
                Integer.parseInt(idPersona);
            } catch (NumberFormatException e) {
                result.put("success", false);
                result.put("message", "El número de identificación debe ser un valor numérico");
                return result;
            }
            
            // Validar que el teléfono sea numérico
            String telefono = request.getParameter("telefono");
            try {
                Long.parseLong(telefono);
            } catch (NumberFormatException e) {
                result.put("success", false);
                result.put("message", "El teléfono debe ser un valor numérico");
                return result;
            }
            
            // Convertir fecha de string a Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNac = null;
            try {
                String fechaParam = request.getParameter("fechaNac");
                if (fechaParam != null && !fechaParam.isEmpty()) {
                    fechaNac = dateFormat.parse(fechaParam);
                }
            } catch (ParseException e) {
                result.put("success", false);
                result.put("message", "Formato de fecha inválido");
                return result;
            }
            
            String direccion = request.getParameter("direccion");
            String email = request.getParameter("email");
            int genero = Integer.parseInt(request.getParameter("genero"));
            int eps = Integer.parseInt(request.getParameter("eps"));
            int rh = Integer.parseInt(request.getParameter("rh"));
            int rol = Integer.parseInt(request.getParameter("rol"));
            boolean activo = Boolean.parseBoolean(request.getParameter("activo"));
            
            // Aquí llamamos al método DAO que usa el procedimiento almacenado para actualizar los datos
            boolean actualizado = dao.actualizarEntrenador(id, tipoId, idPersona, nom1, nom2, ape1, ape2, 
                    fechaNac, direccion, telefono, email, genero, eps, rh, rol, activo);
            
            if (actualizado) {
                result.put("success", true);
                result.put("message", "Entrenador actualizado correctamente");
            } else {
                result.put("success", false);
                result.put("message", "No se pudo actualizar el entrenador");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Error al actualizar el entrenador: " + e.getMessage());
            e.printStackTrace();
        }
        
        return result;
    }
    
    private Map<String, Object> cargarEntrenadores() {
        Map<String, Object> result = new HashMap<>();
        PersonalTDao dao = new PersonalTDao();
        
        try {
            // Aquí llamaríamos al método DAO para obtener la lista de entrenadores
            result.put("success", true);
            result.put("entrenadores", dao.listarEntrenadores());
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Error al cargar los entrenadores: " + e.getMessage());
            e.printStackTrace();
        }
        
        return result;
    }
    
    private Map<String, Object> cambiarRol(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        PersonalTDao dao = new PersonalTDao();
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int nuevoRol = Integer.parseInt(request.getParameter("rol"));
            
            // Aquí llamaríamos al método DAO para cambiar el rol
            boolean cambiado = dao.cambiarRolEntrenador(id, nuevoRol);
            
            if (cambiado) {
                result.put("success", true);
                result.put("message", "Rol actualizado correctamente");
            } else {
                result.put("success", false);
                result.put("message", "No se pudo actualizar el rol");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Error al cambiar el rol: " + e.getMessage());
            e.printStackTrace();
        }
        
        return result;
    }
    
    private Map<String, Object> cambiarEstado(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        PersonalTDao dao = new PersonalTDao();
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean nuevoEstado = Boolean.parseBoolean(request.getParameter("activo"));
            
            // Aquí llamaríamos al método DAO para cambiar el estado
            boolean cambiado = dao.cambiarEstadoEntrenador(id, nuevoEstado);
            
            if (cambiado) {
                result.put("success", true);
                result.put("message", "Estado actualizado correctamente");
            } else {
                result.put("success", false);
                result.put("message", "No se pudo actualizar el estado");
            }
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Error al cambiar el estado: " + e.getMessage());
            e.printStackTrace();
        }
        
        return result;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para editar datos de entrenadores";
    }
}
