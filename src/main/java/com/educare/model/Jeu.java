package com.educare.model;

import java.sql.Timestamp;

public class Jeu {
    private int id;
    private Theme theme;
    private String nomJeu;
    private String description;

    // Getters
    public int getId() { return id; }
    public Theme getTheme() { return theme; }
    public String getNomJeu() { return nomJeu; }
    public String getDescription() { return description; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setTheme(Theme theme) { this.theme = theme; }
    public void setNomJeu(String nomJeu) { this.nomJeu = nomJeu; }
    public void setDescription(String description) { this.description = description; }
}