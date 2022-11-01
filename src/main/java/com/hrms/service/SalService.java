package com.hrms.service;

import com.hrms.bean.Department;
import com.hrms.bean.Employee;
import com.hrms.bean.Sal;
import com.hrms.mapper.SalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Auther: 李鑫
 * @Date: 2022/10/24 11:07
 * @Description:
 */
@Service
public class SalService {
    @Autowired
    SalMapper salMapper;


    public List<Department> getSalList( Employee employee,Integer offset, Integer limit){
        return salMapper.selectSalByLimitAndOffset( employee,offset, limit);
    };
    public int getSalCount(){
        return salMapper.countSal();

    }

    public void addSal (Sal sal) {

        salMapper.addSal(sal);
    }
//    public int addSal(Sal sal){
//
//        return salMapper.insertOne(sal);
//    }
}
