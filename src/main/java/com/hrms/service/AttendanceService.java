package com.hrms.service;

import com.hrms.bean.Attendance;
import com.hrms.bean.Employee;
import com.hrms.bean.Sign;
import com.hrms.mapper.AttendanceMapper;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AttendanceService {
    @Autowired
    AttendanceMapper attendanceMapper;
    public List<Attendance> getAttList(Employee employee, int offset, int limit) {
        return attendanceMapper.getAttList(employee,offset,limit);
    }

    public int getAttCount() {
        return attendanceMapper.getAttCount();
    }


    public void setSignIn(Employee employee, Date date) {
        attendanceMapper.setSignIn(employee,date);
    }


    public  List<Sign>  findDate(Employee employee) {
        return attendanceMapper.findDate(employee);
    }

    public List<Sign> getEndSign(Object employee) {
        return attendanceMapper.getEndSign(employee);
    }

    public void setEndSign(Employee employee,Date date) {
        attendanceMapper.setEndSign(employee,date);
    }

    public void setSignDay(String dayNum, Integer empId) {
        attendanceMapper.setSignDay(dayNum,empId);
    }


    public void addFistAtten(Employee employee) {
        attendanceMapper.addFistAtten(employee);
    }

    public void upAttenWork(Employee employee) {
        attendanceMapper.upAttenWork(employee);
    }
}
