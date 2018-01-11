package com.hwua.ssm.po;

import java.util.List;

public class UserOrder extends User {

    private List<Orders> orders;

    public List<Orders> getOrders() {
        return orders;
    }

    public void setOrders(List<Orders> orders) {
        this.orders = orders;
    }

    @Override
    public String toString() {
        return "UserOrder{" +
                "orders=" + orders +
                '}'+super.toString();
    }
}
