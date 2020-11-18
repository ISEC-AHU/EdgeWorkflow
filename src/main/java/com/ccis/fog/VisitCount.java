package com.ccis.fog;

public class VisitCount {

    private String email;

    private String visitIp;

    private String visitDate;

    private String visitAddress;

    public String getUserName() {
        return email;
    }

    public String getVisitIp() {
        return visitIp;
    }

    public String getVisitDate() {
        return visitDate;
    }

    public String getVisitAddress() {
        return visitAddress;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setVisitIp(String visitIp) {
        this.visitIp = visitIp;
    }

    public void setVisitDate(String visitDate) {
        this.visitDate = visitDate;
    }

    public void setVisitAddress(String visitAddress) {
        this.visitAddress = visitAddress;
    }

    @Override
    public String toString() {
        return "visitCount{" +
                "email='" + email + '\'' +
                ", visitIp='" + visitIp + '\'' +
                ", visitDate='" + visitDate + '\'' +
                ", visitAddress='" + visitAddress + '\'' +
                '}';
    }
}
