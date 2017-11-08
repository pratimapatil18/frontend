package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ContactDAO;
import com.niit.dao.DebitCardDAO;
import com.niit.dao.MyCartDAO;
import com.niit.dao.OrdersDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.ShippingDAO;
import com.niit.dao.SupplierDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Category;
import com.niit.model.Contact;
import com.niit.model.DebitCard;
import com.niit.model.MyCart;
import com.niit.model.Orders;
import com.niit.model.Product;
import com.niit.model.Shipping;
import com.niit.model.Supplier;
import com.niit.model.User;

@Controller
public class HomeController {
	
	Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HttpSession session;
	@Autowired
	ProductDAO productDao;
	@Autowired
	UserDAO userDAO;
	@Autowired
	User user;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	ContactDAO contactDAO;
	@Autowired
	ShippingDAO shippingDAO;
	@Autowired
	DebitCardDAO debitcardDAO;
	@Autowired
	MyCartDAO mycartDAO;
	
	
	
	@RequestMapping("/")
	public ModelAndView onLoad() {
		log.debug("Starting of the method onLoad");
		ModelAndView mv = new ModelAndView("/home");
		session.setAttribute("category", new Category()); // domain object names
		session.setAttribute("product", new Product());
		session.setAttribute("supplier",new Supplier());
		
		
		session.setAttribute("categoryList", categoryDAO.list());
		
		session.setAttribute("supplierList", supplierDAO.list());
		
		session.setAttribute("productList", productDao.list());
	



		log.debug("Ending of the method onLoad");
		return mv;
	}

	
	
	
	@RequestMapping("/home")
	public ModelAndView home()
	{
		
		log.debug("Starting of the method home");
		ModelAndView mv=new ModelAndView("home");
		mv.addObject("isUserClickedHome","true");
		log.debug("Ending of the method home");
		return mv;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView showlogin()
	{
		log.debug("Starting of the method login");
		//specify which page you have to navigation
		System.out.println("display login page");
		ModelAndView mv=new ModelAndView("login");
		mv.addObject("user", user);
		mv.addObject("isUserClickedLoginHere", "true");
		log.debug("Ending of the method login");
		return mv;
	
		

		
		
	}
	
	@RequestMapping("/contact")
	public ModelAndView showcontact()
	{

		//specify which page you have to navigation
		ModelAndView mv=new ModelAndView("contact");
		mv.addObject("contact",new Contact());
		mv.addObject("isUserClickedContact", "true");
		return mv;
	
	}
	
	@RequestMapping("/shipping")
	public ModelAndView showshipping()
	{

		//specify which page you have to navigation
		ModelAndView mv=new ModelAndView("shipping");
		mv.addObject("shipping",new Shipping());
		mv.addObject("isUserClickedShipping", "true");
		return mv;
	
	}
	
	
	@RequestMapping("/about")
	public ModelAndView showaboutus()
	{
		//specify which page you have to navigation
		ModelAndView mv=new ModelAndView("about");
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/showAll")
	public ModelAndView showAll(){
		System.out.println("show all pages");
		List<Product> lt = productDao.list();
		ModelAndView md = new ModelAndView("showAll","prdList",lt);
		return md;
	}
		
	@RequestMapping("/Admin/adminhome")
	public ModelAndView myadmin()
	{
		
	ModelAndView mv=new ModelAndView("/Admin/adminhome");
			return mv;
	}
	
	@RequestMapping(value="/search")
	public ModelAndView search(@RequestParam("name") String name)
	{
		
		List<Product> pd=productDao.Search(name);
		ModelAndView mv= new ModelAndView("/Admin/product","productList",pd);
		return mv;
		
	}
	
		
}
