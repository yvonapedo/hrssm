package impl;

import mapperImpl.TMessageMapperImpl;
import model.TMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.MessageService;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    
    @Autowired
    private TMessageMapperImpl tMessageMapper;
    @Override
    public int deleteMessage(int messageid) {
        return tMessageMapper.deleteByPrimaryKey(messageid);
    }

    @Override
    public int insertMessage(TMessage record) {
        return tMessageMapper.insertSelective(record);
    }

    @Override
    public TMessage selectMessageById(int messageid) {
        return tMessageMapper.selectByPrimaryKey(messageid);
    }

    @Override
    public List<TMessage> getMessagesSelective(TMessage record) {
        return tMessageMapper.selectBySelective(record);
    }

    @Override
    public int updateMessage(TMessage record) {
        return tMessageMapper.updateByPrimaryKeySelective(record);
    }
}
