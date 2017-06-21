package com.rifat.webstore.service.impl;

import com.rifat.webstore.domain.Product;
import com.rifat.webstore.domain.repository.ProductRepository;
import com.rifat.webstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

   @Autowired
   private ProductRepository productRepository;
  
   @Override
   public void updateAllStock() {
      List<Product> allProducts = productRepository.getAllProducts();
     
      for(Product product : allProducts) {
         if(product.getUnitsInStock()<500)
            productRepository.updateStock(product.getProductId(), product.getUnitsInStock()+1000);
      }
   }
   
   @Override
   public List<Product> getAllProducts() {
         return productRepository.getAllProducts();
   }
   
   public List<Product> getProductsByCategory(String category) {
	   return productRepository.getProductsByCategory(category);
	}   
   
   public List<Product> getProductsByFilter(Map<String, List<String>> filterParams) {
	      return productRepository.getProductsByFilter(filterParams);
	}
   
   @Override
   public Product getProductById(String productID) {
      return productRepository.getProductById(productID);
   }
   
   @Override
   public void addProduct(Product product) {
      productRepository.addProduct(product);
   }

}