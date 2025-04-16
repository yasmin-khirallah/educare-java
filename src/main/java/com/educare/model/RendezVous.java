package com.educare.model;

import java.time.LocalDateTime;

public class RendezVous {
    private int id;
    private int enfantId;
    private LocalDateTime date;
    private String description;

    // Getters/Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getEnfantId() { return enfantId; }
    public void setEnfantId(int enfantId) { this.enfantId = enfantId; }
    public LocalDateTime getDate() { return date; }
    public void setDate(LocalDateTime date) { this.date = date; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}