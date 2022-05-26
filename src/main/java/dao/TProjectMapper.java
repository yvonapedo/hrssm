package dao;

import model.TProject;

import java.util.List;

public interface TProjectMapper {
    int deleteByPrimaryKey(Integer projectId);

    int insert(TProject record);

    int insertSelective(TProject record);

    TProject selectByPrimaryKey(Integer projectId);
    public List<TProject> selectBySelective(TProject record);
    int updateByPrimaryKeySelective(TProject record);

    int updateByPrimaryKey(TProject record);
}