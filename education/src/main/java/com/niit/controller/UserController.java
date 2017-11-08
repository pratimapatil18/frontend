package com.niit.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.MyCartDAO;
import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Category;
import com.niit.model.MyCart;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.User;

@Controller
public class UserController {

	public static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private MyCartDAO mycartDAO;

	//@Autowired
	//private MyCart myCart;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private CategoryDAO categoryDAO;	
@Autowired
private UserDAO userDAO;
	@Autowired
	private SupplierDAO supplierDAO;

	//@Autowired
	private Supplier supplier= new Supplier();

	//@Autowired
	private Product product= new Product();
	
	@Autowired
	private ProductDAO productDAO;
	

	// authentication-failure-forward-url="/loginError"
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Model model) {
		log.debug("Starting of the method loginError");
		model.addAttribute("msg", "Invalid Credentials.  Please try again.");
		model.addAttribute("invalidCredentials", "true");
		model.addAttribute("user",new User());
		log.debug("Ending of the method loginError");
		return "login";

	}

	// <security:access-denied-handler error-page="/accessDenied" />
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		log.debug("Starting of the method accessDenied");
		model.addAttribute("msg", "Please Login With Right Credentials to access this page");
		model.addAttribute("user",new User());
		log.debug("Ending of the method accessDenied");
		return "login";

	}
	// <security:form-login authentication-success-forward-url="/success"/>
	/*
	 * @RequestMapping("/success") public ModelAndView successForwardURL() {
	 * log.debug("Starting of the method successForwardURL"); ModelAndView mv =
	 * new ModelAndView("home");
	 * 
	 * Authentication auth =
	 * SecurityContextHolder.getContext().getAuthentication(); String
	 * loggedInUserid = auth.getName(); Collection<GrantedAuthority> authorities
	 * = (Collection<GrantedAuthority>) auth.getAuthorities(); if
	 * (authorities.contains("ROLE_ADMIN")) { mv.addObject("isAdmin", "true");
	 * log.debug("You are Admin"); } else { log.debug("You are not  Admin");
	 * mv.addObject("isAdmin", "false"); // myCart = cartDAO.list(userID);
	 * mv.addObject("myCart", myCart); // Fetch the myCart list based on user ID
	 * List<MyCart> cartList = cartDAO.list(loggedInUserid);
	 * mv.addObject("cartList", cartList); mv.addObject("cartSize",
	 * cartList.size()); }
	 * 
	 * log.debug("Ending of the method successForwardURL"); return mv;
	 * 
	 * }
	 */
/**
 * If we are using spring-security, this method is going to execute after login
 * @param request
 * @param response
 * @return
 * @throws Exception
 */
	@RequestMapping(value = "/validate",method=RequestMethod.GET)
	public ModelAndView validate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.debug("starting of the method validate");
		ModelAndView mv ;
		 session = request.getSession(true);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userID = auth.getName();
		Collection<? extends GrantedAuthority> authority=auth.getAuthorities();
		System.out.println(userID);
		session.setAttribute("loggedInUser", userID);
		session.setAttribute("LoginMessage", "WELCOME "+userDAO.getUserByMail(userID).getName());
		for (GrantedAuthority grantedAuthority : authority) {
			if(grantedAuthority.getAuthority().equals("ROLE_ADMIN")){
				mv= new ModelAndView("Admin/adminhome");
				session.setAttribute("isAdmin", true);
				return mv;
			}
			if(grantedAuthority.getAuthority().equals("ROLE_USER")){
				mv= new ModelAndView("home");
				session.setAttribute("isUser", true);
				return mv;
			}
		}
		mv= new ModelAndView("home");

		session.setAttribute("isAdmin", false);
		session.setAttribute("isUser", false);
		return mv;


	/*	if (request.isUserInRole("ADMIN")) {

			mv= new ModelAndView("Admin/adminhome");
			session.setAttribute("isAdmin", true);

		} else {
			mv= new ModelAndView("home");

			session.setAttribute("isAdmin", false);
			
			mv.addObject("myCart", myCart);
			// Fetch the myCart list based on user ID
			List<MyCart> mycartList = mycartDAO.list(userID);
			mv.addObject("cartList", mycartList);
			mv.addObject("cartSize", mycartList.size());
			mv.addObject("totalAmount", mycartDAO.getTotalAmount(userID));

			

		}
		log.debug("Ending of the method validate");
		return mv; */
	}
	
	
	@RequestMapping(value="/logout" ,method = RequestMethod.GET)
	public ModelAndView secureLogout(HttpServletRequest request,HttpServletResponse response)
	{
		/* Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if (auth != null) {
		 new SecurityContextLogoutHandler().logout(request, response, auth);
		 }*/
	 
		
	 session.removeAttribute("LoginMessage");
	 session.removeAttribute("isAdmin");
	
		ModelAndView mv = new ModelAndView("login");
	
		//After logout also use should able to browse the categories and products
		//as we invalidated the session, need to load these data again.
		
		session.setAttribute("category", new Category()); // domain object names
		session.setAttribute("product", new Product());
		session.setAttribute("supplier", new Supplier());
		
		
		session.setAttribute("categoryList", categoryDAO.list());
		
		session.setAttribute("supplierList", supplierDAO.list());
		
		session.setAttribute("productList", productDAO.list());
		
		
		//OR Simpley remove only one attribute from the session.
		
		//session.removeAttribute("loggedInUser"); // you no need to load categoriees,suppliers and products
	
		 mv.addObject("msg", "Logged Out Successfully");
		 mv.addObject("user", new User());
		 return mv;
		
	}
	
	
	@RequestMapping(value="/create_user",method=RequestMethod.POST)
	public ModelAndView userUs(@ModelAttribute("user") @Validated User user,BindingResult result, Model model){
		
		System.out.println("hii");
		ModelAndView mv = new ModelAndView("/login");
		if (result.hasErrors()) {
			

			
		} else {
		
			user.setRole("ROLE_USER");
		boolean created=userDAO.save(user);
		if(created)
		mv.addObject("msg","User Register Successfully");
		else
			mv.addObject("msg","User already Exists");
		
		}
List<User> userList= userDAO.list();
mv.addObject("userList", userList);
		return mv;
		
	}	
	
	
	
	
	
	
	
	
	
	

}