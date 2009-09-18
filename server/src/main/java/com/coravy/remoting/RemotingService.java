package com.coravy.remoting;

import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.coravy.store.StoreManager;
import com.coravy.store.model.Category;
import com.coravy.store.model.Product;

/**
 * This is the service that is exposed to the client. In this simple example the
 * service just delegates the method calls to the main manager.
 * <p>
 * Because this class is participates in the BlazeDS remoting it has access to
 * the FlexContext and the thread locals stored in the FlexContext (HttpServletRequest,
 * HttpServletResponse, ServletContext and so on). If you somehow need to access the
 * servlet specific objects this implementation is the correct place to use
 * them.
 * 
 * 
 * @author Stefan Saasen (stefan@coravy.com)
 */
public final class RemotingService implements StoreManager, InitializingBean {

    private StoreManager storeManager;

    @Override
    public Product getProductById(long productId) {
        // Access to the undelying HttpServletRequest: FlexContext.getHttpRequest()
        return storeManager.getProductById(productId);
    }

    @Override
    public List<Product> getAllProducts() {
        return storeManager.getAllProducts();
    }

    @Override
    public List<Category> getAllCategories() {
        return storeManager.getAllCategories();
    }

    @Override
    public void saveProduct(Product product) {
        storeManager.saveProduct(product);
    }

    @Override
    public void deleteProdcutById(long productId) {
        storeManager.deleteProdcutById(productId);
    }

    @Override
    public void deleteProduct(Product product) {
        storeManager.deleteProduct(product);
    }


    @Autowired
    public void setProductManager(final StoreManager productManager) {
        this.storeManager = productManager;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(this.storeManager);
    }

    @Override
    public List<Product> getProductsByCategory(Category c) {
        return this.storeManager.getProductsByCategory(c);
    }

}
