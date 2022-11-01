package com.hrms.controller;

import com.hrms.bean.Department;
import com.hrms.bean.Employee;
import com.hrms.bean.Sal;
import com.hrms.mapper.SalMapper;
import com.hrms.service.SalService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Auther: 李鑫
 * @Date: 2022/10/24 11:47
 * @Description:
 */
@Controller
@RequestMapping(value = "/hrms/sal")
public class SalController {
    @Autowired
    SalService salService;

    /**
     * 查询部门信息总页码数
     * @return
     */
    @RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getTotalPages(){

        //每页显示的记录行数
        int limit = 5;
        //总记录数
        int totalItems = salService.getSalCount();
        System.out.println(totalItems);
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit== 0) ? temp : temp+1;

        return JsonMsg.success().addInfo("totalPages", totalPages);
    }

    /**
     * 查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getSalList", method = RequestMethod.GET)
    public ModelAndView getSalList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo, HttpServletRequest request){
        ModelAndView mv = new ModelAndView("salPage");
        //每页显示的记录行数
        int limit = 5;
        //总记录数
        System.out.println(limit);
        int totalItems = salService.getSalCount();
        System.out.println(totalItems);
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit== 0) ? temp : temp+1;
        //每页的起始行(offset+1)数据，如第一页(offset=0，从第1(offset+1)行数据开始)
        int offset = (pageNo - 1)*limit;
        HttpSession session = request.getSession();
        Employee employee =(Employee) session.getAttribute("employee");
        List<Department> departments = salService.getSalList(employee,offset, limit);
        System.out.println(departments);
        System.out.println(departments);
        mv.addObject("sal", departments)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPageNo", pageNo);
        return mv;
    }

}
