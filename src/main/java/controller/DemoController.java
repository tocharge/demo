package controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created on 2021/6/22 11:16 上午
 * <p>Title:[模块名]/p>
 * <p>Description:[描述该类概要功能介
 * 绍]</p>
 *
 * @author 涂帅
 * @version 1.0
 */
@RestController
public class DemoController {

    @GetMapping("/hello")
    public String demo() {
        return "hello world";
    }
}
