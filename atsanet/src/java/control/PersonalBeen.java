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
            String sql = "SELECT "
                    + "p.id, p.id_persona, p.tipo_id, p.nom1_persona, p.nom2_persona, p.ape1_persona, p.ape2_persona, "
                    + "p.fecha_nacimiento, p.edad_persona, p.direc_persona, p.tel_persona, p.email_persona, p.fk_genero, "
                    + "p.fk_eps, p.fk_rh, pt.fk_persona, pt.contrasena, pt.fk_tipo_personal, pt.persona_activa, "
                    + "tp.nom_tipo_per "
                    + "FROM persona p "
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
            FacesContext.getCurrentInstance().getExternalContext().redirect("index.xhtml");
        } catch (IOException ex) {
        }
    }

    public void verifSesion() {
        String nom = (String) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("user");

        if (nom == null) {
            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("noacceso.xhtml");
            } catch (IOException ex) {
            }
        }
    }

}
