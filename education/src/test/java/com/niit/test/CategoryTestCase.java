package com.niit.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.CategoryDAO;
import com.niit.model.Category;

import junit.framework.Assert;

public class CategoryTestCase {
	
	@Autowired
	private static Category category;
	
	@Autowired
	private static CategoryDAO categoryDAO;
	
	@Autowired
	static AnnotationConfigApplicationContext  context;
	
	
	@BeforeClass
	public static void init()
	{
	 context = new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		
		category = (Category) context.getBean("category");
		
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
		
	}
	
	//TEST CASES
	
   @Test
	public void createCategoryTestCase()
	{
		category.setId("CG02032017");
		category.setName("Women Category");
		category.setDescription("This is Women category");
		
		 boolean flag = categoryDAO.save(category);
		 
		 //compare what you are excepting VS what you are getting from save method
		 
		 Assert.assertEquals( "createCategoryTestCase" ,true, flag);
		
		
	}
  // @Test
   public void updateCategoryTestCase()
   {
	   
	   category.setId("CG02032017");
	   category.setName("new Category");
	   category.setDescription("This is Women category");
	   
	   boolean flag = categoryDAO.update(category);
	   
	   Assert.assertEquals( "updateCategoryTestCase" ,true, flag);
	   
	   
   }
   
   
   
  // @Test
   public void deleteCategoryByIDTestCase()
   {
	   
	   boolean flag = categoryDAO.delete("CG02032017");
	   
	   Assert.assertEquals( "deleteCategoryByIDTestCase" ,true, flag);
	   
	   
	   
   }
   
  // @Test
   public void deleteCategory()
   {
	   category.setId("CG02032017");
	   
	   boolean flag = categoryDAO.delete(category);
	   
	   Assert.assertEquals( "deleteCategoryTestCase" ,true, flag);
	   
	   
	   
   }
   
   
  // @Test
   public void getCategoryByIDTestCase()
   {
	   
	  category = categoryDAO.getCategoryByID("CG01032017ABCD");
	  
	  
	 // Assert.assertNotNull("getCategoryByIDTestCase", category);
	  
	  
	  assertEquals("getCategoryByIDTestCase", null, category);
	   
   }
   
   
  // @Test
   public void getCategoryByNameTestCase()
   {
	   
	  category = categoryDAO.getCategoryByName("Mobile Category");
	  
	  
	 // Assert.assertNotNull("getCategoryByIDTestCase", category);
	  
	  
	  assertEquals("getCategoryByNameTestCase", null, category);
	   
   }
   
   
   @Test
   public void getAllCategoriesTestCase()
   
   {
	   
	  int recordsFromDAO =  categoryDAO.list().size();
	  
	  assertEquals("getAllCategoriesTestCase" ,7 , recordsFromDAO);
	   
   }
   
 }
