
package modelo;

public class Eps {
    private int ideps;
    private String nom_eps;

    public Eps() {
    }

    public Eps(int ideps, String nom_eps) {
        this.ideps = ideps;
        this.nom_eps = nom_eps;
    }
    
    public int getIdeps() {
        return ideps;
    }

    public void setIdeps(int ideps) {
        this.ideps = ideps;
    }

    public String getNom_eps() {
        return nom_eps;
    }

    public void setNom_eps(String nom_eps) {
        this.nom_eps = nom_eps;
    }
  
}
