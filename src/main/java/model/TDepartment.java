package model;

public class TDepartment {
    private Integer deptId;

    private String deptName;

    private String deptDescription;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getDeptDescription() {
        return deptDescription;
    }

    public void setDeptDescription(String deptDescription) {
        this.deptDescription = deptDescription == null ? null : deptDescription.trim();
    }

    @Override
    public String toString() {
        return "TDepartment{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", deptDescription='" + deptDescription + '\'' +
                '}';
    }
}