package com.hrms.mapper;

import com.hrms.bean.Attendance;
import com.hrms.bean.Employee;
import com.hrms.bean.Sign;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface AttendanceMapper {
    String TABLE_NAME = "attendance";
    /**
     * =================================查询============================================
     */
    Employee selectOneById(@Param("empId") int empId);
    Employee selectOneByName(@Param("empName") String empName);
    //查询带有部门信息的Employee
    Employee selectWithDeptById(@Param("empId") Integer empId);

    /**
     * 分页查询
     * @param limit 返回记录最大行数
     * @param offset 返回记录行的偏移量
     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
     */
    List<Attendance> getAttList(@Param("employee") Employee employee,
                                @Param("offset") Integer offset,
                                @Param("limit") Integer limit);

    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    int getAttCount();

    void setSignIn(@Param("employee") Employee employee,
                   @Param("date") Date date);


    List<Sign> findDate(Employee employee);

    List<Sign> getEndSign(Object employee);

    void setEndSign(@Param("employee") Employee employee,
                    @Param("date") Date date);

    void setSignDay(@Param("dayNum") String dayNum,
                    @Param("empId") Integer empId);


    void addFistAtten(Employee employee);

    void upAttenWork(Employee employee);
}
