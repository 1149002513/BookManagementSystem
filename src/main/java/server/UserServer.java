package server;

import entity.Yonghu;


public interface UserServer {

    public Yonghu getYonghu(Yonghu yonghu);

    public void addYonghu(Yonghu yonghu);
}
