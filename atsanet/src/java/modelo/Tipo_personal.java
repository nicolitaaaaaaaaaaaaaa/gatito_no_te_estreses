
package modelo;

public class Tipo_personal {
    private int idtipopersonal;
    private String nom_tipo_per;

    public Tipo_personal() {
    }
    
    public Tipo_personal(int idtipopersonal, String nom_tipo_per) {
        this.idtipopersonal = idtipopersonal;
        this.nom_tipo_per = nom_tipo_per;
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
    
    
    
}
