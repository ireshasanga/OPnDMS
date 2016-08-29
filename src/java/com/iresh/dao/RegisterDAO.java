/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iresh.dao;

import com.iresh.model.Register;

/**
 *
 * @author Iresh
 */
public interface RegisterDAO {
    
    public String registerCustomer(Register register)throws Exception;
    
}
