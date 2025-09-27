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
import modelo.Posicion;

@ManagedBean
@ViewScoped
public class AlumnoBeen implements Serializable{
    private final AlumnoDAO alumnoDAO = new AlumnoDAO();
    private List<Alumno> lstPostulante = new ArrayList<>();
    private List<Alumno> lstMatricula = new ArrayList<>();
    private List<Alumno> lstAfiltrados = new ArrayList<>();
    private List<Posicion> lstPosicion = new ArrayList<>();
    
    private Posicion posicion = new Posicion();
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
            return "Matriculado";
        }else{
            return "Postulante";
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
    
    public void agregarPostulante(){
        alumnoDAO.agregarAspirante(alumno);
    }
    
    public void listarPostulantes(){
        lstPostulante = alumnoDAO.listarPostulantes();
    }
    
    public void listarMatriculados(){
        lstMatricula = alumnoDAO.listarMatricula();
    }
    
    public void listarPosicion(){
        lstPosicion = alumnoDAO.listarPosiciones();
    }
    
    public void buscarPosicion(Posicion p){
        posicion = alumnoDAO.buscarPosicion(p);
    }

    public void buscarPostulantes(Alumno a){
        alumno = alumnoDAO.buscarPostulane(a);
    }
    
    public void buscarAlumno(Alumno a){
        alumno = alumnoDAO.buscarMatriculado(a);  
    }
    
    public void actualizarAlumno(){
        alumnoDAO.actualizarMatriculado(alumno);
    }
    
    public void suspenderAlumno(Alumno a){
        alumnoDAO.suspenderMatricula(a);
    }
    
    public void aceptarPostulante(Alumno a){
        alumnoDAO.aceptarPostulante(a);
    }
    
    public void rechazarPostulante(Alumno a){
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

    public List<Posicion> getLstPosicion() {
        return lstPosicion;
    }

    public void setLstPosicion(List<Posicion> lstPosicion) {
        this.lstPosicion = lstPosicion;
    }

    public Posicion getPosicion() {
        return posicion;
    }

    public void setPosicion(Posicion posicion) {
        this.posicion = posicion;
    }
    
}
