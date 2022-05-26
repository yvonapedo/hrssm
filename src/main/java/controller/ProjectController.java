package controller;

import model.TProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ProjectService;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/addproject") //
    public String addProject(String projectTitle, String issueDate, String dueDate, int managerId,
                             int employeeId, String status, String remarks, Model model) throws ParseException {

        TProject project = new TProject();

        project.setProjectTitle(projectTitle);
        project.setIssueDate(issueDate);
        project.setDueDate(dueDate);
        project.setManagerId(managerId);
        project.setEmployeeId(employeeId);
        project.setStatus(status);
        project.setRemarks(remarks);
        int row;
        row = projectService.insertProject(project);


        if (row > 0) {
            return "redirect:../project/getprojects";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }

    }

    @RequestMapping(value = "/editproject") //
    public String editProject(int projectId, String projectTitle, String issueDate, String dueDate, int managerId,
                              int employeeId, String status, String remarks, Model model) throws ParseException {

        TProject project = new TProject();
        project.setProjectTitle(projectTitle);
        project.setIssueDate(issueDate);
        project.setDueDate(dueDate);
        project.setManagerId(managerId);
        project.setEmployeeId(employeeId);
        project.setStatus(status);
        project.setRemarks(remarks);
        project.setProjectId(projectId);

        int row = projectService.updateProject(project);

        if (row > 0) {
            return "redirect:../project/getprojects";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }

    }

    @RequestMapping(value = "/getprojects") //
    public String getProjects(String search,Model model) {
        TProject project = new TProject();
        project.setProjectTitle(search);

        List<TProject> list = projectService.getProjectsSelective(project);
        model.addAttribute("projects", list);
        return "index";
    }

    @RequestMapping(value = "/getproject") //
    public String getProject(int projectId, Model model) {
        TProject project = projectService.selectProjectById(projectId);
        model.addAttribute("project", project);
        return "editproject";
    }



}