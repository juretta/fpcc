package com.coravy.store.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.coravy.store.StoreManager;
import com.coravy.store.model.Category;
import com.coravy.store.model.Product;

import edu.emory.mathcs.backport.java.util.Collections;

/**
 * This is a JDBC based implementation of the StoreManager interface.
 * 
 * 
 * @see StoreManager
 * @author Stefan Saasen (stefan@coravy.com)
 */
@Repository
public final class JdbcStoreManagerImpl implements StoreManager {

    /**
     * An internal placeholder used to resolve the parent-child relationship in
     * the category tree.
     */
    private static class CategoryProxy extends Category {
        private final long parentId;

        CategoryProxy(long id) {
            super(null, 0);
            this.parentId = id;
        }
    }

    private final static RowMapper<Product> PRODUCT_ROW_MAPPER = new RowMapper<Product>() {
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setId(rs.getLong("id"));
            product.setName(rs.getString("name"));
            product.setVendor(rs.getString("vendor"));
            product.setWeight(rs.getDouble("weight"));
            product.setVolume(rs.getDouble("volume"));
            product.setStockAmount(rs.getInt("stock_amount"));
            product.setCategory(rs.getLong("category"));
            return product;
        }
    };

    private final static RowMapper<Category> CATEGORY_ROW_MAPPER = new RowMapper<Category>() {
        public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
            long parentId = rs.getLong("parent");
            Category parent = parentId == 0 ? null : new CategoryProxy(rs
                    .getLong("parent"));
            Category category = new Category(parent, rs.getString("label"), rs
                    .getLong("id"));
            return category;
        }
    };

    // This is only suitable for small datasets (as in this example)
    private final static ResultSetExtractor<List<Category>> CATEGORY_RESULTSET_EXTRACTOR = new ResultSetExtractor<List<Category>>() {
        @Override
        public List<Category> extractData(ResultSet rs) throws SQLException,
                DataAccessException {

            HashMap<Long, Category> categories = new HashMap<Long, Category>();
            // 1. map categories
            for (int i = 0; rs.next(); i++) {
                Category cat = CATEGORY_ROW_MAPPER.mapRow(rs, i);
                categories.put(cat.getId(), cat);
            }

            // 2. Resolve references - replace the proxy with ref to an existing
            // object
            Category root = null;
            for (Map.Entry<Long, Category> e : categories.entrySet()) {
                Category c = e.getValue();
                if (c.hasParent() && c.getParent() instanceof CategoryProxy) {
                    c.setParent(categories.get(Long.valueOf(((CategoryProxy) c
                            .getParent()).parentId)));
                    c.getParent().addChild(c);
                } else {
                    root = c;
                }
            }
            return new ArrayList<Category>(root.getChildren());
        }
    };

    private SimpleJdbcTemplate jdbcTemplate;

    @Autowired
    public void init(DataSource dataSource) {
        this.jdbcTemplate = new SimpleJdbcTemplate(dataSource);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Product getProductById(final long productId) {
        return this.jdbcTemplate
                .queryForObject(
                        "SELECT id, name, vendor, weight, volume, stock_amount, category FROM products WHERE id = ?",
                        PRODUCT_ROW_MAPPER, Long.valueOf(productId));
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Product> getAllProducts() {
        return this.jdbcTemplate
                .query(
                        "SELECT id, name, vendor, weight, volume, stock_amount, category FROM product",
                        PRODUCT_ROW_MAPPER);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<Category> getAllCategories() {
        return this.jdbcTemplate.getJdbcOperations().query(
                "SELECT id, label, parent FROM category",
                CATEGORY_RESULTSET_EXTRACTOR);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void saveProduct(final Product product) {
        final SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(
                product);
        if (product.getId() > -1) {
            // update
            this.jdbcTemplate
                    .update(
                            "UPDATE product SET name = :name, vendor = :vendor, weight = :weight, volume = :volume, stock_amount = :stockAmount, category = :category WHERE id = :id",
                            namedParameters);

        } else {
            // insert
            this.jdbcTemplate
                    .update(
                            "INSERT INTO product (name, vendor, weight, volume, stock_amount, category) VALUES(:name, :vendor, :weight, :volume, :stockAmount, :category)",
                            namedParameters);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteProdcutById(long productId) {
        this.jdbcTemplate.update("DELETE FROM product WHERE id = ?", productId);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteProduct(Product product) {
        if (null != product) {
            this.deleteProdcutById(product.getId());
        }
    }

    @Override
    public List<Product> getProductsByCategory(Category c) {
        return this.jdbcTemplate
                .query(
                        "SELECT id, name, vendor, weight, volume, stock_amount, category FROM product WHERE category = ?",
                        PRODUCT_ROW_MAPPER, Long.valueOf(c.getId()));
    }

}
