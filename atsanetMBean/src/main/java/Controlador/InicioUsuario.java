package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InicioUsuario")
public class InicioUsuario extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer tipoPersonal = (Integer) request.getSession().getAttribute("tipoPersonal");
        Boolean activo = (Boolean) request.getSession().getAttribute("persona_activa");
        if (tipoPersonal != null && activo != null && activo) {
            if (tipoPersonal == 1) {
                response.sendRedirect("/atsaNet/Vistas/1_inicioAdministrador.jsp");
            } else if (tipoPersonal == 2) {
                response.sendRedirect("/atsaNet/Vistas/2_inicioEntrenador.jsp");
            } else {
                response.sendRedirect("/atsaNet/Vistas/inicioSesion.jsp");
            }
        } else {
            response.sendRedirect("/atsaNet/Vistas/inicioSesion.jsp");
        }
    }
}
    

