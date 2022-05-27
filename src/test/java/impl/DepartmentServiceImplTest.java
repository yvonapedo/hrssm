package impl;

import model.TDepartment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DepartmentServiceImplTest {

    @Autowired
    private DepartmentServiceImpl departmentService;
    @Test
    public void deleteDepartment() {
    }

    @Test
    public void insertDepartment() {
    }

    @Test
    public void selectDepartmentById() {
        TDepartment list = departmentService.selectDepartmentById(1);
        System.out.println(list);
    }

    @Test
    public void getDepartmentsSelective() {
        TDepartment department =new TDepartment();
        department.setDeptId(1);
        List<TDepartment> list = departmentService.getDepartmentsSelective(department);
        System.out.println(list);

    }

    @Test
    public void updateDepartment() {
    }
}