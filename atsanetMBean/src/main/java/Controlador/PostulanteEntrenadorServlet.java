package Controlador;

import Modelo.PersonalTDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/PostulanteEntrenadorServlet")
public class PostulanteEntrenadorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recoger todos los parámetros del formulario
        String tipo_id = request.getParameter("tipo_id");
        String id_persona = request.getParameter("id_persona");
        String nom1_persona = request.getParameter("nom1_persona");
        String nom2_persona = request.getParameter("nom2_persona");
        String ape1_persona = request.getParameter("ape1_persona");
        String ape2_persona = request.getParameter("ape2_persona");
        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
        String direc_persona = request.getParameter("direc_persona");
        String tel_persona = request.getParameter("tel_persona");
        String email_persona = request.getParameter("email_persona");
        String fk_genero = request.getParameter("fk_genero");
        String fk_eps = request.getParameter("fk_eps");
        String fk_rh = request.getParameter("fk_rh");
        String contrasena = request.getParameter("contrasena");

        // Validar que todos los campos requeridos estén presentes
        if (tipo_id == null || id_persona == null || nom1_persona == null || 
            ape1_persona == null || fecha_nacimiento == null || direc_persona == null ||
            tel_persona == null || email_persona == null || fk_genero == null ||
            fk_eps == null || fk_rh == null || contrasena == null) {
            request.setAttribute("mensaje", "Error: Faltan campos requeridos en el formulario");
            request.getRequestDispatcher("Vistas/formularioEntrenador.jsp").forward(request, response);
            return;
        }

        String mensaje;
        try {
            PersonalTDao dao = new PersonalTDao();
            boolean exito = dao.addpostulante(tipo_id, id_persona, nom1_persona, nom2_persona, ape1_persona, ape2_persona, fecha_nacimiento, direc_persona, tel_persona, email_persona, fk_genero, fk_eps, fk_rh, contrasena);
            if (exito) {
                mensaje = "Registro exitoso. Tu postulación ha sido enviada y será revisada por el administrador.";
            } else {
                mensaje = "Error al registrar postulante. Verifica que el número de identificación no esté ya registrado.";
            }
        } catch (Exception e) {
            mensaje = "Error del sistema: " + e.getMessage();
            System.err.println("Error en PostulanteEntrenadorServlet: " + e.getMessage());
            e.printStackTrace();
        }
        request.setAttribute("mensaje", mensaje);
        request.getRequestDispatcher("Vistas/formularioEntrenador.jsp").forward(request, response);
    }
}
