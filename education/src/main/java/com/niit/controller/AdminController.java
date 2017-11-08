package com.niit.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class AdminController {
	
	//@Autowired
CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	
	
	
	@RequestMapping("/Admin/manage_category")
	public ModelAndView manageCategory()
	{
		System.out.println("ManageCategories");
		//List<Category> ct = categoryDao.list();

		
		
		
		ModelAndView mv=new ModelAndView("/Admin/category");
		mv.addObject("isUserClickedCategories","true");
		
		
		mv.addObject("cat",new Category());     //To access the category domain in category */
		
return mv;
		
	}

	@RequestMapping(value={"/Admin/manage_products","/allProducts"})
	public ModelAndView manageProducts()
	{
		System.out.println("ManageProduct");
		ModelAndView mv=new ModelAndView("/Admin/product");
		mv.addObject("isUserClickedproducts","true");
		
      
		
		mv.addObject("prd",new Product());   
		
		
		return mv;
		
	}
	@RequestMapping("/Admin/manage_suppliers")
	public ModelAndView manageSuppliers()
	{
		System.out.println("ManageSppliers");
		ModelAndView mv=new ModelAndView("/Admin/supplier");
		mv.addObject("isUserClickedSuppliers","true");
		
       
		mv.addObject("sup",new Supplier());    
		
		return mv;
		
	}

}
