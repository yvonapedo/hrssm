package controller;

import impl.SalaryServiceImpl;
import model.TSalary;
import model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ProjectService;
import service.SalaryService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping(value = "/salary")
public class SalaryController {
    @Autowired
    private SalaryService salaryService;

    @RequestMapping(value = "/addsalary") //
    public String addProject(  double amount, String issueDate,
                               String remarks,int employeeId,Model model) throws ParseException {

        TSalary salary = new TSalary();
        BigDecimal bigAmount = BigDecimal.valueOf(amount);

        salary.setAmount(bigAmount);
        salary.setIssueDate(issueDate);
        salary.setEmployeeId(employeeId);
        salary.setRemarks(remarks);

        int row;
        row = salaryService.insertSalary(salary);


        if (row > 0) {
            return "redirect:../salary/getsalaries";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }

    }

    @RequestMapping(value = "/editsalary") //
    public String editProject( int salaryId, double amount, String issueDate,
                                String remarks,int employeeId, Model model) throws ParseException {

        TSalary salary = new TSalary();
        BigDecimal bigAmount = BigDecimal.valueOf(amount);

        salary.setAmount(bigAmount);
        salary.setIssueDate(issueDate);
        salary.setEmployeeId(employeeId);
        salary.setRemarks(remarks);

        salary.setSalaryId(salaryId);
        int row;
        row = salaryService.updateSalary(salary);

        if (row > 0) {
            return "redirect:../salary/getsalaries";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }

    }

    @RequestMapping(value = "/getsalaries") //
    public String getProjects(String search, Model model,  HttpServletRequest req) {
        TSalary salary= new TSalary();

        salary.setIssueDate(search);
        HttpSession session = req.getSession();
        TUser user= (TUser) session.getAttribute("loginuser");
        System.out.println(user.getUsername());
        if (user!= null) {
            salary.setEmployeeId(user.getUserid());
        }
        List<TSalary> list = salaryService.getSalariesSelective(salary);
        model.addAttribute("salaries", list);
        return "salaries";
    }

    @RequestMapping(value = "/getAllsalaries") //
    public String getAllsalaries(String search, Model model ) {
        TSalary salary= new TSalary();

        salary.setIssueDate(search);

        List<TSalary> list = salaryService.getSalariesSelective(salary);
        model.addAttribute("salaries", list);
        return "salaries";
    }

    @RequestMapping(value = "/mysalaries") //
    public String getSaleries(int userid, Model model,  HttpServletRequest req) {
        TSalary salary= new TSalary();
            salary.setEmployeeId(userid);

        List<TSalary> list = salaryService.getSalariesSelective(salary);
        model.addAttribute("salaries", list);
        return "salaries";
    }

    @RequestMapping(value = "/getsalary") //
    public String getProject(int salaryId, Model model) {
        TSalary salary = salaryService.selectSalaryById(salaryId);
        model.addAttribute("salary", salary);
        return "editsalary";
    }
}