package Modelo;

import java.sql.Time;

public class Jornada {
    private int idjornada;
    private String dia_semana;
    private Time hora_jornada;

    // Constructor vacío
    public Jornada() {
    }

    
    public Jornada(int idjornada, String dia_semana, Time hora_jornada) {
        this.idjornada = idjornada;
        this.dia_semana = dia_semana;
        this.hora_jornada = hora_jornada;
    }

    // Getters y Setters
    public int getIdjornada() {
        return idjornada;
    }

    public void setIdjornada(int idjornada) {
        this.idjornada = idjornada;
    }

    public String getDia_semana() {
        return dia_semana;
    }

    public void setDia_semana(String dia_semana) {
        this.dia_semana = dia_semana;
    }

    public java.sql.Time getHora_jornada() {
        return hora_jornada;
    }

    public void setHora_jornada(java.sql.Time hora_jornada) {
        this.hora_jornada = hora_jornada;
    }

    @Override
    public String toString() {
        return "Jornada{" +
                "idjornada=" + idjornada +
                ", dia_semana='" + dia_semana + '\'' +
                ", hora_jornada=" + hora_jornada +
                '}';
    }
}
