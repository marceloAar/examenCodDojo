//Marcelo Aceituno R
//Full Stack JAVA 0034
//Examen Coding Dojo

package com.mar.tvshow.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mar.tvshow.models.Show;
import com.mar.tvshow.models.User;
import com.mar.tvshow.services.ShowService;
import com.mar.tvshow.services.UserService;

@Controller
public class TvController {
	
	private final UserService userService;
	private final ShowService showService;	
	
	public TvController(UserService userService, ShowService showService) {
	    this.userService = userService;
	    this.showService = showService;
	}
	
	//ir a la pagina inicio
	@RequestMapping("/")
	public String inicio() {   		
		return "home.jsp";			
	}
	
	//ir a la pagina de registro
	@RequestMapping("/registration")
	public String registroUsuario(@ModelAttribute("user") User user) {
	    return "registration.jsp";
	}
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
	
		if(result.hasErrors()){
			return "registration.jsp";
		}		
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/";		
	}	
	
	//ir a la pagina de login
	@RequestMapping("/login")
	public String login() {
	    return "login.jsp";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
			
		boolean isAuthenticated = userService.authenticateUser(email, password);
		
		if (isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/show";
		}else {
			model.addAttribute("error", "No tiene credenciales, por favor intentelo denuevo");
			return "login.jsp";
		}		
	}	
	
	//ir a la pagina show
	@RequestMapping("/show")
	public String mostrar(@ModelAttribute("shows") Show show, Model model) {
		 List<Show> shows = showService.allUser();
	     model.addAttribute("shows", shows);
	     
	    return "show.jsp";
	}
	
	//ingresar nuevo show
	@RequestMapping("/nuevoShow")
	public String nuevoShow(@ModelAttribute("show") Show show) {
	    return "newShow.jsp";
	}
	
	@RequestMapping(value="/nuevoShow", method=RequestMethod.POST)
	public String crearShow(@Valid @ModelAttribute("show") Show show, BindingResult result, HttpSession session) {
	
		if(result.hasErrors()){
			return "newShow.jsp";
		}		
		else {
			showService.creaEditaShow(show);
			return "redirect:/show";	
		}
	}	
	
	//mostrar show		
	@RequestMapping("/mostrarShow/{id}")
	public String mostrarShow(@PathVariable("id") Long id, Model model) {
		Show show = showService.buscarShow(id);
		model.addAttribute("show", show);
		return "mostrarShow.jsp";
	}
		
	//editar show	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Show show = showService.buscarShow(id);
		model.addAttribute("show", show);
		return "editShow.jsp";
	}	
		 
	@RequestMapping(value="/edit/{id}", method=RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("show") Show show, BindingResult result) {
		if (result.hasErrors()) {
			return "editShow.jsp";
	    } else {
	    	showService.creaEditaShow(show);
	    	return "redirect:/show";
	    }
	}
	
	//eliminar show
    @RequestMapping("/delete/{id}")
    public String borrar(@PathVariable("id") Long id) {        
        showService.deleteShow(id);
        return "redirect:/show";
    } 	
	  
	//salir de la sesion	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {	   
		// invalidar la sesión
	    // redireccionar a la página de inicio de sesión.
		session.invalidate();
		return "redirect:/";		
	}	 

}
