package controller;

import model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register") //: /user/register
    public String registerUser(String username, String firstname, String lastname, String dob, String telephone,
                               String email, String address, String hiredate, int deptid,String photourl,
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
        return "redirect:../project/getprojects";
    }
}
