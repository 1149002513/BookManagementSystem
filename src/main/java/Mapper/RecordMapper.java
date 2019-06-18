package Mapper;

import entity.Borrowingrecord;

import java.util.ArrayList;

public interface RecordMapper {

    public ArrayList<Borrowingrecord> getRecord(String id);
}
