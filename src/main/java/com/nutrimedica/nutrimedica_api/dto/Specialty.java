package com.nutrimedica.nutrimedica_api.dto;

public class Specialty {
    private String name;

    public Specialty(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
