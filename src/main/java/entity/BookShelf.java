package entity;

public class BookShelf {

    private int id;
    private String roomId;

    public BookShelf() {
    }

    public BookShelf(int id, String roomId) {
        this.id = id;
        this.roomId = roomId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    @Override
    public String toString() {
        return "BookShelf{" +
                "id=" + id +
                ", roomId='" + roomId + '\'' +
                '}';
    }
}
