package com.soulmatt.lucky;

import java.io.IOException;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException {
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Document doc = Jsoup.connect("http://sports.yahoo.com/mlb/scoreboard?d=2013-06-10").get();
		Elements ele = doc.select(".ysp-dynamic");
		
		model.addAttribute("tbl", ele.toString());
		
		Document doc1 = Jsoup.connect("http://sports.yahoo.com/mlb/standings").get();
		Elements standingTbl = doc1.select("table.yspcontent table").eq(2);
		
		model.addAttribute("tbl", ele.toString());
		model.addAttribute("streak", standingTbl.toString());
		return "home";
	}
	
}
