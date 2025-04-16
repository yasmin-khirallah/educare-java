package com.educare.model;

public class DossierMedical {
    private int id;
    private int enfantId;
    private String typeEnfant;
    private String remarquesMedecin;
    private int sciResJeux;

    // Constructeurs
    public DossierMedical() {}
    public DossierMedical(int enfantId, String typeEnfant, String remarquesMedecin, int sciResJeux) {
        this.enfantId = enfantId;
        this.typeEnfant = typeEnfant;
        this.remarquesMedecin = remarquesMedecin;
        this.sciResJeux = sciResJeux;
    }

    // Getters/Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getEnfantId() { return enfantId; }
    public void setEnfantId(int enfantId) { this.enfantId = enfantId; }
    public String getTypeEnfant() { return typeEnfant; }
    public void setTypeEnfant(String typeEnfant) { this.typeEnfant = typeEnfant; }
    public String getRemarquesMedecin() { return remarquesMedecin; }
    public void setRemarquesMedecin(String remarquesMedecin) { this.remarquesMedecin = remarquesMedecin; }
    public int getSciResJeux() { return sciResJeux; }
    public void setSciResJeux(int sciResJeux) { this.sciResJeux = sciResJeux; }
}