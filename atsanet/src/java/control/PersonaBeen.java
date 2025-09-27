/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import dao.PersonaDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import modelo.Eps;
import modelo.Genero;
import modelo.Rh;

@ManagedBean
@ViewScoped
public class PersonaBeen implements Serializable {
    private final PersonaDAO persoDAO = new PersonaDAO();
    private List<Genero> lstGenero = new ArrayList<>();
    private List<Rh> lstRh = new ArrayList<>();
    private List<Eps> lstEps = new ArrayList<>();
    
    private Genero genero = new Genero();
    private Rh rh = new Rh();
    private Eps eps = new Eps();
    
    public void listarGenero(){
        lstGenero = persoDAO.listarGenero();   
    }
    
    public void listarRh(){
        lstRh = persoDAO.listarRh();
    }
    
    public void listarEps(){
        lstEps = persoDAO.listarEps(); 
    }
    
    public void buscarGenero(Genero g){
        genero = persoDAO.buscarGenero(g);
    }
    
    public void buscarRh(Rh r){
        rh = persoDAO.buscarRh(rh); 
    }
    
    public void buscarEps(Eps e){
        eps = persoDAO.buscarEps(e);
    }



    //getters and setters
    
    public List<Genero> getLstGenero() {
        return lstGenero;
    }
    
    public void setLstGenero(List<Genero> lstGenero) {
        this.lstGenero = lstGenero;
    }

    public List<Rh> getLstRh() {
        return lstRh;
    }

    public void setLstRh(List<Rh> lstRh) {
        this.lstRh = lstRh;
    }

    public List<Eps> getLstEps() {
        return lstEps;
    }

    public void setLstEps(List<Eps> lstEps) {
        this.lstEps = lstEps;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Rh getRh() {
        return rh;
    }

    public void setRh(Rh rh) {
        this.rh = rh;
    }

    public Eps getEps() {
        return eps;
    }

    public void setEps(Eps eps) {
        this.eps = eps;
    }
    
    
    
   
    
}
