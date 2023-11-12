package com.just.service;

import com.just.pojo.Passage;
import com.just.pojo.Type;

import java.util.List;

public interface TypeService {
    public List<Type> selectAllType();

    public List<Passage> selectPassageByType(String type);
}
