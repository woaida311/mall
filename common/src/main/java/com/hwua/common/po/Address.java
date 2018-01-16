package com.hwua.common.po;

public class Address {
    private Integer id;
    private String addr;
    private String name;
    private String tel;
    private Integer mid;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Address{" +
                "id=" + id +
                ", addr='" + addr + '\'' +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", mid=" + mid +
                ", status=" + status +
                '}';
    }
}
