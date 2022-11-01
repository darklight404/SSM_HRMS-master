package com.hrms.controller;

import com.hrms.AjaxJson.AjaxJson;
import com.hrms.bean.Attendance;
import com.hrms.bean.Employee;
import com.hrms.bean.Sign;
import com.hrms.service.AttendanceService;
import com.hrms.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/hrms/attendance")
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;

    /**
     * 查询
     *
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getAttendance", method = RequestMethod.GET)
    public ModelAndView getAttendance(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("attendancePage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo - 1) * limit;
        //获得员工个人信息
        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        //获取指定页数包含的员工信息
        List<Attendance> attendances = attendanceService.getAttList(employee, offset, limit);
        //获取总的记录数
        int totalItems = attendanceService.getAttCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp + 1;
        //当前页数
        int curPage = pageNo;

        //将上述查询结果放到Model中，在JSP页面中可以进行展示
        mv.addObject("attendances", attendances)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mv;
    }

    @RequestMapping(value = "/signIn", method = RequestMethod.GET)
    public ModelAndView signIn() {
        System.out.println(123456789);
        ModelAndView mv = new ModelAndView("signIn");
        return mv;
    }
    //签到的方法
    @RequestMapping(value = "/getSignIn", method = RequestMethod.GET)
    @ResponseBody
    public AjaxJson getSignIn(HttpServletRequest request) {
        AjaxJson ajaxJson = new AjaxJson();
        System.out.println(1111111);
        HttpSession session = request.getSession();
        Employee employee = (Employee) session.getAttribute("employee");
        System.out.println("11111111" + employee);
        Date date = new Date();
        System.out.println(date);
        List<Sign> signs = attendanceService.findDate(employee);
        if (signs.size()==0){
            System.out.println("signs为空的操作");
            //签到时间
            attendanceService.setSignIn(employee, date);
            //添加记录表记录
            attendanceService.addFistAtten(employee);
        }else {
            for (int i = 0; i <signs.size() ; i++) {
                System.out.println("-------------123");
                String substring = signs.get(i).getStartTime().toString().substring(4, 10);
                String substring1 = date.toString().substring(4, 10);
                System.out.println(substring);
                if (substring.equals(substring1)) {
                    ajaxJson.setSuccess(false);
                    ajaxJson.setMsg("您已经签到过了");
                } else {
                    System.out.println(123);
                    //正常签到
                    attendanceService.setSignIn(employee, date);
//                    //修改工作天数+1
//                    attendanceService.upAttenWork(employee);
                    System.out.println(321);
                }
            }
        }

//        attendanceService.setSignIn(employee, date);
        System.out.println("ok");
        return ajaxJson;
    }
    @RequestMapping(value = "/getSignOut", method = RequestMethod.GET)
    @ResponseBody
    public AjaxJson getSignOut(HttpServletRequest request) {
        AjaxJson ajaxJson = new AjaxJson();
        HttpSession session = request.getSession();
        Employee employee =(Employee) session.getAttribute("employee");
        Date date = new Date();
        List<Sign> signs = attendanceService.findDate(employee);
        if (signs.size()==0){
            ajaxJson.setSuccess(false);
            ajaxJson.setMsg("这是您第一次上班，请耐心工作哦");
        }else {
            for (int i = 0; i < signs.size(); i++) {
                if (signs.get(i).getEndTime()==null){
                    attendanceService.setEndSign(employee,date);
                }else {
                    String substring = signs.get(i).getEndTime().toString().substring(4, 10);
                    String substring1 = date.toString().substring(4, 10);
                    if (substring.equals(substring1)){
                        ajaxJson.setSuccess(false);
                        ajaxJson.setMsg("您已经下班了，明天再接再厉");
                    }
                }
            }
        }
        return ajaxJson;
    }

    @RequestMapping(value = "/addLeaveDay",method =RequestMethod.GET )
    public ModelAndView setSignDay(HttpServletRequest request,HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main");
        String dayNum = request.getParameter("dayNum");
        System.out.println("请假天数"+dayNum);
        Employee employee = (Employee) session.getAttribute("employee");
        Integer empId = employee.getEmpId();
        attendanceService.setSignDay(dayNum,empId);
        return modelAndView;
    }
    //判断身份
    @RequestMapping(value = "/upUser",method =RequestMethod.GET )
    public AjaxJson upUser(HttpServletRequest request,HttpSession session){
        AjaxJson ajaxJson = new AjaxJson();
        Employee employee = (Employee) session.getAttribute("employee");
        Integer did = employee.getDepartmentId();
        if (did==5||did==3){
            ajaxJson.setSuccess(false);
            ajaxJson.setMsg("您的身份不是管理员");
        }
        return ajaxJson;
    }

}
