package Mapper;

import entity.Yonghu;

public interface UserMapper {

    public Yonghu getYonghu(Yonghu yonghu);

    public void addYonghu(Yonghu yonghu);

    public Yonghu getBooks(Yonghu yonghu);

}
