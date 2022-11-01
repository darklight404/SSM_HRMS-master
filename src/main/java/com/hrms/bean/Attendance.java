package com.hrms.bean;



public class Attendance {
    private Integer wId;
    private Integer wEid;
    private Integer workDay;//工作天数
    private Integer wTakeoff;//请假天数
    private Integer wLate;//迟到次数
    private Integer wEarly;//早退次数
    private Integer wSkip;//旷工天数

    public Attendance() {
    }

    public Integer getwId() {
        return wId;
    }

    public void setwId(Integer wId) {
        this.wId = wId;
    }

    public Integer getwEid() {
        return wEid;
    }

    public void setwEid(Integer wEid) {
        this.wEid = wEid;
    }

    public Integer getWorkDay() {
        return workDay;
    }

    public void setWorkDay(Integer workDay) {
        this.workDay = workDay;
    }

    public Integer getwTakeoff() {
        return wTakeoff;
    }

    public void setwTakeoff(Integer wTakeoff) {
        this.wTakeoff = wTakeoff;
    }

    public Integer getwLate() {
        return wLate;
    }

    public void setwLate(Integer wLate) {
        this.wLate = wLate;
    }

    public Integer getwEarly() {
        return wEarly;
    }

    public void setwEarly(Integer wEarly) {
        this.wEarly = wEarly;
    }

    public Integer getwSkip() {
        return wSkip;
    }

    public void setwSkip(Integer wSkip) {
        this.wSkip = wSkip;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "wId=" + wId +
                ", wEid=" + wEid +
                ", workDay=" + workDay +
                ", wTakeoff=" + wTakeoff +
                ", wLate=" + wLate +
                ", wEarly=" + wEarly +
                ", wSkip=" + wSkip +
                '}';
    }
}
