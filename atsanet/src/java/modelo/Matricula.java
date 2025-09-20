/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;
import java.sql.Timestamp;


public class Matricula {
    private int idmatricula;
    private Timestamp fecha_inicio;
    private int fk_alumno;
    private Date fecha_ven_carnet;
    private int fk_categoria;

    public Matricula() {
    }

    public Matricula(int idmatricula, Timestamp fecha_inicio, int fk_alumno, Date fecha_ven_carnet, int fk_categoria) {
        this.idmatricula = idmatricula;
        this.fecha_inicio = fecha_inicio;
        this.fk_alumno = fk_alumno;
        this.fecha_ven_carnet = fecha_ven_carnet;
        this.fk_categoria = fk_categoria;
    }

    public int getIdmatricula() {
        return idmatricula;
    }

    public void setIdmatricula(int idmatricula) {
        this.idmatricula = idmatricula;
    }

    public Timestamp getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Timestamp fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public int getFk_alumno() {
        return fk_alumno;
    }

    public void setFk_alumno(int fk_alumno) {
        this.fk_alumno = fk_alumno;
    }

    public Date getFecha_ven_carnet() {
        return fecha_ven_carnet;
    }

    public void setFecha_ven_carnet(Date fecha_ven_carnet) {
        this.fecha_ven_carnet = fecha_ven_carnet;
    }

    public int getFk_categoria() {
        return fk_categoria;
    }

    public void setFk_categoria(int fk_categoria) {
        this.fk_categoria = fk_categoria;
    }
    
    

   
    
    
}
