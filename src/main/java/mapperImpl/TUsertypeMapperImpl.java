package mapperImpl;

import dao.TUsertypeMapper;
import model.TUsertype;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TUsertypeMapperImpl implements TUsertypeMapper {
    //sqlSession session
    //SqlSessionFactory
    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer usertype_id ) {
        session = sqlSessionFactory.openSession();
        int row = session.delete("dao.TUsertypeMapper.deleteByPrimaryKey", usertype_id);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insert(TUsertype record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TUsertypeMapper.insert", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insertSelective(TUsertype record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TUsertypeMapper.insertSelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public TUsertype selectByPrimaryKey(Integer usertype_id) {
        session = sqlSessionFactory.openSession();
        TUsertype usertype = session.selectOne("dao.TUsertypeMapper.selectByPrimaryKey", usertype_id);
        session.close();

        return usertype;
    }

    @Override
    public List<TUsertype> selectBySelective(TUsertype record) {
        session = sqlSessionFactory.openSession();
        List<TUsertype> list = session.selectList("dao.TUsertypeMapper.selectBySelective", record);
        session.close();
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(TUsertype record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TUsertypeMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int updateByPrimaryKey(TUsertype record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TUsertypeMapper.updateByPrimaryKey", record);
        session.commit();
        session.close();
        return row;
    }
}
