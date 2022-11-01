package com.hrms.bean;

import java.util.Date;

public class Sign {
    private Integer sgId;
    private Integer sgEid;
    private Date startTime;
    private Date endTime;

    public Sign() {
    }

    public Integer getSgId() {
        return sgId;
    }

    public void setSgId(Integer sgId) {
        this.sgId = sgId;
    }

    public Integer getSgEid() {
        return sgEid;
    }

    public void setSgEid(Integer sgEid) {
        this.sgEid = sgEid;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Sign{" +
                "sgId=" + sgId +
                ", sgEid=" + sgEid +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
