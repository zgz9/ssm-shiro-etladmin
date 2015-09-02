package cn.zg.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/member")
//会员中心要被拦截
public class IndexController {
	// 拦截/index.htm 方法为GET的请求
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView();
		view.setViewName("/member/index");
		return view;
	}
}
