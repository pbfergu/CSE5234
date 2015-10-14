package edu.osu.cse5234.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.model.PaymentInfo;

@Controller
@RequestMapping("/")
public class Homepage {
	@RequestMapping(method = RequestMethod.GET)
	public String viewHomePage(HttpServletRequest request, HttpServletResponse response) {
		return "home";
	}
	
	@RequestMapping(path = "/aboutus", method = RequestMethod.GET)
	public String viewAboutUsPage(HttpServletRequest request, HttpServletResponse response) {
		return "AboutUs";
	}
	
	@RequestMapping(path = "/contactus", method = RequestMethod.GET)
	public String viewContactUsPage(HttpServletRequest request, HttpServletResponse response) {
		return "ContactUs";
	}
}
