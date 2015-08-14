package com.wms.controller;

import com.wms.dao.BancoDao;
import com.wms.entity.Banco;

public class BancoController {
	
	private BancoDao dao = new BancoDao();
	
	public void salvar(Banco banco) {
		this.dao.salvar(banco);
	}
}
