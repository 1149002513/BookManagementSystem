package Mapper;

import entity.Yonghu;

public interface UserMapper {

    public Yonghu getYonghu(Yonghu yonghu);

    public void addYonghu(Yonghu yonghu);

    public Yonghu getBooks(Yonghu yonghu);

//    用户借书操作
    public int brrowBook(String id);

}
