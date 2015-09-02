package cn.zg.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.zg.domain.Role;
import cn.zg.domain.User;

@Controller
public class LoginController {
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("redirect:/login.jsp");
	}

	@RequestMapping(value = "/loginSubmit", method = RequestMethod.POST)
	public ModelAndView submit(String username, String password) {
		User user = new User("shiro", "123456");
		user.setRole(new Role("member"));
		try {
			// 如果登陆成功
			if (user.getName().equals(username)
					&& user.getPassword().equals(password)) {
				UsernamePasswordToken token = new UsernamePasswordToken(
						user.getName(), user.getPassword().toString());
				Subject subject = SecurityUtils.getSubject();
				//使用权限工具进行用户登录，登录成功后跳到shiro配置的successUrl中，与下面的return没什么关系！
				subject.login(token);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("/index");
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(RedirectAttributes redirectAttributs){
		//使用权限管理工具进行用户的退出，跳出登录，给出提示信息
		SecurityUtils.getSubject().logout();
		redirectAttributs.addFlashAttribute("message","您已安全退出");
		return null;
	}
	
	@RequestMapping("/403")
	public String unauthorizedRole(){
		return "/error.htm";
	}
}
