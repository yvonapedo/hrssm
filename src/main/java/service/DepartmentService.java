package service;

import model.TDepartment;

import java.util.List;

public interface DepartmentService {
    public int deleteDepartment(int dept_id);

    public int insertDepartment(TDepartment record);

    public TDepartment selectDepartmentById(int dept_id);

    public List<TDepartment> getDepartmentsSelective(TDepartment record);

    public int updateDepartment(TDepartment record);
}
