/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;

public class Alumno extends Persona {
    private int fkPersonaAlumno;
    private String talla;
    private byte calzado;
    private String pieDomi;
    private int fkAcudiente;
    private String parentesco;
    private int fkPosicion;
    private String foto;
    private Date fechaVenCarnet;
    private int fkCategoria;
    private String leyDatos;
    private String autoMedica;
    private String certificaEps;
    private boolean estadoAlumno;

    public Alumno() {
        super();
    }

    public Alumno(int fkPersonaAlumno, String talla, byte calzado, String pieDomi, int fkAcudiente, String parentesco, int fkPosicion, String foto, Date fechaVenCarnet, int fkCategoria, String leyDatos, String autoMedica, String certificaEps, boolean estadoAlumno, int id, int id_persona, String tipo_Id, String nom1_persona, String nom2_persona, String ape1_persona, String ape2_persona, Date fecha_nacimiento, int edad_persona, String direc_persona, long tel_persona, String email_persona, int fk_genero, int fk_eps, int fk_rh) {
        super(id, id_persona, tipo_Id, nom1_persona, nom2_persona, ape1_persona, ape2_persona, fecha_nacimiento, edad_persona, direc_persona, tel_persona, email_persona, fk_genero, fk_eps, fk_rh);
        this.fkPersonaAlumno = fkPersonaAlumno;
        this.talla = talla;
        this.calzado = calzado;
        this.pieDomi = pieDomi;
        this.fkAcudiente = fkAcudiente;
        this.parentesco = parentesco;
        this.fkPosicion = fkPosicion;
        this.foto = foto;
        this.fechaVenCarnet = fechaVenCarnet;
        this.fkCategoria = fkCategoria;
        this.leyDatos = leyDatos;
        this.autoMedica = autoMedica;
        this.certificaEps = certificaEps;
        this.estadoAlumno = estadoAlumno;
    }

    public int getFkPersonaAlumno() {
        return fkPersonaAlumno;
    }

    public void setFkPersonaAlumno(int fkPersonaAlumno) {
        this.fkPersonaAlumno = fkPersonaAlumno;
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

    public String getPieDomi() {
        return pieDomi;
    }

    public void setPieDomi(String pieDomi) {
        this.pieDomi = pieDomi;
    }

    public int getFkAcudiente() {
        return fkAcudiente;
    }

    public void setFkAcudiente(int fkAcudiente) {
        this.fkAcudiente = fkAcudiente;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public int getFkPosicion() {
        return fkPosicion;
    }

    public void setFkPosicion(int fkPosicion) {
        this.fkPosicion = fkPosicion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Date getFechaVenCarnet() {
        return fechaVenCarnet;
    }

    public void setFechaVenCarnet(Date fechaVenCarnet) {
        this.fechaVenCarnet = fechaVenCarnet;
    }

    public int getFkCategoria() {
        return fkCategoria;
    }

    public void setFkCategoria(int fkCategoria) {
        this.fkCategoria = fkCategoria;
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

    public boolean isEstadoAlumno() {
        return estadoAlumno;
    }

    public void setEstadoAlumno(boolean estadoAlumno) {
        this.estadoAlumno = estadoAlumno;
    }
    
    
    
    
    
    
  
   

   
    
    
}
