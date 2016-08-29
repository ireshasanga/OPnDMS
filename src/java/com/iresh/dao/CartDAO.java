/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.dao;

import com.iresh.model.Cart;
import org.json.simple.JSONObject;

/**
 *
 * @author Iresh
 */
public interface CartDAO {

    public JSONObject saveCart(Cart cart);
}
