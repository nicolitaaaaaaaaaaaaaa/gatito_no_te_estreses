/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;
import dao.AlumnoDAO;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import modelo.Alumno;

@ManagedBean
@ViewScoped
public class AlumnoBeen implements Serializable{
    private final AlumnoDAO alumnoDAO = new AlumnoDAO();
    private List<Alumno> lstPostulante = new ArrayList<>();
    private List<Alumno> lstMatricula = new ArrayList<>();
    private List<Alumno> lstAfiltrados = new ArrayList<>();
    private Alumno alumno = new Alumno();
    private String filtroAlumno;

    public String calcularEdad(){
        if (alumno.getFecha_nacimiento() == null){
            return "";
        }
        
        LocalDate fechaN = alumno.getFecha_nacimiento().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int edad = Period.between(fechaN, LocalDate.now()).getYears();

        return String.valueOf(edad);
    }

    public String estado(Alumno alu){
        if(alu.isPostulante() == false){
            return "matriculado";
        }else{
            return "No es parte del club";
        }
    }
    
    public void filtrarAlumnos(){
        if(filtroAlumno == null || filtroAlumno.isEmpty()){
            lstAfiltrados = new ArrayList<>(lstMatricula);
        }else{
            lstAfiltrados = lstMatricula.stream()
                .filter(a -> a.getId_persona() == Integer.parseInt(filtroAlumno))
                .collect(Collectors.toList());
        }
    }
    
    public void agregar(){
        alumnoDAO.agregarAspirante(alumno);
    }
    
    public void listarPostu(){
        lstPostulante = alumnoDAO.listarPostulantes();
    }
    
    public void listarMatri(){
        lstMatricula = alumnoDAO.listarMatricula();
        System.out.print(lstMatricula);
    }

    public void buscarPostu(Alumno a){
        alumno = alumnoDAO.buscarPostulane(a);
    }
    
    public void buscarMatri(Alumno a){
        alumno = alumnoDAO.buscarMatriculado(a);  
    }
    
    public void actualizarMatri(){
        alumnoDAO.actualizarMatriculado(alumno);
    }
    
    public void suspenderMatri(Alumno a){
        alumnoDAO.suspenderMatricula(a);
    }
    
    public void aceptarPostu(Alumno a){
        alumnoDAO.aceptarPostulante(a);
    }
    
    public void rechazarPostu(Alumno a){
        alumnoDAO.rechazarPostulante(a);
    }
    

    //GETTERS AND SETTER ----------------------
    public List<Alumno> getLstPostulante() {
        return lstPostulante;
    }

    public void setLstPostulante(List<Alumno> lstPostulante) {
        this.lstPostulante = lstPostulante;
    }

    public List<Alumno> getLstMatricula() {
        return lstMatricula;
    }
    
    public void setLstMatricula(List<Alumno> lstMatricula) {
        this.lstMatricula = lstMatricula;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }  

    public String getFiltroAlumno() {
        return filtroAlumno;
    }

    public void setFiltroAlumno(String filtroAlumno) {
        this.filtroAlumno = filtroAlumno;
    }

    public List<Alumno> getLstAfiltrados() {
        return lstAfiltrados;
    }

    public void setLstAfiltrados(List<Alumno> lstAfiltrados) {
        this.lstAfiltrados = lstAfiltrados;
    }
    
    
    
    
}
