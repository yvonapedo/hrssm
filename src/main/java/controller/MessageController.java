package controller;

import model.TMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MessageService;

import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/addmessage") //
    public String addMessage( String subject, String content,
                              int senderid, int receiverid, Model model) throws ParseException {


        TMessage message = new TMessage();

        message.setSubject(subject);
        message.setContent(content);
        message.setSenderid(senderid);
        message.setReceiverid(receiverid);
        message.setStatus("sent");

        int row;
        row = messageService.insertMessage(message);


        if (row > 0) {
            return "redirect:../message/getmessages";
        } else {
            model.addAttribute("errMsg", "not successful");
            model.addAttribute("backUrl", "../views/login.jsp");
            return "errors";
        }
    }



    @RequestMapping(value = "/getmessages") //
    public String getMessages(Model model) {
        List<TMessage> list = messageService.getMessagesSelective(null);
        model.addAttribute("messages", list);
        return "messages";
    }

    @RequestMapping(value = "/getmessage") //
    public String getMessage(int messageid, Model model) {
        TMessage message = messageService.selectMessageById(messageid);
        model.addAttribute("message", message);
        return "replymessage";
    }
}