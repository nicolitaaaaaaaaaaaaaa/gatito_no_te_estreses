package Modelo;

public class ReporteGrupal {
    private int idAlumno;
    private String nombreCompleto;
    private int totalEntrenamientos;
    private int totalAsistencias;
    private double porcentajeAsistencia;
    private int totalObjetivosCumplidos;
    private double porcentajeObjetivos;
    
    public ReporteGrupal() {}
    
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
    
    public int getTotalEntrenamientos() { 
        return totalEntrenamientos; 
    }
    
    public void setTotalEntrenamientos(int totalEntrenamientos) { 
        this.totalEntrenamientos = totalEntrenamientos; 
    }
    
    public int getTotalAsistencias() { 
        return totalAsistencias; 
    }
    
    public void setTotalAsistencias(int totalAsistencias) { 
        this.totalAsistencias = totalAsistencias; 
    }
    
    public double getPorcentajeAsistencia() { 
        return porcentajeAsistencia; 
    }
    
    public void setPorcentajeAsistencia(double porcentajeAsistencia) { 
        this.porcentajeAsistencia = porcentajeAsistencia; 
    }
    
    public int getTotalObjetivosCumplidos() { 
        return totalObjetivosCumplidos; 
    }
    
    public void setTotalObjetivosCumplidos(int totalObjetivosCumplidos) { 
        this.totalObjetivosCumplidos = totalObjetivosCumplidos; 
    }
    
    public double getPorcentajeObjetivos() { 
        return porcentajeObjetivos; 
    }
    
    public void setPorcentajeObjetivos(double porcentajeObjetivos) { 
        this.porcentajeObjetivos = porcentajeObjetivos; 
    }
}
