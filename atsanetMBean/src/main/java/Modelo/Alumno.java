package Modelo;

public class Alumno {
    private int idAlumno;
    private String nombreCompleto;
    
    public Alumno() {}
    
    public Alumno(int idAlumno, String nombreCompleto) {
        this.idAlumno = idAlumno;
        this.nombreCompleto = nombreCompleto;
    }
    
    // Getters y Setters
    public int getIdAlumno() { 
        return idAlumno; 
    }
    
    public void setIdAlumno(int idAlumno) { 
        this.idAlumno = idAlumno; 
    }
    
    public String getNombreCompleto() { 
        return nombreCompleto; 
    }
    
    public void setNombreCompleto(String nombreCompleto) { 
        this.nombreCompleto = nombreCompleto; 
    }
}
