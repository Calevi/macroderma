package com.codingdojo.joaquin.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.joaquin.enumeraciones.Rol;
import com.codingdojo.joaquin.modelos.Usuario;
import com.codingdojo.joaquin.servicios.ServiciosUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {
	
	@Autowired
	public ServiciosUsuarios servicioUsuarios;
	
	@GetMapping("/")
	public String home(Model model) {
		return "dashboard.jsp";
	}
	

	@GetMapping("/registrarse")
	public String register(@ModelAttribute("nuevoUsuario") Usuario nuevoUsuario) {
		return "register.jsp";
	
	}	
	
	@PostMapping("/registro")
	public String registro(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario, BindingResult result, HttpSession session) {
	    if (result.hasErrors()) {
	        return "register.jsp";
	    } else {
	        // Establecer el rol del nuevo usuario como "Usuario"
	        nuevoUsuario.setRol(Rol.USUARIO);
	        
	        // Registrar el usuario utilizando el servicio
	        servicioUsuarios.registrar(nuevoUsuario, result);
	        
	        if (result.hasErrors()) {
	            return "register.jsp";
	        } else {
	            session.setAttribute("usuarioEnSesion", nuevoUsuario);
	            return "redirect:/";
	        }
	    }
	}
	
	@GetMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	@PostMapping("/loguear")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, RedirectAttributes redirectAttributes, HttpSession session) {
		
		Usuario usuarioInicioSesion = servicioUsuarios.login(email, password);
		
		if(usuarioInicioSesion == null) {
			//Tiene algo incorrecto
			//Flash me permite enviar errores de validacion a un form clasico
			redirectAttributes.addFlashAttribute("error_login", "El correo/contraseña es incorrecto");
			return "redirect:/login";
		} else {
			//Guardamos en sesion al usuario que quiere iniciar sesion
			session.setAttribute("usuarioEnSesion", usuarioInicioSesion);
			return "redirect:/";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("usuarioEnSesion");
		return "redirect:/login";
	
		
}
	
	@GetMapping("/tratamientos")
	public String Tratamiento(Model model) {
		return "tratamientos.jsp";
	}
	
	@GetMapping("/PyP")
	public String PyP() {
		return "PyP.jsp";
	}
	
	@GetMapping("/condiciones")
	public String condiciones() {
		return "condiciones.jsp";
	}
	
	@GetMapping("/aviso")
	public String aviso() {
		return "aviso.jsp";
	}
	
	@GetMapping("/productos")
	public String Productos(Model model) {
		return "productos.jsp";
	}
}
