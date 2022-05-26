package impl;

import mapperImpl.TProjectMapperImpl;
import model.TProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ProjectService;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {
    
    @Autowired
    private TProjectMapperImpl tProjectMapper;
    @Override
    public int deleteProject(int project_id) {
        return tProjectMapper.deleteByPrimaryKey(project_id);
    }

    @Override
    public int insertProject(TProject record) {
        return tProjectMapper.insertSelective(record);
    }

    @Override
    public TProject selectProjectById(int project_id) {
        return tProjectMapper.selectByPrimaryKey(project_id);
    }

    @Override
    public List<TProject> getProjectsSelective(TProject record) {
        return tProjectMapper.selectBySelective(record);
    }

    @Override
    public int updateProject(TProject record) {
        return tProjectMapper.updateByPrimaryKeySelective(record);
    }
}
