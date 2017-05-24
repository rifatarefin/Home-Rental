package com.packt.webstore.controller;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.packt.webstore.domain.Add;
import com.packt.webstore.domain.AddRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import com.packt.webstore.domain.Product;
import com.packt.webstore.domain.repository.ProductRepository;
import com.packt.webstore.service.ProductService;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AddController {
	
	@Autowired
	private ProductService productService;

    @Autowired
    private AddRepository addRepository;

    @RequestMapping("/adds")
    public String list2(Model model) {
        model.addAttribute("adds", addRepository.getAllAdds());
        return "adds";

    }

	@RequestMapping("/add/img")
	public void imge(@RequestParam int addId, Model model, HttpServletResponse response) throws IOException {
		Add addFromRepo = addRepository.getAddById(addId);
		response.setContentType("image");
		ServletOutputStream outputStream=response.getOutputStream();
		outputStream.write(addFromRepo.getImage());
		outputStream.flush();
		outputStream.close();
	}



    @RequestMapping("/add")
    public String getAddById(@RequestParam("id") int addId, Model model, HttpSession session) {
        model.addAttribute("add", addRepository.getAddById(addId));
        session.setAttribute("add",addRepository.getAddById(addId));

        return "add";
    }

    @RequestMapping(value = "/adds/new", method = RequestMethod.GET)
    public String getPlaceAdd(Model model) {
        Add newAdd=new Add();
        model.addAttribute("newAdd", newAdd);
        return "newAdd";
    }

    @RequestMapping(value = "/adds/new", method = RequestMethod.POST)
    public String processNewAddForm(@ModelAttribute("newAdd") Add newAdd, BindingResult result) {

        String[] suppressedFields = result.getSuppressedFields();
        if (suppressedFields.length > 0) {
            throw new RuntimeException("Attempting to bind disallowed fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
        }

        //System.out.println(newAdd.getImage().length);
        addRepository.placeNewAdd(newAdd);
        return "redirect:/adds";
    }


	@RequestMapping("/adds/{propertyType}")
	public String getAddsByPropertyType(Model model, @PathVariable("propertyType") String propertyType) {
		model.addAttribute("adds", addRepository.getAddsByPropertyType(propertyType));
		return "adds";
	}






	//////////////////


	@RequestMapping("/products")
	public String list(Model model) {
	   model.addAttribute("products", productService.getAllProducts());
	   return "products";
	}
	
	@RequestMapping("/update/stock")
	public String updateStock(Model model) {
	   productService.updateAllStock();
	   return "redirect:/products";
	}
	
	@RequestMapping("/products/{category}")
	public String getProductsByCategory(Model model, @PathVariable("category") String productCategory) {
	   model.addAttribute("products", productService.getProductsByCategory(productCategory));
	   return "products";
	}
	
	@RequestMapping("/products/filter/{params}")
	public String getProductsByFilter(@MatrixVariable(pathVar="params") Map<String,List<String>> filterParams, Model model) {
	   model.addAttribute("products", productService.getProductsByFilter(filterParams));
	   return "products";
	}
	
	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") String productId, Model model) {
	   model.addAttribute("product", productService.getProductById(productId));
	   return "product";
	}
	
	@RequestMapping(value = "/products/add", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model) {
	   Product newProduct = new Product();
	   model.addAttribute("newProduct", newProduct);
	   return "addProduct";
	}
	   
	@RequestMapping(value = "/products/add", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("newProduct") Product newProduct, BindingResult result) {
		
		String[] suppressedFields = result.getSuppressedFields();
		   if (suppressedFields.length > 0) {
		      throw new RuntimeException("Attempting to bind disallowed fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		   }
	
	   productService.addProduct(newProduct);
	   return "redirect:/market/products";
	}

	@InitBinder
    public void initMultipartConverter(WebDataBinder webDataBinder) {
        ByteArrayMultipartFileEditor multipartFileEditor = new ByteArrayMultipartFileEditor();
        webDataBinder.registerCustomEditor(byte[].class, multipartFileEditor);
    }

	@InitBinder
	public void initialiseBinder(WebDataBinder binder) {
	   binder.setAllowedFields("productId",
	            "name",
	            "unitPrice",
	            "description",
	            "manufacturer",
	            "category",
	            "unitsInStock",
	            "condition",
               "id",
               "title",
               "propertyType",
               "purpose",
               "image",
               "bed",
               "bath",
               "city",
               "details",
               "sqFeet",
               "location",
               "price");
	}

}


