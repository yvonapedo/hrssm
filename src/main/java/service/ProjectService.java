package service;

import model.TProject;

import java.util.List;

public interface ProjectService {
    public int deleteProject(int project_id);

    public int insertProject(TProject record);

    public TProject selectProjectById(int project_id);

    public List<TProject> getProjectsSelective(TProject record);

    public int updateProject(TProject record);
}
