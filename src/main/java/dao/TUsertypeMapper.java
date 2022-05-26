package dao;

import model.TUsertype;

import java.util.List;

public interface TUsertypeMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(TUsertype record);

    int insertSelective(TUsertype record);

    TUsertype selectByPrimaryKey(Integer usertype_id);

    List<TUsertype> selectBySelective(TUsertype record);

    int updateByPrimaryKeySelective(TUsertype record);

    int updateByPrimaryKey(TUsertype record);
}