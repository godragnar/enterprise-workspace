package com.wipro.velocity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloWorldController {
	/* Work Flow of Spring MVC Application
    *
    *   Client --> Request(index.jsp) --> FrontController(Web.xml)
    *       -->Controller(HelloWorldController) ---> response(helloWorld.jsp)
    *
    */
      
   @RequestMapping("/Kiran")
   public String showHello()
   {
       return "helloWorld";  //returns view name
   }

   @RequestMapping("/mytest")
   public String showPage()
   {
       return "test";  //returns view name
   }

}
