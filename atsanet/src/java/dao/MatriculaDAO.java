/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import control.ConnBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Categoria;

public class MatriculaDAO {
    PreparedStatement ps;
    ResultSet rs;
    
    public Categoria buscarCategoria(int idcategoria) {
        Categoria c = new Categoria();

        try {
            String sql = "SELECT * FROM categoria WHERE idcategoria = ?";
            ps = ConnBD.conectar().prepareStatement(sql);
            ps.setInt(1, c.getIdcategoria());
            rs = ps.executeQuery();

            if (rs.next()) {
                c.setIdcategoria(rs.getInt("idcategoria"));
                c.setNom_categoria(rs.getString("nom_categoria"));
            }
        } catch (Exception e) {
        }

        return c;
    }
    
}
