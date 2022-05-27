package impl;

import mapperImpl.TUsertypeMapperImpl;
import model.TUsertype;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UsertypeService;

import java.util.List;

@Service
public class UsertypeServiceImpl implements UsertypeService {

    @Autowired
    private TUsertypeMapperImpl tUsertypeMapper;
    @Override
    public int deleteUsertype(int usertype_id) {
        return tUsertypeMapper.deleteByPrimaryKey(usertype_id);
    }

    @Override
    public int insertUsertype(TUsertype record) {
        return tUsertypeMapper.insertSelective(record);
    }

    @Override
    public TUsertype selectUsertypeById(int usertype_id) {
        return tUsertypeMapper.selectByPrimaryKey(usertype_id);
    }

    @Override
    public List<TUsertype> getUsertypeSelective(TUsertype record) {
        return tUsertypeMapper.selectBySelective(record);
    }

    @Override
    public int updateUsertype(TUsertype record) {
        return tUsertypeMapper.updateByPrimaryKeySelective(record);
    }
}
