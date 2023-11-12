package com.just.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.just.dao.TypeDao;
import com.just.pojo.Passage;
import com.just.pojo.Type;
import com.just.service.PassageService;
import com.just.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @Autowired
    private PassageService passageService;
    @GetMapping("/{page}")
    public Result selectAllType(@PathVariable Integer page){
        PageHelper.startPage(page, 10);
        List<Type> typeList = typeService.selectAllType();
        PageInfo<Type> typePageInfo = new PageInfo<>(typeList);
        List<Type> list = typePageInfo.getList();
        return new Result(null, list, null);
    }

    @GetMapping("/passage/{passageType}/{page}")
    public Result selectPassageByType(@PathVariable String passageType, @PathVariable int page) throws NoSuchFieldException {
        PageHelper.startPage(page, 5);
        List<Passage> passageList = typeService.selectPassageByType(passageType);
        PageInfo<Passage> passagePageInfo = new PageInfo<>(passageList);
        List<Passage> list = passagePageInfo.getList();
        return Result.getResult(null, list , null, Passage.IndexPassage.class);
    }

    @GetMapping("/passage/size/{passageType}")
    public Result selectPassageSizeByType(@PathVariable String  passageType) {
        return new Result(null, typeService.selectPassageByType(passageType).size(), null);
    }

    @GetMapping("/size")
    public Result selectTypeSize(){
        return new Result(null, typeService.selectAllType().size(), null);
    }
}
