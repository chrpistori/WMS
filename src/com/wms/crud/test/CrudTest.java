package com.wms.crud.test;

import com.wms.controller.BancoController;
import com.wms.entity.Banco;

public class CrudTest {

	public static void main(String[] args) {
		
		Banco bradesco = new Banco();
		bradesco.setNomeBanco("Bradesco");
		
		BancoController controller = new BancoController();
		controller.salvar(bradesco);

	}
}
