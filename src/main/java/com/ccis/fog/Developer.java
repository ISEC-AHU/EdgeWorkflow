package com.ccis.fog;

public class Developer {

    private String name;

    private String university;

    private String email;

    public String getName() {
        return name;
    }

    public String getUniversity() {
        return university;
    }

    public String getEmail() {
        return email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Developer{" +
                "name='" + name + '\'' +
                ", university='" + university + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
