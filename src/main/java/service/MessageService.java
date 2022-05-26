package service;

import model.TMessage;

import java.util.List;

public interface MessageService {
    public int deleteMessage(int messageid);

    public int insertMessage(TMessage record);

    public TMessage selectMessageById(int messageid);

    public List<TMessage> getMessagesSelective(TMessage record);

    public int updateMessage(TMessage record);
}
