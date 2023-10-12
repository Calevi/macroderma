package com.codingdojo.joaquin.controladores;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
            	
            	
            	
            	Path directorioImagenes = Paths.get("src/main/resources/static/img");
            	
            	String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();
                
            	try { 
            		byte[] bytesImg = image.getBytes();
            		Path rutaCompleta = Paths.get(rutaAbsoluta+"/"+image.getOriginalFilename());
            		Files.write(rutaCompleta, bytesImg);
            		
            		nuevoProducto.setImagen(image.getOriginalFilename());
            	} catch(IOException e) {
            		e.printStackTrace();
            	}
            }
            
            // Guarda el producto utilizando el servicio de productos
            serviciosProductos.guardarProducto(nuevoProducto);

            redirectAttributes.addFlashAttribute("mensaje", "Producto subido exitosamente.");
            System.out.println("Producto subido correctamente");
            
            return "redirect:/misproductos";
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
    public String editarProducto(@PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("producto") Producto producto) {
        
    	Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
        if (usuarioEnSesion == null) {
            return "redirect:/login";
        }
        
        Producto productoAEditar = serviciosProductos.encontrarProducto(id);
        
        model.addAttribute("producto", productoAEditar);
    	
        return "editarproducto.jsp";
    }
    
    
    @PutMapping("/actualizar/{id}")
    public String actualizarProducto(@Valid @ModelAttribute("producto") Producto producto, BindingResult result) {
    	
    	if(result.hasErrors()) {
    		return "editarproducto.jsp";
    	} else {
    		serviciosProductos.guardarProducto(producto);
    		return "redirect:/misproductos";
    	}
    	
    }
    
    
    

    @GetMapping("/eliminarproducto/{id}")
    public String eliminarProducto(@PathVariable("id") Long id) {
        
    	serviciosProductos.eliminarProducto(id);
    	
        return "redirect:/misproductos";
    }
    
    
	@GetMapping("/productos")
	public String Productos(Model model) {
		
		List<Producto> productos = serviciosProductos.obtenerTodosLosProductos();
		model.addAttribute("productos", productos);
		
		return "productos.jsp";
	}
	
	@GetMapping("/verproducto/{id}")
	public String verproducto(@PathVariable("id") Long id, Model model) {
		
		Producto productoBuscado = serviciosProductos.encontrarProducto(id);
		model.addAttribute("producto", productoBuscado);
		
		return "productoencontrado.jsp";
		
	}
	
	
	@GetMapping("/agregarcarrito/{id}")
	public String agregarcarrito(@PathVariable("id") Long id, HttpSession session) {
		List<Object> carrito = (List<Object>) session.getAttribute("carrito");
        if (carrito == null) {
        	carrito = new ArrayList<>();
            session.setAttribute("carrito", carrito);
        }
        
        //Obtener el obj producto
        Producto productoBuscado = serviciosProductos.encontrarProducto(id);
        carrito.add(productoBuscado);
        session.setAttribute("carrito", carrito);
        
        return "redirect:/verproducto/{id}";
        
	}
	
	@GetMapping("/carrito")
	public String carrito() {
		return "carrito.jsp";
	}
	
    
}
