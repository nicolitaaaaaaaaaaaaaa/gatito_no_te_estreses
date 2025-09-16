
package modelo;

import java.sql.Date;

public class Personal_t extends Persona{
    private int fk_persona;
    private String contrasena;
    private int fk_tipo_personal;
    private boolean persona_activa;

    public Personal_t(){
        super();
    }

    public Personal_t(int fk_persona, String contrasena, int fk_tipo_personal, boolean persona_activa, int id, int id_persona, String tipo_Id, String nom1_persona, String nom2_persona, String ape1_persona, String ape2_persona, Date fecha_nacimiento, int edad_persona, String direc_persona, long tel_persona, String email_persona, int fk_genero, int fk_eps, int fk_rh) {
        super(id, id_persona, tipo_Id, nom1_persona, nom2_persona, ape1_persona, ape2_persona, fecha_nacimiento, edad_persona, direc_persona, tel_persona, email_persona, fk_genero, fk_eps, fk_rh);
        this.fk_persona = fk_persona;
        this.contrasena = contrasena;
        this.fk_tipo_personal = fk_tipo_personal;
        this.persona_activa = persona_activa;
    }
    
    public int getFk_persona() {
        return fk_persona;
    }

    public void setFk_persona(int fk_persona) {
        this.fk_persona = fk_persona;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getFk_tipo_personal() {
        return fk_tipo_personal;
    }

    public void setFk_tipo_personal(int fk_tipo_personal) {
        this.fk_tipo_personal = fk_tipo_personal;
    }

    public boolean isPersona_activa() {
        return persona_activa;
    }

    public void setPersona_activa(boolean persona_activa) {
        this.persona_activa = persona_activa;
    }
}
