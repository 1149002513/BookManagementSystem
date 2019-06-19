package Mapper;

import entity.Book;

import java.util.ArrayList;

public interface BookMapper {

    public void addBook(Book book);

    public void borrowBook(String id);

    public void re(String id);

    public ArrayList<Book> getAll();

    public ArrayList<Book> searchAll(String search);
}
