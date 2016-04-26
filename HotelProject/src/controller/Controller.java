package controller;
//컨트롤러
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	public ModelAndView execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;	
     
}

