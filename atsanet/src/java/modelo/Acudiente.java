/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

public class Acudiente {
    private int idacudiente;
    private int id;
    private String tipo_id;
    private String nom1_acudiente;
    private String nom2_acudiente;
    private String ape1_acudiente;
    private String ape2_acudiente;
    private long tel_acudiente;

    public Acudiente() {
    }
    
    public Acudiente(int idacudiente, int id, String tipo_id, String nom1_acudiente, String nom2_acudiente, String ape1_acudiente, String ape2_acudiente, long tel_acudiente) {
        this.idacudiente = idacudiente;
        this.id = id;
        this.tipo_id = tipo_id;
        this.nom1_acudiente = nom1_acudiente;
        this.nom2_acudiente = nom2_acudiente;
        this.ape1_acudiente = ape1_acudiente;
        this.ape2_acudiente = ape2_acudiente;
        this.tel_acudiente = tel_acudiente;
    }

    public int getIdacudiente() {
        return idacudiente;
    }

    public void setIdacudiente(int idacudiente) {
        this.idacudiente = idacudiente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo_id() {
        return tipo_id;
    }

    public void setTipo_id(String tipo_id) {
        this.tipo_id = tipo_id;
    }

    public String getNom1_acudiente() {
        return nom1_acudiente;
    }

    public void setNom1_acudiente(String nom1_acudiente) {
        this.nom1_acudiente = nom1_acudiente;
    }

    public String getNom2_acudiente() {
        return nom2_acudiente;
    }

    public void setNom2_acudiente(String nom2_acudiente) {
        this.nom2_acudiente = nom2_acudiente;
    }

    public String getApe1_acudiente() {
        return ape1_acudiente;
    }

    public void setApe1_acudiente(String ape1_acudiente) {
        this.ape1_acudiente = ape1_acudiente;
    }

    public String getApe2_acudiente() {
        return ape2_acudiente;
    }

    public void setApe2_acudiente(String ape2_acudiente) {
        this.ape2_acudiente = ape2_acudiente;
    }

    public long getTel_acudiente() {
        return tel_acudiente;
    }

    public void setTel_acudiente(long tel_acudiente) {
        this.tel_acudiente = tel_acudiente;
    } 
}
