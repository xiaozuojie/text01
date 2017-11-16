package com.etc.dao;

import com.etc.cms.util.BaseDao;
import com.etc.cms.util.PageData;
import com.etc.entity.Emp;

public class EmpDao {

	public PageData<Emp> getEmpByPage(int page, int pageSize, String pename) {
		String sql = "select * from emp where ename like ?";
		return BaseDao.getOraclePage(sql, page, pageSize, Emp.class, "%"
				+ pename + "%");
	}

}
