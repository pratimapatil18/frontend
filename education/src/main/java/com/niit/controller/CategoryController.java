package com.niit.controller;


import javax.servlet.http.HttpSession;

//import org.hibernate.annotations.common.util.impl.LoggerFactory;
//import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDAO;
import com.niit.model.Category;


@Controller
public class CategoryController {
	
	//private static Logger log = LoggerFactory.getLogger(CategoryController.class);

	@Autowired
	private HttpSession session;
	@Autowired
	private CategoryDAO categoryDAO;
	

	@RequestMapping(value="/Admin/create_category",method=RequestMethod.POST)
	public ModelAndView createCategory(@ModelAttribute("cat") @Validated Category category,BindingResult result, Model model){
		
		
		ModelAndView mv = new ModelAndView("/Admin/category");
		if (result.hasErrors()) {
			

			
		} else {
		categoryDAO.save(category);
		
		mv.addObject("msg","Category added Successfully");
		
		}
		session.setAttribute("categoryList", categoryDAO.list());
		return mv;
		
	}
	
	

	
	
	
	
	@RequestMapping(value="/Admin/category_edit",method=RequestMethod.POST)
	public ModelAndView editCategory(@ModelAttribute("cat") @Validated Category ct
			, BindingResult result, Model model){
	
		ModelAndView mv = new ModelAndView("/Admin/category");
		if (result.hasErrors()) {
			

			
		} else {
		categoryDAO.update(ct);
		
		mv.addObject("msg","Category updated Successfully");
	
		}
		session.setAttribute("categoryList", categoryDAO.list());
		return mv;
		
		
		
	}
	
	@RequestMapping(value="/Admin/manage_category_edit/{id}",method=RequestMethod.GET)
	public ModelAndView editCategory(@PathVariable("id") String id){
		ModelAndView mv = new ModelAndView("/Admin/category");
		Category ct=categoryDAO.getCategoryByID(id);
	
		
		mv.addObject("cat",ct); 
		mv.addObject("editing",true);
		return mv;
				
		
		
	}
	@RequestMapping("/Admin/category_delete/{id}")
//	public ModelAndView deleteCategory(@PathVariable("id") String id, Model model) throws Exception {
	public ModelAndView deleteCategory(@PathVariable("id") String id, Model model) throws Exception {

		ModelAndView mv = new ModelAndView("/Admin/category");
			boolean flag=categoryDAO.delete(id);
		if(flag = true)
		mv.addObject("msg","Category Deleted Successfully");
		else
			mv.addObject("msg","Category not Deleted");
		

mv.addObject("cat",new Category());
session.setAttribute("categoryList", categoryDAO.list());
		return mv;
		
	}
	
	
	
	
	
}

   