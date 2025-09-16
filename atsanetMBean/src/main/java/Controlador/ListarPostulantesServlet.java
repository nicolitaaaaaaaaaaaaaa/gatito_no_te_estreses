package Controlador;

import Modelo.PersonalTDao;
import Modelo.Personal_t;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ListarPostulantesServlet", urlPatterns = {"/ListarPostulantesServlet"})
public class ListarPostulantesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PersonalTDao dao = new PersonalTDao();
        
        // Cargar postulantes
        List<Personal_t> postulantes = dao.listarPostulantes();
        request.setAttribute("postulantes", postulantes);
        
        // Cargar entrenadores
        List<Personal_t> entrenadores = dao.listarEntrenadores();
        request.setAttribute("entrenadores", entrenadores);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Vistas/gestionEntrenadores.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("aceptarPostulante".equals(action)) {
            try {
                int fk_persona = Integer.parseInt(request.getParameter("fk_persona"));
                PersonalTDao dao = new PersonalTDao();
                boolean resultado = dao.aceptarPostulante(fk_persona);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                
                String jsonResponse = "{\"success\":" + resultado + "}";
                response.getWriter().write(jsonResponse);
                return;
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\":\"ID de persona inválido\"}");
                return;
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }
        } else if ("rechazarPostulante".equals(action)) {
            try {
                int fk_persona = Integer.parseInt(request.getParameter("fk_persona"));
                PersonalTDao dao = new PersonalTDao();
                boolean resultado = dao.rechazarPostulante(fk_persona);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                
                String jsonResponse = "{\"success\":" + resultado + "}";
                response.getWriter().write(jsonResponse);
                return;
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\":\"ID de persona inválido\"}");
                return;
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
                return;
            }
        } else {
            doGet(request, response);
        }
    }
}
