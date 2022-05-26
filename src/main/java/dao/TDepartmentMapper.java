package dao;

import model.TDepartment;

import java.util.List;

public interface TDepartmentMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(TDepartment record);

    int insertSelective(TDepartment record);

    TDepartment selectByPrimaryKey(Integer deptId);

    List<TDepartment> selectBySelective(TDepartment record);

    int updateByPrimaryKeySelective(TDepartment record);

    int updateByPrimaryKey(TDepartment record);
}