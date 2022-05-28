package controller;

import model.TMessage;
import model.TMessageSend;
import model.TUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MessageService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/message")
public class MessageController {
    @Autowired
    private MessageService messageService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/addmessage") //
    public String addMessage(String subject, String content,
                             String receiver, Model model, HttpServletRequest req) throws ParseException {

        TMessage message = new TMessage();
        message.setSubject(subject);
        message.setContent(content);

        //receiver
        TUser rec = new TUser();
        rec.setUsername(receiver);
        List<TUser> receiv = userService.getUsersSelective(rec);
        message.setReceiverid(receiv.get(0).getUserid());

        //sender
        HttpSession session = req.getSession();
        TUser user = (TUser) session.getAttribute("loginuser");
        System.out.println(user.getUsername());
        if (user != null) {
            message.setSenderid(user.getUserid());
        }

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

    @RequestMapping(value = "/getreceiver") //
    public String getreceiver(int receiverid, Model model) {
        TUser user = userService.getTUserByid(receiverid);

        model.addAttribute("user", user);
        return "addmessage";
    }

    @RequestMapping(value = "/sendmessage") //
    public String sendmessage(String subject, String content,
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
    public String getMessages(Model model, HttpServletRequest req) {

        TMessage message = new TMessage();

        HttpSession session = req.getSession();
        TUser user = (TUser) session.getAttribute("loginuser");
        System.out.println(user.getUsername());
        if (user != null) {
            message.setReceiverid(user.getUserid());
            message.setSenderid(user.getUserid());
        }

        List<TMessage> list = messageService.getMessagesSelectiveOr(message);
        List<TMessageSend> send = new ArrayList<>();
        for (TMessage msg : list
        ) {
            TMessageSend sender = new TMessageSend();

            sender.setMessageid(msg.getMessageid());
            sender.setSubject(msg.getSubject());
            sender.setSenderid(msg.getSenderid());
            sender.setContent(msg.getContent());
            sender.setSenderName(userService.getTUserByid(msg.getSenderid()).getFirstname() + " " + userService.getTUserByid(msg.getSenderid()).getLastname());
            sender.setReceiverid(msg.getReceiverid());
            sender.setReceiverName(userService.getTUserByid(msg.getReceiverid()).getFirstname() + " " + userService.getTUserByid(msg.getReceiverid()).getLastname());
            sender.setCreatetime(msg.getCreatetime());
            sender.setStatus(msg.getStatus());
            send.add(sender);
        }
        model.addAttribute("messages", send);

        return "messages";
    }

    @RequestMapping(value = "/getsentmessages") //
    public String getsentmessages(Model model, HttpServletRequest req) {

        TMessage message = new TMessage();

        HttpSession session = req.getSession();
        TUser user = (TUser) session.getAttribute("loginuser");
        System.out.println(user.getUsername());
        if (user != null) {
            message.setSenderid(user.getUserid());
        }

        List<TMessage> list = messageService.getMessagesSelective(message);
        List<TMessageSend> send = new ArrayList<>();
        for (TMessage msg : list
        ) {
            TMessageSend sender = new TMessageSend();

            sender.setMessageid(msg.getMessageid());
            sender.setSubject(msg.getSubject());
            sender.setSenderid(msg.getSenderid());
            sender.setContent(msg.getContent());
            sender.setSenderName(userService.getTUserByid(msg.getSenderid()).getFirstname() + " " + userService.getTUserByid(msg.getSenderid()).getLastname());
            sender.setReceiverid(msg.getReceiverid());
            sender.setReceiverName(userService.getTUserByid(msg.getReceiverid()).getFirstname() + " " + userService.getTUserByid(msg.getReceiverid()).getLastname());
            sender.setCreatetime(msg.getCreatetime());
            sender.setStatus(msg.getStatus());
            send.add(sender);
        }
        model.addAttribute("messages", send);

        return "messages";
    }

    @RequestMapping(value = "/getrecmessages") //
    public String getrecmessages(Model model, HttpServletRequest req) {

        TMessage message = new TMessage();

        HttpSession session = req.getSession();
        TUser user = (TUser) session.getAttribute("loginuser");
        System.out.println(user.getUsername());
        if (user != null) {
            message.setReceiverid(user.getUserid());
        }

        List<TMessage> list = messageService.getMessagesSelective(message);
        List<TMessageSend> send = new ArrayList<>();
        for (TMessage msg : list
        ) {
            TMessageSend sender = new TMessageSend();

            sender.setMessageid(msg.getMessageid());
            sender.setSubject(msg.getSubject());
            sender.setContent(msg.getContent());
            sender.setSenderid(msg.getSenderid());
            sender.setSenderName(userService.getTUserByid(msg.getSenderid()).getFirstname() + " " + userService.getTUserByid(msg.getSenderid()).getLastname());
            sender.setReceiverid(msg.getReceiverid());
            sender.setReceiverName(userService.getTUserByid(msg.getReceiverid()).getFirstname() + " " + userService.getTUserByid(msg.getReceiverid()).getLastname());
            sender.setCreatetime(msg.getCreatetime());
            sender.setStatus(msg.getStatus());
            send.add(sender);
        }
        model.addAttribute("messages", send);

        return "messages";
    }

    @RequestMapping(value = "/viewmessage") //
    public String viewMessage(int messageid, Model model) {

        TMessage message = messageService.selectMessageById(messageid);
        message.setStatus("read");
        int ro = messageService.updateMessage(message);
        model.addAttribute("message", message);
        return "viewmessage";
    }

    @RequestMapping(value = "/getmessage") //
    public String getMessage(int messageid, Model model, Model rmodel) {

        TMessage message = messageService.selectMessageById(messageid);

        TUser rec = new TUser();
        rec.setUserid(message.getReceiverid());

        List<TUser> list = userService.getUsersSelective(rec);
        message.setStatus("read");
        int ro = messageService.updateMessage(message);
        String sub = "RE: " + message.getSubject();
        message.setSubject(sub);

        rmodel.addAttribute("user", list.get(0));
        model.addAttribute("message", message);
        return "addmessage";
    }

    @RequestMapping(value = "/getunread") //
    public void getunread( Model model,  HttpServletRequest req) {
        TMessage message = new TMessage();
        message.setStatus("sent");

        HttpSession session = req.getSession();
        TUser user = (TUser) session.getAttribute("loginuser");
        System.out.println(user.getUsername());
        if (user != null) {
            message.setReceiverid(user.getUserid());
        }
       List<TMessage> list= messageService.getMessagesSelective(message);

        model.addAttribute("count", list.size());
//        return "sysmenu";
    }

    @RequestMapping(value = "/getuser") //
    public String getuser(int userid, Model model, Model rmodel) {

        TUser rec = new TUser();
        rec.setUserid(userid);
        List<TUser> list = userService.getUsersSelective(rec);
        rmodel.addAttribute("user", list.get(0));

        return "addmessage";
    }
}