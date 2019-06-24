package Mapper;

import entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BookMapper {

    public void addBook(Book book);

    public int borrowBook(@Param("uid") String uid, @Param("bid") String bid);

    public int re(String id);

    public ArrayList<Book> getAll();

    public ArrayList<Book> searchAll(String search);
}
