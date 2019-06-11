package server.impl;

import Mapper.UserMapper;
import entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import server.UserServer;

import java.util.UUID;

@Service
public class UserServerImpl implements UserServer {

    @Autowired
    UserMapper userMapper;

    @Override
    public Account getAccount(Account account) {
        Account account1 = userMapper.getAccount(account);
        return account1;
    }

    @Override
    public void addAccount(Account account) {
        String id = UUID.randomUUID().toString().replace("-","");
        account.setId(id);
        userMapper.addAccount(account);
    }
}
