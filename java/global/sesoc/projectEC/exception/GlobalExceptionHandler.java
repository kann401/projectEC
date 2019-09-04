package global.sesoc.projectEC.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(Exception.class)
	public String errorHandler(Model model, Exception ex) {
		System.out.println("error 발생");
		model.addAttribute("msg", "ERROR");
		model.addAttribute("ex", ex);
		return "/exception/error";
	}
}
