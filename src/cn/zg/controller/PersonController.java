package cn.zg.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zg.domain.Person;
import cn.zg.service.PersonService;

@Controller
public class PersonController {
	@Resource
	PersonService personService;
	
	//查询
	@RequestMapping("/person/list.action")
	public String list(Model model){
		List<Person> dataList = personService.find(null);
		model.addAttribute("dataList", dataList);	//传递列表集合到页面
		
		return "/person/jPersonList";
	}
}
