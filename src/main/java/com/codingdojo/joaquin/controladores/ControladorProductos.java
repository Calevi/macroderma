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

import com.codingdojo.joaquin.modelos.Pedido;
import com.codingdojo.joaquin.modelos.Producto;
import com.codingdojo.joaquin.modelos.Usuario;
import com.codingdojo.joaquin.servicios.ServiciosPedidos;
import com.codingdojo.joaquin.servicios.ServiciosProductos;
import com.codingdojo.joaquin.servicios.ServiciosUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorProductos {

	@Autowired
	private ServiciosPedidos serviciosPedidos;
	
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
	public String carrito(HttpSession session, Model model, @ModelAttribute("nuevaCompra") Pedido pedido) {
		
		// Obtener la lista de productos en el carrito desde la sesión
	    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
	    
	    // Calcular el total de los precios en el carrito
	    double total = 0;
	    if (carrito != null) {
	        for (Producto producto : carrito) {
	            total += producto.getPrecio();
	        }
	    }
	    
	    model.addAttribute("nuevaCompra", new Pedido());
	    // Pasar el carrito y el total al modelo
	    model.addAttribute("carrito", carrito);
	    model.addAttribute("total", total);
	    

		
		return "carrito.jsp";
	}
	
	@GetMapping("/busqueda")
	public String buscarProductosPorNombre(@RequestParam("nombre") String nombre, Model model) {
	    // Lógica para buscar productos por nombre
	    List<Producto> productosEncontrados = serviciosProductos.buscarPorNombre(nombre);
	    model.addAttribute("productos", productosEncontrados);
	    return "resultados.jsp"; // Página que muestra los resultados de la búsqueda
	}
	
	@PostMapping("/checkout")
	public String pagar(@ModelAttribute("nuevaCompra") Pedido pedido, BindingResult result, HttpSession session, RedirectAttributes redirectAttributes) {
	    // Validar el pedido
	    if (result.hasErrors()) {
	        // Manejar errores de validación si es necesario
	        return "carrito.jsp"; // Página del carrito con mensajes de error
	    }

	    // Obtener el usuario en sesión
	    Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioEnSesion == null) {
	        // Manejar caso donde el usuario no está en sesión
	        return "redirect:/login";
	    }

	    // Obtener los productos del carrito desde la sesión
	    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
	    if (carrito == null || carrito.isEmpty()) {
	        return "redirect:/carrito";
	    }

	    // Crear un nuevo pedido
	    Pedido nuevoPedido = new Pedido();
	    nuevoPedido.setUsuario(usuarioEnSesion);
	    nuevoPedido.setProductos(carrito);

	    // Guardar el pedido
	    serviciosPedidos.guardarPedido(nuevoPedido);

	    // Reducir el stock de los productos en el pedido según la cantidad en el carrito
	    if (nuevoPedido.getProductos() != null && !nuevoPedido.getProductos().isEmpty()) {
	        for (Producto producto : nuevoPedido.getProductos()) {
	            int cantidadEnCarrito = contarProductoEnCarrito(producto, carrito);
	            if (cantidadEnCarrito <= producto.getStock()) {
	                producto.vender(cantidadEnCarrito); // Reducir el stock según la cantidad en el carrito
	                serviciosProductos.guardarProducto(producto); // Guardar el producto actualizado en la base de datos
	            } else {
	                // Manejar caso donde la cantidad en el carrito es mayor que el stock disponible
	                // Puedes manejar esto según tus requisitos, por ejemplo, mostrando un mensaje de error al usuario.
	            }
	        }
	    }

	    // Limpiar el carrito de la sesión
	    session.removeAttribute("carrito");

	    // Redirigir a una página de confirmación
	    redirectAttributes.addFlashAttribute("mensaje", "¡Gracias por tu compra! Pedido realizado con éxito.");
	    return "redirect:/";
	}

	// Método auxiliar para contar la cantidad de un producto en el carrito
	private int contarProductoEnCarrito(Producto producto, List<Producto> carrito) {
	    int contador = 0;
	    for (Producto item : carrito) {
	        if (item.getId().equals(producto.getId())) {
	            contador++;
	        }
	    }
	    return contador;
	}


	
	
	@PostMapping("/checkout/{productoId}")
	public String comprarAhora(@PathVariable("productoId") Long productoId, HttpSession session, RedirectAttributes redirectAttributes) {
	    // Obtener el usuario en sesión
	    Usuario usuarioEnSesion = (Usuario) session.getAttribute("usuarioEnSesion");
	    if (usuarioEnSesion == null) {
	        // Manejar caso donde el usuario no está en sesión
	        return "redirect:/login";
	    }

	    // Obtener el producto con el ID proporcionado
	    Producto productoComprado = serviciosProductos.encontrarProducto(productoId);
	    if (productoComprado == null || productoComprado.getStock() < 1) {
	        // Manejar caso donde el producto no está disponible en stock
	        redirectAttributes.addFlashAttribute("mensaje", "Producto no disponible en stock.");
	        return "redirect:/producto/" + productoId; // Redirigir a la página del producto
	    }

	    // Agregar el producto al carrito
	    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
	    if (carrito == null) {
	        carrito = new ArrayList<>();
	        session.setAttribute("carrito", carrito);
	    }
	    carrito.add(productoComprado);

	    // Redirigir a la página del carrito
	    redirectAttributes.addFlashAttribute("mensaje", "Producto añadido al carrito.");
	    return "redirect:/carrito";
	}
	
}
