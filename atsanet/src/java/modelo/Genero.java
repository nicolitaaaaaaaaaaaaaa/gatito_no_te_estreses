
package modelo;

public class Genero {
    private int idgenero;
    private String nom_genero;

    public Genero() {
    }

    public Genero(int idgenero, String nom_genero) {
        this.idgenero = idgenero;
        this.nom_genero = nom_genero;
    }

    public int getIdgenero() {
        return idgenero;
    }

    public void setIdgenero(int idgenero) {
        this.idgenero = idgenero;
    }

    public String getNom_genero() {
        return nom_genero;
    }

    public void setNom_genero(String nom_genero) {
        this.nom_genero = nom_genero;
    }
}
