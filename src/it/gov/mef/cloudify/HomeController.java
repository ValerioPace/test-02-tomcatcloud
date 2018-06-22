package it.gov.mef.cloudify;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@Value("spring.rest.serviceUrl")
	private String serviceUrl;
	
	@RequestMapping("/")
	public String homePage(Model model) {
		
		model.addAttribute("serviceUrl", serviceUrl);
		
		return "noipa_spa";
	}
}
