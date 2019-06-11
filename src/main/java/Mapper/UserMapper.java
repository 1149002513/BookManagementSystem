package Mapper;

import entity.Account;

public interface UserMapper {

    public Account getAccount(Account account);

    public void addAccount(Account account);

}
