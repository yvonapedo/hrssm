package service;

import model.TSalary;

import java.util.List;

public interface SalaryService {
    public int deleteSalary(int salary_id);

    public int insertSalary(TSalary record);

    public TSalary selectSalaryById(int salary_id);

    public List<TSalary> getSalariesSelective(TSalary record);

    public int updateSalary(TSalary record);
}
