package com.educare.model;

public class Enfant {
    private int id;
    private int parentId;
    private String username;
    private String code;
    private String type;
    private int resquiz;

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getParentId() { return parentId; }
    public void setParentId(int parentId) { this.parentId = parentId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public int getResquiz() { return resquiz; }
    public void setResquiz(int resquiz) { this.resquiz = resquiz; }
}