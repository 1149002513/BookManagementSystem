package server;

import entity.Borrowingrecord;
import entity.Yonghu;

import java.util.ArrayList;


public interface UserServer {

    public Yonghu getYonghu(Yonghu yonghu);

    public void addYonghu(Yonghu yonghu);

    public Yonghu getBooks(Yonghu yonghu);

    public ArrayList<Borrowingrecord> getRecord(String id);

}
