/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class CartItem {
    private String id;
    private String cart_id;
    private String product_id;
    private String quantity;
    private String createdAt;
    private String modifiedAt;

    public String getId() {
        return id;
    }

    public String getCart_id() {
        return cart_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public String getQuantity() {
        return quantity;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public String getModifiedAt() {
        return modifiedAt;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setCart_id(String cart_id) {
        this.cart_id = cart_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public void setModifiedAt(String modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public CartItem(String id, String cart_id, String product_id, String quantity, String createdAt, String modifiedAt) {
        this.id = id;
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public CartItem() {
    }
    
    
}
