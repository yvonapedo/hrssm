package dao;

import model.TSalary;

import java.util.List;

public interface TSalaryMapper {
    int deleteByPrimaryKey(Integer salaryId);

    int insert(TSalary record);

    int insertSelective(TSalary record);

    TSalary selectByPrimaryKey(Integer salaryId);
    List<TSalary> selectBySelective(TSalary record);
    int updateByPrimaryKeySelective(TSalary record);

    int updateByPrimaryKey(TSalary record);
}