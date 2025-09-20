/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;
import dao.AlumnoDAO;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import modelo.Alumno;

@ManagedBean
@ApplicationScoped
public class AlumnoBeen {
    private final AlumnoDAO alumnoDAO = new AlumnoDAO();
    private List<Alumno> lstAlumno = new ArrayList<>();
    private Alumno alumno = new Alumno();

    public void listar(){
        lstAlumno = alumnoDAO.listarPostulantes();
    }
    
    public void agregar(){
        alumnoDAO.agregarAspirante(alumno);
    }
    
    public void buscar(Alumno a){
        alumno = alumnoDAO.buscarMatriculado(a);  
    }
    
    public void actualizar(){
        alumnoDAO.actualizarMatriculado(alumno);
    }
    
    public void suspender(Alumno a){
        alumnoDAO.suspender(a);
    }
    
    //GETTERS AND SETTER
    public List<Alumno> getLstAlumno() {
        return lstAlumno;
    }

    public void setLstAlumno(List<Alumno> lstAlumno) {
        this.lstAlumno = lstAlumno;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }
   
}
