package dummy.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ChartsController {
	
	@Autowired
	ModelAndView mv;
 
	@GetMapping("/LineCharts")
	public ModelAndView chart(ModelMap model) {

		Integer northeastSales = 17089;
		Integer westSales = 10603;
		Integer midwestSales = 5223;
		Integer southSales = 10111;

		model.addAttribute("northeastSales", northeastSales);
		model.addAttribute("southSales", southSales);
		model.addAttribute("midwestSales", midwestSales);
		model.addAttribute("westSales", westSales);

		List<Integer> inshoreSales = Arrays.asList(4074, 3455, 4112);
		List<Integer> nearshoreSales = Arrays.asList(3222, 3011, 3788);
		List<Integer> offshoreSales = Arrays.asList(7811, 7098, 6455);

		model.addAttribute("inshoreSales", inshoreSales);
		model.addAttribute("nearshoreSales", nearshoreSales);
		model.addAttribute("offshoreSales", offshoreSales);

		return new ModelAndView("LineCharts",model);
	}
    
    
    @GetMapping("/")
    public ModelAndView home(ModelMap model) {
		return new ModelAndView("redirect:LineCharts",model);
    }
}
