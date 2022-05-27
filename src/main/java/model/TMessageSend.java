package model;

import java.util.Date;

public class TMessageSend {
    private Integer messageid;

    private String subject;

    private String content;

    private Integer senderid;
    private String senderName;

    private Integer receiverid;
    private String receiverName;

    private Date createtime;

    private String status;

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getSenderid() {
        return senderid;
    }

    public void setSenderid(Integer senderid) {
        this.senderid = senderid;
    }

    public Integer getReceiverid() {
        return receiverid;
    }

    public void setReceiverid(Integer receiverid) {
        this.receiverid = receiverid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }


    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    @Override
    public String toString() {
        return "TMessageSend{" +
                "messageid=" + messageid +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", senderid=" + senderid +
                ", senderName='" + senderName + '\'' +
                ", receiverid=" + receiverid +
                ", receiverName='" + receiverName + '\'' +
                ", createtime=" + createtime +
                ", status='" + status + '\'' +
                '}';
    }
}