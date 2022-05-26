package service;

import model.TUsertype;

import java.util.List;

public interface UsertypeService {
    public int deleteUsertype(int usertype_id);

    public int insertUsertype(TUsertype record);

    public TUsertype selectUsertypeById(int usertype_id);

    public List<TUsertype> getUsertypeSelective(TUsertype record);

    public int updateUsertype(TUsertype record);
}
