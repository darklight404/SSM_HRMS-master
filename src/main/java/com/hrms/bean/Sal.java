package com.hrms.bean;

import java.util.Date;

/**
 * @Auther: 李鑫
 * @Date: 2022/10/24 11:02
 * @Description:
 */

//工资
public class Sal {

    private Integer id;
    private String eid;//员工id
    private String base;//应发工资
    private String net;//实发工资
    private String grant;//是谁发放工资
    private Date paytime;//发放工资时间


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getBase() {
        return base;
    }

    public void setBase(String base) {
        this.base = base;
    }

    public String getNet() {
        return net;
    }

    public void setNet(String net) {
        this.net = net;
    }

    public String getGrant() {
        return grant;
    }

    public void setGrant(String grant) {
        this.grant = grant;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    @Override
    public String toString() {
        return "Sal{" +
                "id=" + id +
                ", eid=" + eid +
                ", base='" + base + '\'' +
                ", net='" + net + '\'' +
                ", grant='" + grant + '\'' +
                ", paytime=" + paytime +
                '}';
    }
}
