package com.ccis.fog;

public class Advices {
    private String date;

    private String advices;

    public String getDate() {
        return date;
    }

    public String getAdvices() {
        return advices;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setAdvices(String advices) {
        this.advices = advices;
    }

    @Override
    public String toString() {
        return "Advices{" +
                "date='" + date + '\'' +
                ", advices='" + advices + '\'' +
                '}';
    }
}
