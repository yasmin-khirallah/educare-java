package com.educare.model;

import java.sql.Timestamp;

public class Theme {
    private int id;
    private String nomTheme;
    private String descriptionTheme;
    private String imageTheme;
    private Timestamp dateAjout;
    private Timestamp dateModification;

    // Getters
    public int getId() { return id; }
    public String getNomTheme() { return nomTheme; }
    public String getDescriptionTheme() { return descriptionTheme; }
    public String getImageTheme() { return imageTheme; }
    public Timestamp getDateAjout() { return dateAjout; }
    public Timestamp getDateModification() { return dateModification; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setNomTheme(String nomTheme) { this.nomTheme = nomTheme; }
    public void setDescriptionTheme(String descriptionTheme) { this.descriptionTheme = descriptionTheme; }
    public void setImageTheme(String imageTheme) { this.imageTheme = imageTheme; }
    public void setDateAjout(Timestamp dateAjout) { this.dateAjout = dateAjout; }
    public void setDateModification(Timestamp dateModification) { this.dateModification = dateModification; }
}