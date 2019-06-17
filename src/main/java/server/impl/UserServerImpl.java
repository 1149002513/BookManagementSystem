package server.impl;

import Mapper.UserMapper;
import entity.Yonghu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import server.UserServer;

import java.util.UUID;

@Service
public class UserServerImpl implements UserServer {

    @Autowired
    UserMapper userMapper;

    @Override
    public Yonghu getYonghu(Yonghu yonghu) {
        Yonghu yonghu1 = userMapper.getAccount(yonghu);
        return yonghu1;
    }

    @Override
    public void addYonghu(Yonghu yonghu) {
        String id = UUID.randomUUID().toString().replace("-","");
        yonghu.setId(id);
        userMapper.addAccount(yonghu);
    }
}
