package server;

import entity.Book;
import entity.Borrowingrecord;
import entity.Yonghu;

import java.sql.Timestamp;
import java.util.ArrayList;


public interface UserServer {

//    获取用户
    public Yonghu getYonghu(Yonghu yonghu);

//    申请账号
    public void addYonghu(Yonghu yonghu);

//    获取用户现在借阅的书籍
    public Yonghu getBooks(Yonghu yonghu);

//    获取一个用户所有借阅记录
    public ArrayList<Borrowingrecord> getRecord(String id);

//    获取所有书籍
    public ArrayList<Book> getAll();

//    全字段模糊查询
    public ArrayList<Book> searchAll(String search);

//    获取一个用户最早的且未归换的借阅时间
    public Timestamp getTime(String id);

//    判断用户借书未还是否超出期限,true代表未超时，false代表超时
    public boolean judgeTimeOut(String id);

//    借书操作
    public int borrowBook(String uid,String bid);

//    还书操作
    public int reBook(Borrowingrecord borrowingrecord);

//    查看具体的借阅记录
    public Borrowingrecord getRecordByUB(Borrowingrecord borrowingrecord);

}
