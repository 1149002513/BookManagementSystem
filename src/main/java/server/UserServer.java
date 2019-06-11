package server;

import Mapper.UserMapper;
import entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface UserServer {

    public Account getAccount(Account account);

    public void addAccount(Account account);
}
