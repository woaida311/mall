package com.hwua.ssm.po;

public class Product {
    private Integer id;
    private Category category;
    private Brand brand;
    private String name;
    private String comments;
    private Integer cid;
    private Integer bid;
    private Double price;
    private Integer stock;
    private String src_img;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getSrc_img() {
        return src_img;
    }

    public void setSrc_img(String src_img) {
        this.src_img = src_img;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (id != null ? !id.equals(product.id) : product.id != null) return false;
        if (category != null ? !category.equals(product.category) : product.category != null) return false;
        if (brand != null ? !brand.equals(product.brand) : product.brand != null) return false;
        if (name != null ? !name.equals(product.name) : product.name != null) return false;
        if (comments != null ? !comments.equals(product.comments) : product.comments != null) return false;
        if (cid != null ? !cid.equals(product.cid) : product.cid != null) return false;
        if (bid != null ? !bid.equals(product.bid) : product.bid != null) return false;
        if (price != null ? !price.equals(product.price) : product.price != null) return false;
        if (stock != null ? !stock.equals(product.stock) : product.stock != null) return false;
        return src_img != null ? src_img.equals(product.src_img) : product.src_img == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (brand != null ? brand.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        result = 31 * result + (cid != null ? cid.hashCode() : 0);
        result = 31 * result + (bid != null ? bid.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (stock != null ? stock.hashCode() : 0);
        result = 31 * result + (src_img != null ? src_img.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", category=" + category +
                ", brand=" + brand +
                ", name='" + name + '\'' +
                ", comments='" + comments + '\'' +
                ", cid=" + cid +
                ", bid=" + bid +
                ", price=" + price +
                ", stock=" + stock +
                ", src_img='" + src_img + '\'' +
                '}';
    }
}
