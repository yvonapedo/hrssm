package controller;

import model.TDepartment;
import model.TUser;
import model.TUsertype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DepartmentService;
import service.UserService;
import service.UsertypeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private service.UsertypeService usertypeService;
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/register") //: /user/register
    public String registerUser(String username, String firstname, String lastname, String dob, String telephone,
                               String email, String address, String hiredate, int deptid, String photourl,
                               String password, Model model) {
        TUser user = new TUser();

        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setDob(dob);
        user.setTelephone(telephone);
        user.setEmail(email);
        user.setAddress(address);
        user.setHiredate(hiredate);
        user.setDeptid(deptid);
        user.setUsername(username);
        user.setPassword(password);
        user.setUsertypeId(1);
        user.setPhotourl(photourl);

        boolean row;
        row = userService.registerUser(user);

        if (row) {
            return "login";
        } else {
            model.addAttribute("errMsg", "The user account and password are not correct");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }
    }

    @RequestMapping(value = "/edituser") //: /user/
    public String edituser(String username, String firstname, String lastname, String dob, String telephone,
                           String email, String address, String hiredate, String photourl, HttpServletRequest req,
                           Model model) {
        TUser user = new TUser();

        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setDob(dob);
        user.setTelephone(telephone);
        user.setEmail(email);
        user.setAddress(address);
        user.setHiredate(hiredate);
        user.setUsername(username);
        user.setPhotourl(photourl);

        HttpSession session = req.getSession();
        TUser loginuser = (TUser) session.getAttribute("loginuser");
        System.out.println(loginuser.getUsername());
        if (loginuser != null) {
            user.setUserid(loginuser.getUserid());
        }
        boolean row = userService.modifyUser(user);

        if (row) {

            return "login";
        } else {
            model.addAttribute("errMsg", "The user account and password are not correct");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }
    }

    @RequestMapping(value = "/changetype") //: /user/
    public String changetype(int userid, String username, int usertypeId, Model model) {
        TUser user = new TUser();

        user.setUsertypeId(usertypeId);
        if (userid != 0) {
            user.setUserid(userid);
        }
        boolean row = userService.modifyUser(user);

        if (row) {

            return "redirect:../user/getusers";

        } else {
            model.addAttribute("errMsg", "unsuccessful correct");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }
    }

    @RequestMapping(value = "/changepwd") //: /user/pwd
    public String changepwd(String username, String password, String password1, String password2, HttpServletRequest req,
                            Model model) {
        TUser user = new TUser();

        HttpSession session = req.getSession();
        TUser loginuser = (TUser) session.getAttribute("loginuser");
        System.out.println(loginuser.getUsername());
        if (password.equals(loginuser.getPassword())) {
            user.setUsername(username);
        } else {
            model.addAttribute("errMsg", "Old Password incorrect");
            model.addAttribute("backUrl", "../views/changepwd.jsp");
            return "errors";
        }
        if (password1.equals(password2)) {
            user.setPassword(password1);
        } else {
            model.addAttribute("errMsg", "New Passwords don't match incorrect");
            model.addAttribute("backUrl", "../views/changepwd.jsp");
            return "errors";
        }

        if (loginuser != null) {
            user.setUserid(loginuser.getUserid());
        }
        boolean row = userService.modifyUser(user);

        if (row) {
            session.removeAttribute("loginuser");
            return "login";
        } else {
            model.addAttribute("errMsg", "Password incorrect");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }
    }

    @RequestMapping(value = "/login") //: /user/login
    public String login(String username, String password, Model model, HttpServletRequest req) {
        TUser user = userService.login(username, password);

        if (user == null) {
            model.addAttribute("errMsg", "The user account and password are not correct");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        } else {
            model.addAttribute("loginuser", user);
            HttpSession session = req.getSession();
            session.setAttribute("loginuser", user);
            return "redirect:../project/getprojects";
        }
    }

    @RequestMapping(value = "/logout") //: /user/logout
    public String logout(HttpServletRequest req) {

        HttpSession session = req.getSession();
        session.removeAttribute("loginuser");
        return "login";
    }

    @RequestMapping(value = "/signup") //: /user/login
    public String signup(Model model) {

        List<TDepartment> list = departmentService.getDepartmentsSelective(null);
        model.addAttribute("depts", list);

        return "adduser";
    }

    @RequestMapping(value = "/getusers") //
    public String getEmployees(String search, Model model) {
        TUser user = new TUser();
        user.setFirstname(search);
        user.setLastname(search);
        user.setTelephone(search);
        user.setAddress(search);
        user.setEmail(search);

        List<TUser> list = userService.getUsersSelectiveOr(user);
        model.addAttribute("users", list);
        return "users";
    }

    @RequestMapping(value = "/getuser") //
    public String getUser(int userid, Model model, Model usertypeModel) {

        List<TUsertype> usertypes = usertypeService.getUsertypeSelective(null);

        TUser user = userService.getTUserByid(userid);
        usertypeModel.addAttribute("usertypes", usertypes);
        model.addAttribute("user", user);
        return "changeusertype";
    }
}
