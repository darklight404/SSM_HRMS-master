package com.hrms.mapper;

import com.hrms.bean.Department;
import com.hrms.bean.Employee;
import com.hrms.bean.Sal;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @Auther: 李鑫
 * @Date: 2022/10/24 11:07
 * @Description:
 */
@Repository
public interface SalMapper {
    String Sal_NAME = "sal";
    String INSERT_FIELDS = "sal_name, s_base,s_net,s_grant,s_paytime";
    String SELECT_FIELDS = "s_id as 'id', " +
            "s_eid as 'eid', " +
            "s_base as 'base',"+
            "s_net as 'net',"+
            "s_grant as 'grant',"+
            "s_paytime as 'paytime',"
           ;

    /**
     * =================================查询============================================
     */
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME, "WHERE s_id=#{Id}" })
    Department selectOneById(@Param("id") Integer id);
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME, "       s_eid=#{eid}" })
    Department selectOneByEid(@Param("eid") String deptLeader);
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME, "WHERE s_base=#{base}" })
    Department selectOneByBase(@Param("base") String deptName);
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME, "WHERE s_net=#{net}" })
    Department selectOneByNet(@Param("net") String deptName);
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME, "WHERE s_grant=#{grant}" })
    Department selectOneByGrant(@Param("grant") String deptName);
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME, "WHERE s_paytime=#{paytime}" })
    Department selectOneByPaytime(@Param("paytime") String deptName);
    @Select({"SELECT", SELECT_FIELDS, "FROM", Sal_NAME})
    List<Department> selectDeptList();

    List<Department> selectSalByLimitAndOffset(
            @Param("employee") Employee employee,
            @Param("offset") Integer offset,
            @Param("limit") Integer limit);

   @Select({"SELECT COUNT(id) FROM", Sal_NAME,
           "WHERE eid = #{eid} OR base = #{base} " +
                   "OR net = #{net} OR grant = #{grant} " +
                    "OR paytime = #{paytime} "} )
   int checkDeptsExistsByNameAndleader(@Param("deptLeader") String deptLeader,
                                       @Param("deptName") String deptName);

    @Select({"SELECT COUNT(*) FROM", Sal_NAME})
    int countSal();

    @Insert({"INSERT INTO", Sal_NAME, "(",INSERT_FIELDS,") " +
            "VALUES(#{eid}, " +
            "#{base}, " +
            "#{net}, " +
            "#{grant})"+
            "#{paytime})"})
    int insertOne( Sal sal);


    void addSal( Sal sal);
}
