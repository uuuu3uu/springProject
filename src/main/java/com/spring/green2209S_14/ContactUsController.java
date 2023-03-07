package com.spring.green2209S_14;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/contactUs")
public class ContactUsController {


	@RequestMapping(value = "/contactUs", method = RequestMethod.GET)
	public String contactUsGet() {

		return "contactUs/contactUs";
	}

	
}
