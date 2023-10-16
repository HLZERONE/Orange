package com.myservlet;

import java.util.HashMap;

public class ShoppingCart {
    private HashMap<Integer, Integer> cart = new HashMap<>();

    public HashMap<Integer, Integer> getProduct(){
        return cart;
    }

    public void addNew(int productId, int quantity){
        cart.put(productId, quantity);
    }

    public void add(int productId){
        cart.put(productId, cart.getOrDefault(productId, 0) + 1);
    }
}
