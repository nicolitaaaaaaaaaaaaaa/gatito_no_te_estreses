/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import modelo.Personal_t;

@ManagedBean
@SessionScoped
public class PersonalBeen implements Serializable {
    Personal_t personal = new Personal_t();

    public Personal_t getPersonal() {
        return personal;
    }

    public void setPersonal(Personal_t personal) {
        this.personal = personal;
    }

    public void autenticar() throws Exception {
        try (Connection con = ConnBD.conectar()) {
            String sql = "SELECT * FROM persona p "
                    + "INNER JOIN personal_t pt ON p.id = pt.fk_persona "
                    + "INNER JOIN tipo_personal tp ON pt.fk_tipo_personal = tp.idtipopersonal "
                    + "WHERE p.id_persona = ? AND pt.contrasena = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, personal.getId_persona());

            String pass = Utilidades.hash(personal.getContrasena());
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                personal.setNom1_persona(rs.getString("nom1_persona"));
                boolean activo = rs.getBoolean("persona_activa");

                if (!activo) {
                    FacesContext.getCurrentInstance().addMessage(null,
                            new FacesMessage(FacesMessage.SEVERITY_WARN,
                                    "Aviso", "El usuario está desactivado"));
                    return; 
                }

                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("user", rs.getString("nom1_persona"));

                if (rs.getString("fk_tipo_personal").equals("1")) {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("admi.xhtml");
                } else {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("entre.xhtml");
                }
            } else {
                FacesContext.getCurrentInstance().addMessage(null,
                    new FacesMessage(FacesMessage.SEVERITY_WARN, "Aviso", "Id de Usuario y/o Contraseña no válidos"));
            }
        } catch (SQLException | IOException e) {  
            FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_FATAL, "Error", "Error en Conexión a Base de Datos"));
        }
    }

    public void cerrarSesion() {
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().clear();
        try {
            String contextPath = FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath();
            FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/faces/index.xhtml?faces-redirect=true");
        } catch (IOException ex) {
        }
    }

    public void verifSesion() {
        String nom = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("user");

        if (nom == null) {
            try {
                String contextPath = FacesContext.getCurrentInstance().getExternalContext().getRequestContextPath();
                FacesContext.getCurrentInstance().getExternalContext().redirect(contextPath + "/faces/index.xhtml?faces-redirect=true");
            } catch (IOException ex) {
            }
        }
    }

}
