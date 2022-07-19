package com.amq;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

//import com.amq.controller.ControladorAlojamientoTest;
import com.amq.controller.ControladorUsuario;
import com.amq.model.ModelTest;

//import com.amq.icontroller.IUsuarioRepo;
//import com.amq.model.Usuarioborrar;

//@RunWith(SpringRunner.class)
//@RunWith(Suite.class)
//@SuiteClasses({ControladorAlojamientoTest.class, ControladorUsuario.class,
//	ModelTest.class})
@SpringBootTest
public class DemoWebApplicationTests {

	//@Autowired
//	private IUsuarioRepo repo;
	
	//@Autowired

	
//	@Test
//	public void crearUsuarioTest() {
//		Usuarioborrar us = new Usuarioborrar();
//		us.setId(4);
//		us.setNombre("codex");
//		//us.setClave(encoder.encode("123"));		
//		Usuarioborrar retorno = repo.save(us);
//		
//		assertTrue(retorno.getClave().equalsIgnoreCase(us.getClave()));
//	}

}
