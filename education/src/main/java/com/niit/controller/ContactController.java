package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.ContactDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Contact;
import com.niit.model.User;

@Controller
public class ContactController {
	
	@Autowired
	private ContactDAO contactDAO;
	

	@Autowired
	private Contact contact;
	

	@RequestMapping(value="/contact_us",method=RequestMethod.POST)
	public ModelAndView contactUs(@ModelAttribute("contact") @Validated Contact contact,BindingResult result, Model model){
		
		System.out.println("hii");
		ModelAndView mv = new ModelAndView("/contact");
		if (result.hasErrors()) {
			

			
		} else {
			
		contactDAO.save(contact);
		
		mv.addObject("msg","User Send Message Successfully");
		
		}
List<Contact> contactList= contactDAO.list();
mv.addObject("contactList", contactList);
		return mv;
		
	}
	
	
}
