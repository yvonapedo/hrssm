package mapperImpl;

import dao.TMessageMapper;
import model.TMessage;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TMessageMapperImpl implements TMessageMapper {
    //sqlSession session
    //SqlSessionFactory
    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer messageid) {
        session = sqlSessionFactory.openSession();
        int row = session.delete("dao.TMessageMapper.deleteByPrimaryKey", messageid);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insert(TMessage record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TMessageMapper.insert", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int insertSelective(TMessage record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("dao.TMessageMapper.insertSelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public TMessage selectByPrimaryKey(Integer messageid) {
        session = sqlSessionFactory.openSession();
        TMessage message = session.selectOne("dao.TMessageMapper.selectByPrimaryKey", messageid);
        session.close();

        return message;
    }

    @Override
    public List<TMessage> selectBySelective(TMessage record) {
        session = sqlSessionFactory.openSession();
        List<TMessage> list = session.selectList("dao.TMessageMapper.selectBySelective", record);
        session.close();
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(TMessage record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TMessageMapper.updateByPrimaryKeySelective", record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int updateByPrimaryKey(TMessage record) {
        session = sqlSessionFactory.openSession();

        int row = session.update("dao.TMessageMapper.updateByPrimaryKey", record);
        session.commit();
        session.close();
        return row;
    }
}
