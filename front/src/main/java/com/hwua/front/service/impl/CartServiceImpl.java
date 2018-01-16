package com.hwua.front.service.impl;

import com.hwua.common.dao.CartMapper;
import com.hwua.common.po.Cart;
import com.hwua.front.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;
@SuppressWarnings("ALL")
@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartMapper cartMapper;
    @Override
    public Set<Cart> showCart(Integer mid) {
        return null;
    }

    @Override
    public int addOrUpdateCart(Cart cart) {
        return 0;
    }

    @Override
    public int updateCount(Cart cart) {
        return 0;
    }

    @Override
    public int delCart(Integer mid) {
        return 0;
    }

    @Override
    public int delAllCart(Integer mid) {
        return 0;
    }
}
