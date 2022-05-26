package mapperImpl;

import dao.TProjectMapper;
import model.TProject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TProjectMapperImpl implements TProjectMapper {
    //sqlSession session
    //SqlSessionFactory
    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer project_id) {
        session = sqlSessionFactory.openSession();
        int row = session.delete("dao.TProjectMapper.deleteByPrimaryKey", project_id);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insert(TProject record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TProjectMapper.insert", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insertSelective(TProject record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TProjectMapper.insertSelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public TProject selectByPrimaryKey(Integer project_id) {
        session = sqlSessionFactory.openSession();
        TProject project = session.selectOne("dao.TProjectMapper.selectByPrimaryKey", project_id);
        session.close();

        return project;
    }

    @Override
    public List<TProject> selectBySelective(TProject record) {
        session = sqlSessionFactory.openSession();
        List<TProject> list = session.selectList("dao.TProjectMapper.selectBySelective", record);
        session.close();
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(TProject record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TProjectMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int updateByPrimaryKey(TProject record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TProjectMapper.updateByPrimaryKey", record);
        session.commit();
        session.close();
        return row;
    }
}
