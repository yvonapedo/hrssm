package impl;

import mapperImpl.TUserMapperImpl;
import model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private TUserMapperImpl tUserMapperImpl;

    @Override
    public int deleteUser(Integer username) {

        return tUserMapperImpl.deleteByPrimaryKey(username);
    }

    @Override
    public TUser login(String username, String pwd) {
        TUser user = new TUser();
        user.setUsername(username);
        user.setPassword(pwd);
        List<TUser> list = tUserMapperImpl.selectBySelective(user);

        if (list.size() > 0) {
            return list.get(0);
        } else return null;
    }

    @Override
    public boolean isUsernameValid(String username) {

        TUser user = new TUser();
        user.setUsername(username);

        List<TUser> list = tUserMapperImpl.selectBySelective(user);

        if (list.size() > 0) {
            return true;
        } else return false;
    }

    @Override
    public boolean registerUser(TUser user) {
        int row = tUserMapperImpl.insertSelective(user);
        if (row > 0) {
            return true;
        } else return false;
    }

    @Override
    public boolean modifyUser(TUser user) {
        int row = tUserMapperImpl.updateByPrimaryKeySelective(user);
        if (row > 0) {
            return true;
        } else return false;
    }

    @Override
    public TUser getTUserByid(int userid) {

        return tUserMapperImpl.selectByPrimaryKey(userid);
    }
    @Override
    public List<TUser> getUsersSelective(TUser record) {
        return   tUserMapperImpl.selectBySelective(record);
    }
    @Override
    public List<TUser> getUsersSelectiveOr(TUser record) {
        return   tUserMapperImpl.selectBySelectiveOr(record);
    }
}
