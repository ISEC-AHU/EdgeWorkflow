package com.ccis.fog;

public class OutputEntity {
    private String jobId;
    private String taskId;
    private String status;
    private String dataCenterId;
    private String vmId;
    private String time;
    private String startTime;
    private String FinishTime;
    private String depth;
    private String cost;
    private String parents;
    private String realTime;
    private String realCost;
    private String realStartTime;
    private String realFinishTime;
    private String realStatus;
    private String workLoad;
    private String workType;

    public String getJobId() {
        return jobId;
    }

    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDataCenterId() {
        return dataCenterId;
    }

    public void setDataCenterId(String dataCenterId) {
        this.dataCenterId = dataCenterId;
    }

    public String getVmId() { return vmId; }

    public void setVmId(String vmId) {
        this.vmId = vmId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getFinishTime() {
        return FinishTime;
    }

    public void setFinishTime(String finishTime) {
        FinishTime = finishTime;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getParents() {
        return parents;
    }

    public void setParents(String parents) {
        this.parents = parents;
    }

    public String getRealTime() { return realTime; }

    public void setRealTime(String realTime) { this.realTime = realTime; }

    public String getRealCost() { return realCost; }

    public void setRealCost(String realCost) { this.realCost = realCost; }

    public String getWorkLoad() {
        return workLoad;
    }

    public void setWorkLoad(String workLoad) {
        this.workLoad = workLoad;
    }

    public String getRealStartTime() {
        return realStartTime;
    }

    public void setRealStartTime(String realStartTime) {
        this.realStartTime = realStartTime;
    }

    public String getRealFinishTime() {
        return realFinishTime;
    }

    public void setRealFinishTime(String realFinishTime) {
        this.realFinishTime = realFinishTime;
    }

    public String getRealStatus() {
        return realStatus;
    }

    public void setRealStatus(String realStatus) {
        this.realStatus = realStatus;
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }

    @Override
    public String toString() {
        return "OutputEntity{" +
                "jobId='" + jobId + '\'' +
                ", taskId='" + taskId + '\'' +
                ", status='" + status + '\'' +
                ", dataCenterId='" + dataCenterId + '\'' +
                ", vmId='" + vmId + '\'' +
                ", time='" + time + '\'' +
                ", startTime='" + startTime + '\'' +
                ", FinishTime='" + FinishTime + '\'' +
                ", depth='" + depth + '\'' +
                ", cost='" + cost + '\'' +
                ", parents='" + parents + '\'' +
                ", realTime='" + realTime + '\'' +
                ", realCost='" + realCost + '\'' +
                ", realStartTime='" + realStartTime + '\'' +
                ", realFinishTime='" + realFinishTime + '\'' +
                ", realStatus='" + realStatus + '\'' +
                ", workLoad='" + workLoad + '\'' +
                ", workType='" + workType + '\'' +
                '}';
    }

}
