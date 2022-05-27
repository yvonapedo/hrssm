package impl;

import mapperImpl.TUsertypeMapperImpl;
import model.TUsertype;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class UsertypeServiceImplTest {

    @Autowired
    private TUsertypeMapperImpl tUsertypeMapper;

    @Test
    public void deleteUsertype() {
    }

    @Test
    public void insertUsertype() {
    }

    @Test
    public void selectUsertypeById() {
    }

    @Test
    public void getUsertypeSelective() {
        TUsertype usertype =new TUsertype();
        usertype.setUsertypeId(1);
        List<TUsertype> list = tUsertypeMapper.selectBySelective(usertype);
        System.out.println(list);
    }

    @Test
    public void updateUsertype() {
    }
}