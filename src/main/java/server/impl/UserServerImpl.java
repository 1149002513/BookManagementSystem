package server.impl;

import Mapper.BookMapper;
import Mapper.RecordMapper;
import Mapper.UserMapper;
import entity.Book;
import entity.Borrowingrecord;
import entity.Yonghu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import server.UserServer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.UUID;

@Service
public class UserServerImpl implements UserServer {

    @Autowired
    UserMapper userMapper;

    @Autowired
    RecordMapper recordMapper;

    @Autowired
    BookMapper bookMapper;


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

    @Override
    public ArrayList<Book> getAll() {
        ArrayList<Book> books = bookMapper.getAll();
        return books;
    }

    @Override
    public ArrayList<Book> searchAll(String search) {
        ArrayList<Book> books = bookMapper.searchAll(search);
        return books;
    }

    @Override
    public Timestamp getTime(String id) {

        Timestamp timestamp = recordMapper.getTime(id);
        return timestamp;
    }

    @Override
    public boolean judgeTimeOut(String id) {
        Timestamp timestamp = getTime(id);
        System.out.println(timestamp);
        if (timestamp==null){
            return true;
        }else {
            timestamp.setTime(timestamp.getTime()+1000L*60L*60L*24L*30L);
            Timestamp current = new Timestamp(System.currentTimeMillis());
            if (current.before(timestamp)){
                return true;
            }
        }
        return false;
    }

    @Override
    public int borrowBook(String uid, String bid) {
//        int affect = bookMapper.borrowBook(uid,bid);
        bookMapper.borrowBook(uid,bid);
        int affect = userMapper.brrowBook(uid);
        Borrowingrecord borrowingrecord = new Borrowingrecord();
        String rid = UUID.randomUUID().toString().replace("-","");
        borrowingrecord.setId(rid);
        borrowingrecord.setAccount_id(uid);
        borrowingrecord.setBook_id(bid);
        affect = recordMapper.addRecord(borrowingrecord);
        return affect;
    }

    @Override
    public int reBook(Borrowingrecord borrowingrecord) {

        int affect = bookMapper.re(borrowingrecord.getBook_id());
        affect = recordMapper.reRecord(borrowingrecord);
        return affect;
    }
}
