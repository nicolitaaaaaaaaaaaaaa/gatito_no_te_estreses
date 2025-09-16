package Modelo;

public class ReporteIndividual {
    private String fechaEntrenamiento;
    private String asistencia;
    private String tipoEntrenamiento;
    private String objetivoCumplido;
    private String observaciones;
    private String nombreCompleto;
    
    public ReporteIndividual() {}
    
    // Getters y Setters
    public String getFechaEntrenamiento() { 
        return fechaEntrenamiento; 
    }
    
    public void setFechaEntrenamiento(String fechaEntrenamiento) { 
        this.fechaEntrenamiento = fechaEntrenamiento; 
    }
    
    public String getAsistencia() { 
        return asistencia; 
    }
    
    public void setAsistencia(String asistencia) { 
        this.asistencia = asistencia; 
    }
    
    public String getTipoEntrenamiento() { 
        return tipoEntrenamiento; 
    }
    
    public void setTipoEntrenamiento(String tipoEntrenamiento) { 
        this.tipoEntrenamiento = tipoEntrenamiento; 
    }
    
    public String getObjetivoCumplido() { 
        return objetivoCumplido; 
    }
    
    public void setObjetivoCumplido(String objetivoCumplido) { 
        this.objetivoCumplido = objetivoCumplido; 
    }
    
    public String getObservaciones() { 
        return observaciones; 
    }
    
    public void setObservaciones(String observaciones) { 
        this.observaciones = observaciones; 
    }
    
    public String getNombreCompleto() { 
        return nombreCompleto; 
    }
    
    public void setNombreCompleto(String nombreCompleto) { 
        this.nombreCompleto = nombreCompleto; 
    }
}
