package com.hrms.controller;

import com.hrms.bean.Employee;
import com.hrms.bean.Sal;
import com.hrms.service.EmployeeService;
import com.hrms.service.SalService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * @Auther: 李鑫
 * @Date: 2022/10/25 9:17
 * @Description:
 */
@Controller
@RequestMapping(value = "/hrms/two")
public class SalTwoController {

    @Autowired
    private EmployeeService employeeService;
    @Autowired
    SalService salService;

    /**
     * 根据id查询员工信息
     * @param empId
     * @return
     */
    @RequestMapping(value = "/getEmpById/{empId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getEmpById(@PathVariable("empId") Integer empId){
        Employee employee = employeeService.getEmpById(empId);
        if (employee != null){
            return JsonMsg.success().addInfo("employee", employee);
        }else {
            return JsonMsg.fail();
        }

    }
    /**
     * 查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getTwoList", method = RequestMethod.GET)
    public ModelAndView getEmp(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        ModelAndView mv = new ModelAndView("salTwoPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo-1)*limit;
        //获取指定页数包含的员工信息
        List<Employee> employees = employeeService.getEmpList(offset, limit);
        //获取总的记录数
        int totalItems = employeeService.getEmpCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;

        //将上述查询结果放到Model中，在JSP页面中可以进行展示
        mv.addObject("employees", employees)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mv;
    }
    /**
     * 新增记录后，查询最新的页数
     * @return
     */
    @RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getTotalPage(){
        int totalItems = salService.getSalCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }

    /**
     * 新增员工
     * @param sal  新增的员工信息
     * @return
     */
    @RequestMapping(value = "/addSal", method = RequestMethod.POST)
    @ResponseBody
    public void addEmp(Sal sal){
        System.out.println();
        System.out.println("测试方法addSal"+sal);
        Date date = new Date();
        sal.setPaytime(date);
        salService.addSal(sal);
        System.out.println("测试ressever");
    }
}
