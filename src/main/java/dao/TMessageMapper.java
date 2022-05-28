package dao;

import model.TMessage;

import java.util.List;

public interface TMessageMapper {
    int deleteByPrimaryKey(Integer messageid);

    int insert(TMessage record);

    int insertSelective(TMessage record);

    TMessage selectByPrimaryKey(Integer messageid);

    List<TMessage> selectBySelective(TMessage record);

    List<TMessage> selectBySelectiveOr(TMessage record);

    int updateByPrimaryKeySelective(TMessage record);

    int updateByPrimaryKey(TMessage record);
}