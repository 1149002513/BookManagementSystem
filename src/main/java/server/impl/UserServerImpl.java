package server.impl;

import Mapper.RecordMapper;
import Mapper.UserMapper;
import entity.Borrowingrecord;
import entity.Yonghu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import server.UserServer;

import java.util.ArrayList;
import java.util.UUID;

@Service
public class UserServerImpl implements UserServer {

    @Autowired
    UserMapper userMapper;

    @Autowired
    RecordMapper recordMapper;


    @Override
    public Yonghu getYonghu(Yonghu yonghu) {
        Yonghu yonghu1 = userMapper.getYonghu(yonghu);
        return yonghu1;
    }

    @Override
    public void addYonghu(Yonghu yonghu) {
        String id = UUID.randomUUID().toString().replace("-","");
        yonghu.setId(id);
        userMapper.addYonghu(yonghu);
    }

    @Override
    public Yonghu getBooks(Yonghu yonghu) {
        yonghu = userMapper.getBooks(yonghu);
        return yonghu;
    }

    @Override
    public ArrayList<Borrowingrecord> getRecord(String id) {

        ArrayList<Borrowingrecord> records = recordMapper.getRecord(id);

        return records;
    }
}
