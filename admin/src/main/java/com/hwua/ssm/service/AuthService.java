package com.hwua.ssm.service;

import com.hwua.ssm.po.Auth;

import java.util.List;
import java.util.Map;

public interface AuthService {
    public List<Auth> queryAll();

    public int doUpdate(Auth auth);

    public int doInsert(Auth auth);


}
