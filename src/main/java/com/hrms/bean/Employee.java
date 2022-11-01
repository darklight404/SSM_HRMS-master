package com.hrms.bean;

/**
 * @author GenshenWang.nomico
 * @date 2018/3/5.
 */
public class Employee {
    private Integer empId;
    private String empName;
    private String empEmail;
    private String gender;
    private String loginname;
    private String password;
    private Integer departmentId;

    private Department department;

    public Employee() {
    }

    public Employee(Integer empId, String empName, String empEmail, String gender, String loginname, String password, Integer departmentId) {
        this.empId = empId;
        this.empName = empName;
        this.empEmail = empEmail;
        this.gender = gender;
        this.loginname = loginname;
        this.password = password;
        this.departmentId = departmentId;
    }

    public Employee(String empName, String empEmail, String gender, String loginname, String password, Integer departmentId) {
        this.empName = empName;
        this.empEmail = empEmail;
        this.gender = gender;
        this.loginname = loginname;
        this.password = password;
        this.departmentId = departmentId;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empEmail='" + empEmail + '\'' +
                ", gender='" + gender + '\'' +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", departmentId=" + departmentId +
                ", department=" + department +
                '}';
    }

    public Employee(String name, String gender, String loginname, String password, String email, String departmentId) {
    }
    public Employee(Integer empId, String empName, String empEmail, String gender, Integer departmentId) {
        this.empId = empId;
        this.empName = empName;
        this.empEmail = empEmail;
        this.gender = gender;
        this.departmentId = departmentId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
