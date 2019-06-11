package entity;

public class Account {

    private String id;
    private String name;
    private String password;
    private String avatar;
    private Integer book_number;
    private Integer limit_y;

    public Account() {
    }

    public Account(String id, String name, String password, String avatar, Integer book_number, Integer limit_y) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.avatar = avatar;
        this.book_number = book_number;
        this.limit_y = limit_y;
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

    @Override
    public String toString() {
        return "entity.Account{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", avatar='" + avatar + '\'' +
                ", book_number=" + book_number +
                ", limit_y=" + limit_y +
                '}';
    }
}
