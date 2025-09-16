
package modelo;

import java.sql.Date;

public class Persona {
    private int id;
    private int id_persona;
    private String tipo_Id;
    private String nom1_persona;
    private String nom2_persona;
    private String ape1_persona;
    private String ape2_persona;
    private Date fecha_nacimiento;
    private int edad_persona;
    private String direc_persona;
    private long tel_persona;
    private String email_persona;
    private int fk_genero;
    private int fk_eps;
    private int fk_rh;

    public Persona() {
    }

    public Persona(int id, int id_persona, String tipo_Id, String nom1_persona, String nom2_persona, String ape1_persona, String ape2_persona, Date fecha_nacimiento, int edad_persona, String direc_persona, long tel_persona, String email_persona, int fk_genero, int fk_eps, int fk_rh) {
        this.id = id;
        this.id_persona = id_persona;
        this.tipo_Id = tipo_Id;
        this.nom1_persona = nom1_persona;
        this.nom2_persona = nom2_persona;
        this.ape1_persona = ape1_persona;
        this.ape2_persona = ape2_persona;
        this.fecha_nacimiento = fecha_nacimiento;
        this.edad_persona = edad_persona;
        this.direc_persona = direc_persona;
        this.tel_persona = tel_persona;
        this.email_persona = email_persona;
        this.fk_genero = fk_genero;
        this.fk_eps = fk_eps;
        this.fk_rh = fk_rh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getTipo_Id() {
        return tipo_Id;
    }

    public void setTipo_Id(String tipo_Id) {
        this.tipo_Id = tipo_Id;
    }

    public String getNom1_persona() {
        return nom1_persona;
    }

    public void setNom1_persona(String nom1_persona) {
        this.nom1_persona = nom1_persona;
    }

    public String getNom2_persona() {
        return nom2_persona;
    }

    public void setNom2_persona(String nom2_persona) {
        this.nom2_persona = nom2_persona;
    }

    public String getApe1_persona() {
        return ape1_persona;
    }

    public void setApe1_persona(String ape1_persona) {
        this.ape1_persona = ape1_persona;
    }

    public String getApe2_persona() {
        return ape2_persona;
    }

    public void setApe2_persona(String ape2_persona) {
        this.ape2_persona = ape2_persona;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getEdad_persona() {
        return edad_persona;
    }

    public void setEdad_persona(int edad_persona) {
        this.edad_persona = edad_persona;
    }

    public String getDirec_persona() {
        return direc_persona;
    }

    public void setDirec_persona(String direc_persona) {
        this.direc_persona = direc_persona;
    }

    public long getTel_persona() {
        return tel_persona;
    }

    public void setTel_persona(long tel_persona) {
        this.tel_persona = tel_persona;
    }

    public String getEmail_persona() {
        return email_persona;
    }

    public void setEmail_persona(String email_persona) {
        this.email_persona = email_persona;
    }

    public int getFk_genero() {
        return fk_genero;
    }

    public void setFk_genero(int fk_genero) {
        this.fk_genero = fk_genero;
    }

    public int getFk_eps() {
        return fk_eps;
    }

    public void setFk_eps(int fk_eps) {
        this.fk_eps = fk_eps;
    }

    public int getFk_rh() {
        return fk_rh;
    }

    public void setFk_rh(int fk_rh) {
        this.fk_rh = fk_rh;
    }

    
    
    
    
}
