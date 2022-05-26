package dao;

import model.TUser;

import java.util.List;

public interface TUserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(Integer userid);

    List<TUser> selectBySelective(TUser record);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}