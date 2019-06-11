package entity;

import java.sql.Timestamp;

public class Borrowingrecord {

    private String id;
    private String book_id;
    private String account_id;
    private Timestamp lend_time;
    private Integer re;

    public Borrowingrecord() {
    }

    public Borrowingrecord(String id, String book_id, String account_id, Timestamp lend_time, Integer re) {
        this.id = id;
        this.book_id = book_id;
        this.account_id = account_id;
        this.lend_time = lend_time;
        this.re = re;
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

    public Integer getRe() {
        return re;
    }

    public void setRe(Integer re) {
        this.re = re;
    }

    @Override
    public String toString() {
        return "entity.Borrowingrecord{" +
                "id='" + id + '\'' +
                ", book_id='" + book_id + '\'' +
                ", account_id='" + account_id + '\'' +
                ", lend_time=" + lend_time +
                ", re=" + re +
                '}';
    }
}
