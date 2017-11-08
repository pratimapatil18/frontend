package com.niit.controller;


import java.util.Collection;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.MyCartDAO;
import com.niit.dao.ProductDAO;
import com.niit.model.MyCart;
import com.niit.model.Product;

@Controller
public class CartController {
	Logger log = LoggerFactory.getLogger(CartController.class);
	@Autowired
	private MyCartDAO mycartDAO;

	//@Autowired
	private MyCart myCart= new MyCart();

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(value = {"/myCart","/allproducts"}, method = RequestMethod.GET)
	public String myCart(Model model) {
		
		
		// get the logged-in user id
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");

		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
			@SuppressWarnings("unchecked")
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)   auth.getAuthorities();
			authorities.contains("ROLE_USER");
			
		}
		if(loggedInUserid!=null)
		{

		int cartSize = mycartDAO.list(loggedInUserid).size();

		if (cartSize == 0) {
			model.addAttribute("msg", "You do not have any products in your Cart");
		} else {
			model.addAttribute("cartList", mycartDAO.list(loggedInUserid));
			model.addAttribute("totalAmount", mycartDAO.getTotalAmount(loggedInUserid));
			model.addAttribute("displayCart", "true");
			

		}
		
		}
		
		return "/cart";
	}

	// For add and update myCart both
	@RequestMapping(value = "/myCart/add/{id}", method = RequestMethod.GET)
	public ModelAndView addToCart(@PathVariable("id") String id) {
		log.debug("Starting of the method addToCart");
		// get the product based on product id
		Product product = productDAO.getProductByID(id);
		myCart.setPrice(product.getPrice());
		myCart.setProduct_name(product.getName());
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
		}
		myCart.setUser_name(loggedInUserid);
		//It is not required if you given default value while creating the table
		myCart.setStatus('N'); // Status is New. Once it is dispatched, we can
								// changed to 'D'
		
		//To get sequence number, you can do programmatically in DAOImpl
		//myCart.setId(ThreadLocalRandom.current().nextLong(100, 1000000 + 1));

		
		mycartDAO.save(myCart);
		// return "redirect:/views/home.jsp";

		ModelAndView mv = new ModelAndView("/Admin/product");
		mv.addObject("msg", " Successfuly added the product to myCart");
		mv.addObject("prd",new Product());  
		log.debug("Ending of the method addToCart");
		return mv;

	}

	@RequestMapping("/myCart/delete/{id}")
//	public ModelAndView deleteCategory(@PathVariable("id") String id, Model model) throws Exception {
	public String deletecart(@PathVariable("id") int id, Model model) throws Exception {
       
		
			boolean flag=mycartDAO.delete(id);
			
		if(flag == true)
		model.addAttribute("msg","Product Removed from cart Successfully");
		else
			model.addAttribute("msg","Product not Removed");
		



		return myCart(model);
		
	}
	
	
}
