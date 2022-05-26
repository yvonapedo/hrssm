package mapperImpl;

import dao.TUserMapper;
import model.TUser;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TUserMapperImpl implements TUserMapper {
    //sqlSession session
    //SqlSessionFactory
    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer userid) {
        session = sqlSessionFactory.openSession();
        int row = session.delete("dao.TUserMapper.deleteByPrimaryKey", userid);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insert(TUser record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TUserMapper.insert", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insertSelective(TUser record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TUserMapper.insertSelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public TUser selectByPrimaryKey(Integer userid) {
        session = sqlSessionFactory.openSession();
        TUser user = session.selectOne("dao.TUserMapper.selectByPrimaryKey", userid);
        session.close();

        return user;
    }

    @Override
    public List<TUser> selectBySelective(TUser record) {
        session = sqlSessionFactory.openSession();
        List<TUser> list = session.selectList("dao.TUserMapper.selectBySelective", record);
        session.close();
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(TUser record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TUserMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int updateByPrimaryKey(TUser record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TUserMapper.updateByPrimaryKey", record);
        session.commit();
        session.close();
        return row;
    }
}
