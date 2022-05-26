package model;

public class TUsertype {
    private Integer usertypeId;

    private String usertypeDesc;

    private String usertype;

    public Integer getUsertypeId() {
        return usertypeId;
    }

    public void setUsertypeId(Integer usertypeId) {
        this.usertypeId = usertypeId;
    }

    public String getUsertypeDesc() {
        return usertypeDesc;
    }

    public void setUsertypeDesc(String usertypeDesc) {
        this.usertypeDesc = usertypeDesc == null ? null : usertypeDesc.trim();
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }
}