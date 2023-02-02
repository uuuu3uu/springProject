package com.spring.green2209S_14;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/booking")
public class BookingController {
	
	/*
	 * @Autowired BookingService bookingService;
	 * 
	 * @Autowired BCryptPasswordEncoder passwordEncoder;
	 */
	
	@RequestMapping(value = "/bookingMenu", method=RequestMethod.GET)
	public String bookingMenuGet() {
				
		return "booking/bookingMenu";
	}
	
	@RequestMapping(value = "/booking", method=RequestMethod.GET)
	public String bookingGet() {
				
		return "booking/booking";
	}
	

	
}
