package Controlador;

import Modelo.PersonalTDao;
import Modelo.Personal_t;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.HashUtil;


import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ValidarPersonalT")
public class ValidarPersonalT extends HttpServlet {

    PersonalTDao pt_dao = new PersonalTDao();
    Personal_t pt = new Personal_t();

    public ValidarPersonalT() {
        super();
    } 

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("/atsaNet/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("action");
        if (accion != null && accion.equalsIgnoreCase("validar")) {
            String id_persona = request.getParameter("cedula");
            String password_personal_t = request.getParameter("pass");

            try {
                String hashedPassword = HashUtil.hashPassword(password_personal_t);
                this.pt = this.pt_dao.Validar(Integer.parseInt(id_persona), hashedPassword);
            } catch (Exception var7) { 
                Logger.getLogger(ValidarPersonalT.class.getName()).log(Level.SEVERE, null, var7);
            }
            if (this.pt.getId_persona() != 0 && this.pt.getContrasena() != null) {
                request.getSession().setAttribute("nombre1", this.pt.getNom1_persona());
                request.getSession().setAttribute("apellido1", this.pt.getApe1_persona());
                request.getSession().setAttribute("tipoPersonal", this.pt.getFk_tipo_personal());
                request.getSession().setAttribute("persona_activa", this.pt.isPersona_activa());
                if (this.pt.isPersona_activa() == true && this.pt.getFk_tipo_personal() == 1) {
                    request.setAttribute("personalT", this.pt);
                    request.getRequestDispatcher("Vistas/1_inicioAdministrador.jsp").forward(request, response);
                } else if (this.pt.isPersona_activa() == true && this.pt.getFk_tipo_personal() == 2) {
                    request.setAttribute("personalT", this.pt);
                    request.getRequestDispatcher("Vistas/2_inicioEntrenador.jsp").forward(request, response);
                }else {
                    request.setAttribute("fail", "Usuario inactivo");
                    request.getRequestDispatcher("Vistas/inicioSesion.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("fail", "Usuario o Contraseña incorrectos, intente nuevamente");
                request.getRequestDispatcher("Vistas/inicioSesion.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("fail", "Ingrese Correo y Contraseña");
            request.getRequestDispatcher("Vistas/inicioSesion.jsp").forward(request, response);
        }
    }

   

}