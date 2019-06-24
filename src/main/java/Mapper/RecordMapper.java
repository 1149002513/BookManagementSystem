package Mapper;

import entity.Borrowingrecord;

import java.sql.Timestamp;
import java.util.ArrayList;

public interface RecordMapper {

    public ArrayList<Borrowingrecord> getRecord(String id);

//    获取一个用户最早的且未归换的借阅时间
    public Timestamp getTime(String id);

//    增加借阅记录
    public int addRecord(Borrowingrecord borrowingrecord);

//    还书更新借阅记录
    public int reRecord(Borrowingrecord borrowingrecord);
}
