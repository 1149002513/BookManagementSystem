package entity;

import java.sql.Timestamp;

public class Borrowingrecord {

    private String id;
    private String book_id;
    private String account_id;
    private Timestamp lend_time = new Timestamp(System.currentTimeMillis());
    private Timestamp re_time = null;

    private Book book;

    public Borrowingrecord() {
    }

    public Borrowingrecord(String id, String book_id, String account_id, Timestamp lend_time, Timestamp re_time, Book book) {
        this.id = id;
        this.book_id = book_id;
        this.account_id = account_id;
        this.lend_time = lend_time;
        this.re_time = re_time;
        this.book = book;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getAccount_id() {
        return account_id;
    }

    public void setAccount_id(String account_id) {
        this.account_id = account_id;
    }

    public Timestamp getLend_time() {
        return lend_time;
    }

    public void setLend_time(Timestamp lend_time) {
        this.lend_time = lend_time;
    }

    public Timestamp getRe_time() {
        return re_time;
    }

    public void setRe_time(Timestamp re_time) {
        this.re_time = re_time;
    }

    @Override
    public String toString() {
        return "Borrowingrecord{" +
                "id='" + id + '\'' +
                ", book_id='" + book_id + '\'' +
                ", account_id='" + account_id + '\'' +
                ", lend_time=" + lend_time +
                ", re_time=" + re_time +
                ", book=" + book +
                '}';
    }
}
