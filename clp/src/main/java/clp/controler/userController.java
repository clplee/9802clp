package clp.controler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView test1(HttpServletRequest request) {
		System.out.println("����");
		ModelAndView modelAndView=new ModelAndView("index");
//		user user = userService.getById(1);
//		request.setAttribute("user",user);
		return modelAndView;
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
	//����û�
	@RequestMapping("add")
	public String  add(HttpServletRequest request){
		System.out.println("����");
		String name = request.getParameter("name");
		System.out.println(name);
		user user=new user();
		user.setName(name);
		userService.addUser(user);
		return "redirect:/userController/getall";
	}
	//�޸��û�
	@RequestMapping("update")
	public String update(HttpServletRequest request){
		String id=request.getParameter("Id");
		String name = request.getParameter("name");
		user user = userService.getById(Integer.parseInt(id));
		user.setName(name);
		userService.updateUser(user);
		return "redirect:/userController/getall";
	}
	
	
}
