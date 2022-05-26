package impl;

import mapperImpl.TSalaryMapperImpl;
import model.TSalary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.SalaryService;

import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService {
    
    @Autowired
    private TSalaryMapperImpl tSalaryMapper;
    @Override
    public int deleteSalary(int salary_id) {
        return tSalaryMapper.deleteByPrimaryKey(salary_id);
    }

    @Override
    public int insertSalary(TSalary record) {
        return tSalaryMapper.insertSelective(record);
    }

    @Override
    public TSalary selectSalaryById(int salary_id) {
        return tSalaryMapper.selectByPrimaryKey(salary_id);
    }

    @Override
    public List<TSalary> getSalariesSelective(TSalary record) {
        return tSalaryMapper.selectBySelective(record);
    }

    @Override
    public int updateSalary(TSalary record) {
        return tSalaryMapper.updateByPrimaryKeySelective(record);
    }
}
