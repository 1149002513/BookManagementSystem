import java.sql.Timestamp;

public class test {
    public static void main(String[] args) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println(timestamp);
        timestamp.setTime(timestamp.getTime()+1000L*60L*60L*24L*30L);
        System.out.println(timestamp);
    }
}
