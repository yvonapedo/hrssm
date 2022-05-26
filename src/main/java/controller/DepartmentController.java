package controller;

import model.TDepartment;
import model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DepartmentService;
import service.UserService;

import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping(value = "/department")
public class DepartmentController {
    @Autowired
    private UserService userService;

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/adddepartment") //
    public String addDepartment(String deptName, String deptDescription, Model model) throws ParseException {

        TDepartment department = new TDepartment();

        department.setDeptName(deptName);
        department.setDeptDescription(deptDescription);

        int row;
        row = departmentService.insertDepartment(department);


        if (row > 0) {
            return "redirect:../department/getdepartments";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }

    }

    @RequestMapping(value = "/editdepartment") //
    public String editDepartment(int deptId, String deptName, String deptDescription, Model model) throws ParseException {


        TDepartment department = new TDepartment();
        department.setDeptName(deptName);
        department.setDeptDescription(deptDescription);
        department.setDeptId(deptId);

        int row;
        row = departmentService.updateDepartment(department);

        if (row > 0) {
            return "redirect:../department/getdepartments";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }

    }

    @RequestMapping(value = "/getdepartments") //
    public String getDepartments(String search, Model model) {
        TDepartment department= new TDepartment();
        department.setDeptName(search);


        List<TDepartment> list = departmentService.getDepartmentsSelective(department);
        model.addAttribute("departments", list);
        return "departments";
    }

    @RequestMapping(value = "/getemployees") //
    public String getEmployees(int deptId, Model model) {
        TUser user= new TUser();
        user.setDeptid(deptId);

        List<TUser> list = userService.getUsersSelective(user);
        model.addAttribute("users", list);
        return "departmentdetails";
    }

    @RequestMapping(value = "/getdepartment") //
    public String getDepartment(int deptId, Model model) {
        TDepartment department = departmentService.selectDepartmentById(deptId);
        model.addAttribute("department", department);
        return "editdept";
    }
}