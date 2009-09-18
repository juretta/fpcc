package com.coravy.store.model;

import java.util.ArrayList;
import java.util.List;

import com.coravy.remoting.annotations.DataTransferObject;

/**
 * The domain model for a Category.
 * 
 * @author Stefan Saasen (stefan@coravy.com)
 */
@DataTransferObject
public class Category {
    private long id;
    private Category parent;
    private List<Category> children;
    private String label;

    /**
     * !Important: A default no-args constructor is always required for BlazeDS
     * data transfer objects
     */
    public Category() {
    }

    public Category(final Category parent, final String label, final long id) {
        this(label, id);
        this.parent = parent;
    }

    public Category(final String label, final long id) {
        super();
        this.label = label;
        this.id = id;
    }

    /**
     * @return true f this category has a parent category, false otherwise
     */
    public boolean hasParent() {
        return null != this.parent;
    }

    /**
     * @return true if this is the root category, false otherwise
     */
    public boolean isRoot() {
        return !hasParent();
    }

    // ===================== accessor methods ==================================

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Category> getChildren() {
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public void addChild(Category c) {
        if (null == children) {
            children = new ArrayList<Category>();
        }
        children.add(c);
    }

}
