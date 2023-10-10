package com.codingdojo.joaquin.controladores;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.joaquin.modelos.Producto;
import com.codingdojo.joaquin.modelos.Usuario;
import com.codingdojo.joaquin.servicios.ServiciosProductos;
import com.codingdojo.joaquin.servicios.ServiciosUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorProductos {

    @Autowired
    private ServiciosUsuarios servicioUsuarios;

    @Autowired
    private ServiciosProductos serviciosProductos;

    @GetMapping("/subirproductos")
    public String mostrarFormularioProducto(@ModelAttribute("nuevoProducto") Producto nuevoProducto, Model model) {
        return "subirproducto.jsp";
    }

    @PostMapping("/nuevoproducto")
    public String subirProducto(@Valid @ModelAttribute("nuevoProducto") Producto nuevoProducto, BindingResult result,
                                @RequestParam("image") MultipartFile image, HttpSession session,
                                RedirectAttributes redirectAttributes)  {
    	
    	Usuario usuarioTemporal = (Usuario)session.getAttribute("usuarioEnSesion");
		if(usuarioTemporal == null) {
			return "redirect:/login";
		}
    	
    	
        if (result.hasErrors()) { System.out.println(result);
        							System.out.println(image.getName());
            return "subirproducto.jsp";
        } else {
            // Obtén el usuario en sesión
            Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");

            // Establece el usuario asociado con el producto
            nuevoProducto.setUsuario(usuarioEnSesion);

            // Guarda la imagen como un array de bytes
            if (!image.isEmpty()) {
            	
            	System.out.println("1");
            	
            	Path directorioImagenes = Paths.get("src/main/resources/static/img");
            	
            	String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();
                
            	try { System.out.println("2");
            		byte[] bytesImg = image.getBytes();
            		Path rutaCompleta = Paths.get(rutaAbsoluta+"/"+image.getOriginalFilename());
            		Files.write(rutaCompleta, bytesImg);
            		
            		nuevoProducto.setImagen(image.getOriginalFilename());
            	} catch(IOException e) {
            		e.printStackTrace();
            	}
            }
            System.out.println("3");
            // Guarda el producto utilizando el servicio de productos
            serviciosProductos.guardarProducto(nuevoProducto);

            redirectAttributes.addFlashAttribute("mensaje", "Producto subido exitosamente.");
            
            return "redirect:/subirproductos";
        }
    }
    
    
    @GetMapping("/misproductos")
    public String mostrarMisProductos(Model model, HttpSession session) {
        Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        if (usuarioEnSesion == null) {
            return "redirect:/login";
        }

        List<Producto> misProductos = serviciosProductos.obtenerTodosLosProductos();
        model.addAttribute("misProductos", misProductos);

        return "misproductos.jsp";
    }

    @GetMapping("/editarproducto/{id}")
    public String editarProducto(@RequestParam("id") Long id, Model model) {
        
        return "editarproducto.jsp";
    }

    @GetMapping("/eliminarproducto/{id}")
    public String eliminarProducto(@RequestParam("id") Long id) {
        
        return "redirect:/misproductos";
    }
}
