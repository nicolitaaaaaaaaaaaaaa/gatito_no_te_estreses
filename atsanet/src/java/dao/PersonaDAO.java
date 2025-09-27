/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import control.ConnBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Eps;
import modelo.Genero;
import modelo.Rh;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO {
    PreparedStatement ps;
    ResultSet rs;
    
    //Metodos para listar genero, eps y rh
    //GENERO
    public List<Genero> listarGenero(){
        List<Genero> listarG = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM genero";
            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Genero g = new Genero();
                g.setIdgenero(rs.getInt("idgenero"));
                g.setNom_genero(rs.getString("nom_genero"));
                
                listarG.add(g);
            }
        } catch (SQLException e) {
        }
        return listarG;
    }

    //EPS
    public List<Eps> listarEps(){
        List<Eps> listarE = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM eps";
            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Eps e = new Eps();
                e.setIdeps(rs.getInt("ideps"));
                e.setNom_eps(rs.getString("nom_eps"));
                
                listarE.add(e);
            }
            
        } catch (SQLException e) {
        }
        
        return listarE;
    }
    
    //RH
    public List<Rh> listarRh(){
        List<Rh> listarR = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM rh";
            ps = ConnBD.conectar().prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Rh r = new Rh();
                r.setIdrh(rs.getInt("idrh"));
                r.setNom_rh(rs.getString("nom_rh"));
                
                listarR.add(r);
            }
        } catch (SQLException e) {
        }
        
        return listarR;
    }
    
    
    //Metodos para listar genero, eps y rh
    //GENERO
    public Genero buscarGenero(Genero gen){
        Genero g = new Genero();
        
        try {
            String sql = "SELECT * FROM genero WHERE idgenero = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, gen.getIdgenero());
            
            rs = ps.executeQuery();
            
            if(rs.next()){
                g.setIdgenero(rs.getInt("idgenero"));
                g.setNom_genero(rs.getString("nom_genero"));
            }
        } catch (SQLException e) {
        }
        
        return g;  
    }
    
    public Genero buscarGenero(int fk_genero) {
        Genero g = new Genero();
        
        try {
            String sql = "SELECT * FROM genero WHERE idgenero = ?"; 
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, fk_genero);
            
            rs = ps.executeQuery();

            if (rs.next()) {
                g.setIdgenero(rs.getInt("idgenero"));
                g.setNom_genero(rs.getString("nom_genero"));
            }
        } catch (SQLException e) {
        }

        return g;
    }

    //EPS
    public Eps buscarEps(Eps eps) {
        Eps e = new Eps();

        try {
            String sql = "SELECT * FROM eps WHERE ideps = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, eps.getIdeps());
            
            rs = ps.executeQuery();

            if (rs.next()) {
                e.setIdeps(rs.getInt("ideps"));
                e.setNom_eps(rs.getString("nom_eps"));
            }
        } catch (SQLException ex) {
        }

        return e;
    }
    
    public Eps buscarEps(int fk_eps) {
        Eps e = new Eps();

        try {
            String sql = "SELECT * FROM eps WHERE ideps = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, fk_eps);
            
            rs = ps.executeQuery();

            if (rs.next()) {
                e.setIdeps(rs.getInt("ideps"));
                e.setNom_eps(rs.getString("nom_eps"));
            }
        } catch (SQLException ex) {
        }

        return e;
    }

    //RH
    public Rh buscarRh(Rh rh) {
        Rh r = new Rh();

        try {
            String sql = "SELECT * FROM rh WHERE idrh = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, rh.getIdrh());
            
            rs = ps.executeQuery();

            if (rs.next()) {
                r.setIdrh(rs.getInt("idrh"));
                r.setNom_rh(rs.getString("nom_rh"));
            }
        } catch (SQLException ex) {
        }

        return r;
    }
    
    public Rh buscarRh(int fk_rh) {
        Rh r = new Rh();

        try {
            String sql = "SELECT * FROM rh WHERE idrh = ?";
            ps.setInt(1, fk_rh);
            rs = ps.executeQuery();

            if (rs.next()) {
                r.setIdrh(rs.getInt("idrh"));
                r.setNom_rh(rs.getString("nom_rh"));
            }
        } catch (SQLException ex) {
        }

        return r;
    }

    
}
