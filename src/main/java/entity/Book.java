package entity;

public class Book {

    private String id;
    private String name;
    private String cover;
    private String author;
    private Double price;
    private Integer count;
    private String uid; //用户id

    public Book() {
    }

    public Book(String id, String name, String cover, String author, Double price, Integer count, String uid) {
        this.id = id;
        this.name = name;
        this.cover = cover;
        this.author = author;
        this.price = price;
        this.count = count;
        this.uid = uid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
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

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "{" +
                "id:'" + id + '\'' +
                ", name:'" + name + '\'' +
                ", cover:'" + cover + '\'' +
                ", author:'" + author + '\'' +
                ", price:" + price +
                ", count:" + count +
                ", uid:'" + uid + '\'' +
                '}';
    }
}
