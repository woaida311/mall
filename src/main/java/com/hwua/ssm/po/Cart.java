package com.hwua.ssm.po;

public class Cart {
    private Integer id;
    private Member member;
    private Integer mid;
    private Product product;
    private Integer pid;
    private Integer count;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cart cart = (Cart) o;

        if (id != null ? !id.equals(cart.id) : cart.id != null) return false;
        if (member != null ? !member.equals(cart.member) : cart.member != null) return false;
        if (mid != null ? !mid.equals(cart.mid) : cart.mid != null) return false;
        if (product != null ? !product.equals(cart.product) : cart.product != null) return false;
        if (pid != null ? !pid.equals(cart.pid) : cart.pid != null) return false;
        return count != null ? count.equals(cart.count) : cart.count == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (member != null ? member.hashCode() : 0);
        result = 31 * result + (mid != null ? mid.hashCode() : 0);
        result = 31 * result + (product != null ? product.hashCode() : 0);
        result = 31 * result + (pid != null ? pid.hashCode() : 0);
        result = 31 * result + (count != null ? count.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", member=" + member +
                ", mid=" + mid +
                ", product=" + product +
                ", pid=" + pid +
                ", count=" + count +
                '}';
    }
}
