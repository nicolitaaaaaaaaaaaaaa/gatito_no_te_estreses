/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import java.util.Date;

public class Alumno extends Persona {
    private int fk_persona_alumno;
    private String talla;
    private byte calzado;
    private String pie_domi;
    private int fk_acudiente;
    private String parentesco;
    private int fk_posicion;
    private String foto;
    private String leyDatos;
    private String autoMedica;
    private String certificaEps;
    private boolean estado_alumno;
    private boolean postulante;
    
    private Acudiente acudiente;
    private Matricula matricula;
    private Posicion posicion;

    public Posicion getPosicion() {
        return posicion;
    }
    public void setPosicion(Posicion posicion) {
        this.posicion = posicion;
    }
    
    public Matricula getMatricula() {
        return matricula;
    }
    public void setMatricula(Matricula matricula) {
        this.matricula = matricula;
    }
    public Acudiente getAcudiente() {
        return acudiente;
    }
    public void setAcudiente(Acudiente acudiente) {
        this.acudiente = acudiente;
    }
    
    public Alumno() {
        super();
    }

    public Alumno(int fk_persona_alumno, String talla, byte calzado, String pie_domi, int fk_acudiente, String parentesco, int fk_posicion, String foto, String leyDatos, String autoMedica, String certificaEps, boolean estado_alumno, boolean postulante, Acudiente acudiente, Matricula matricula, Posicion posicion, Categoria categoria) {
        this.fk_persona_alumno = fk_persona_alumno;
        this.talla = talla;
        this.calzado = calzado;
        this.pie_domi = pie_domi;
        this.fk_acudiente = fk_acudiente;
        this.parentesco = parentesco;
        this.fk_posicion = fk_posicion;
        this.foto = foto;
        this.leyDatos = leyDatos;
        this.autoMedica = autoMedica;
        this.certificaEps = certificaEps;
        this.estado_alumno = estado_alumno;
        this.postulante = postulante;
        this.acudiente = acudiente;
        this.matricula = matricula;
        this.posicion = posicion;
    }

    public Alumno(int fk_persona_alumno, String talla, byte calzado, String pie_domi, int fk_acudiente, String parentesco, int fk_posicion, String foto, String leyDatos, String autoMedica, String certificaEps, boolean estado_alumno, boolean postulante, Acudiente acudiente, Matricula matricula, Posicion posicion, Categoria categoria, int id, int id_persona, String tipo_Id, String nom1_persona, String nom2_persona, String ape1_persona, String ape2_persona, Date fecha_nacimiento, String direc_persona, long tel_persona, String email_persona, int fk_genero, int fk_eps, int fk_rh, Genero genero, Eps eps, Rh rh) {
        super(id, id_persona, tipo_Id, nom1_persona, nom2_persona, ape1_persona, ape2_persona, fecha_nacimiento, direc_persona, tel_persona, email_persona, fk_genero, fk_eps, fk_rh, genero, eps, rh);
        this.fk_persona_alumno = fk_persona_alumno;
        this.talla = talla;
        this.calzado = calzado;
        this.pie_domi = pie_domi;
        this.fk_acudiente = fk_acudiente;
        this.parentesco = parentesco;
        this.fk_posicion = fk_posicion;
        this.foto = foto;
        this.leyDatos = leyDatos;
        this.autoMedica = autoMedica;
        this.certificaEps = certificaEps;
        this.estado_alumno = estado_alumno;
        this.postulante = postulante;
        this.acudiente = acudiente;
        this.matricula = matricula;
        this.posicion = posicion;
    }

    public int getFk_persona_alumno() {
        return fk_persona_alumno;
    }

    public void setFk_persona_alumno(int fk_persona_alumno) {
        this.fk_persona_alumno = fk_persona_alumno;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public byte getCalzado() {
        return calzado;
    }

    public void setCalzado(byte calzado) {
        this.calzado = calzado;
    }

    public String getPie_domi() {
        return pie_domi;
    }

    public void setPie_domi(String pie_domi) {
        this.pie_domi = pie_domi;
    }

    public int getFk_acudiente() {
        return fk_acudiente;
    }

    public void setFk_acudiente(int fk_acudiente) {
        this.fk_acudiente = fk_acudiente;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public int getFk_posicion() {
        return fk_posicion;
    }

    public void setFk_posicion(int fk_posicion) {
        this.fk_posicion = fk_posicion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getLeyDatos() {
        return leyDatos;
    }

    public void setLeyDatos(String leyDatos) {
        this.leyDatos = leyDatos;
    }

    public String getAutoMedica() {
        return autoMedica;
    }

    public void setAutoMedica(String autoMedica) {
        this.autoMedica = autoMedica;
    }

    public String getCertificaEps() {
        return certificaEps;
    }

    public void setCertificaEps(String certificaEps) {
        this.certificaEps = certificaEps;
    }

    public boolean isEstado_alumno() {
        return estado_alumno;
    }

    public void setEstado_alumno(boolean estado_alumno) {
        this.estado_alumno = estado_alumno;
    }

    public boolean isPostulante() {
        return postulante;
    }

    public void setPostulante(boolean postulante) {
        this.postulante = postulante;
    }

    
}
