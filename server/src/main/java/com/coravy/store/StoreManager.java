package com.coravy.store;

import java.util.List;

import com.coravy.store.model.Category;
import com.coravy.store.model.Product;

/**
 * This is the main interface for the domain model.
 * <p>
 * The StoreManager defines methods to work with the main entities: Category and
 * Product.
 * <p>
 * The interface does not rely on a particular storage/persistence solution.
 * 
 * @author Stefan Saasen (stefan@coravy.com)
 */
public interface StoreManager {

    /**
     * @return a list of all categories.
     */
    List<Category> getAllCategories();

    /**
     * @return a list of all products in the store.
     */
    List<Product> getAllProducts();

    /**
     * @return a list of all products in the given category.
     */
    List<Product> getProductsByCategory(Category c);
    
    /**
     * Returns a particular product based on the product identifier.
     * 
     * @param productId
     */
    Product getProductById(final long productId);

    /**
     * Save the product. If the product has a valid product id the product will
     * be updated. Otherwise the product will be saved as a new product.
     * 
     * @param product
     *            The product to store.
     */
    void saveProduct(final Product product);

    /**
     * Deletes the given product.
     * 
     * @param product
     */
    void deleteProduct(final Product product);

    /**
     * Deletes the product with the given {@code productIt}.
     */
    void deleteProdcutById(final long productId);
}
