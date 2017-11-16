package com.etc.service;

import com.etc.cms.util.PageData;
import com.etc.dao.EmpDao;
import com.etc.entity.Emp;

public class EmpService {

	EmpDao ed = new EmpDao();

	public PageData<Emp> getEmpByPage(int page, int pageSize, String pename) {
		return ed.getEmpByPage(page, pageSize, pename);
	}

}
