
package Modelo;


public class Tipo_Personal {
    private int idtipopersonal;
    private String nom_tipo_per;

    public Tipo_Personal() {
    }

    public int getIdtipopersonal() {
        return idtipopersonal;
    }

    public void setIdtipopersonal(int idtipopersonal) {
        this.idtipopersonal = idtipopersonal;
    }

    public String getNom_tipo_per() {
        return nom_tipo_per;
    }

    public void setNom_tipo_per(String nom_tipo_per) {
        this.nom_tipo_per = nom_tipo_per;
    }

    @Override
    public String toString() {
        return "Tipo_Personal{" + "idtipopersonal=" + idtipopersonal + ", nom_tipo_per=" + nom_tipo_per + '}';
    }
    
    
    
}
