package mapperImpl;

import dao.TSalaryMapper;
import model.TSalary;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TSalaryMapperImpl implements TSalaryMapper {
    //sqlSession session
    //SqlSessionFactory
    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer salary_id) {
        session = sqlSessionFactory.openSession();
        int row = session.delete("dao.TSalaryMapper.deleteByPrimaryKey", salary_id);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insert(TSalary record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TSalaryMapper.insert", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insertSelective(TSalary record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TSalaryMapper.insertSelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public TSalary selectByPrimaryKey(Integer salary_id) {
        session = sqlSessionFactory.openSession();
        TSalary salary = session.selectOne("dao.TSalaryMapper.selectByPrimaryKey", salary_id);
        session.close();

        return salary;
    }

    @Override
    public List<TSalary> selectBySelective(TSalary record) {
        session = sqlSessionFactory.openSession();
        List<TSalary> list = session.selectList("dao.TSalaryMapper.selectBySelective", record);
        session.close();
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(TSalary record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TSalaryMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int updateByPrimaryKey(TSalary record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TSalaryMapper.updateByPrimaryKey", record);
        session.commit();
        session.close();
        return row;
    }
}
