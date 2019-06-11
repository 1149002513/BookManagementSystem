package Mapper;

import entity.Book;

public interface BookMapper {

    public void addBook(Book book);

    public void borrowBook(String id);

    public void re(String id);
}
