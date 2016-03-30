package clp.controler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import clp.model.user;
import clp.service.userService;
@Controller
@RequestMapping("/userController")
public class userController {
	private userService userService;

	public userService getUserService() {
		return userService;
	}

	@Autowired
	public void setUserService(userService userService) {
		this.userService = userService;
	}

	@RequestMapping("/new")
	public String test1(HttpServletRequest request) {
		System.out.println("����");
		user user = userService.getById(1);
		request.setAttribute("user",user);
		return "index";
	}
	
	//������е��û�
	@RequestMapping("getall")
	public String all(HttpServletRequest request){
		List<user> all3 = userService.getAll();
		System.out.println(all3.size());
		request.setAttribute("users",all3);
		return "all";
	}
	
	//ɾ���û�
	@RequestMapping("delete")
	 public String delete(HttpServletRequest request){
		String parameter = request.getParameter("id");
		Integer idInteger=Integer.parseInt(parameter);
		user user = userService.getById(idInteger);
		userService.deleteUser(idInteger);
		return "redirect:/userController/getall";
	}
	
	@RequestMapping("add")
	public String  add(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		user user=new user();
		user.setId(id);
		user.setName(name);
		userService.addUser(user);
		return "redirect:/userController/getall";
	}
}
