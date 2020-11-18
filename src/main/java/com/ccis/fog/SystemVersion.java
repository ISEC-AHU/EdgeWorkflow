package com.ccis.fog;

public class SystemVersion {

    //版本号
    private String versionNum;

    //备注
    private String note;

    //更新日期
    private String updateTime;

    public String getVersionNum() {
        return versionNum;
    }

    public void setVersionNum(String versionNum) {
        this.versionNum = versionNum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "SystemVersion{" +
                "versionNum='" + versionNum + '\'' +
                ", note='" + note + '\'' +
                ", updateTime='" + updateTime + '\'' +
                '}';
    }
}
