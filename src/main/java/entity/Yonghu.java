package entity;

import java.util.ArrayList;

public class Yonghu {

    private String id;
    private String name;
    private String password;
    private String avatar="/avatar/example.jpg";
    private Integer book_number=0;
    private Integer limit_y=0;
    private Integer active=0;
    private ArrayList<Book> books;

    public Yonghu() {
    }

    public Yonghu(String id, String name, String password, String avatar, Integer book_number, Integer limit_y, Integer active, ArrayList<Book> books) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.avatar = avatar;
        this.book_number = book_number;
        this.limit_y = limit_y;
        this.active = active;
        this.books = books;
    }

    public ArrayList<Book> getBooks() {
        return books;
    }

    public void setBooks(ArrayList<Book> books) {
        this.books = books;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getBook_number() {
        return book_number;
    }

    public void setBook_number(Integer book_number) {
        this.book_number = book_number;
    }

    public Integer getLimit_y() {
        return limit_y;
    }

    public void setLimit_y(Integer limit_y) {
        this.limit_y = limit_y;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(Integer active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "Yonghu{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", avatar='" + avatar + '\'' +
                ", book_number=" + book_number +
                ", limit_y=" + limit_y +
                ", active=" + active +
                ", books=" + books +
                '}';
    }
}
