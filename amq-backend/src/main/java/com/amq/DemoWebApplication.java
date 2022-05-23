package com.amq;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.amq.datatypes.DtAdministrador;
import com.amq.datatypes.DtUsuario;
import com.amq.icontroller.IcUsuario;
import com.amq.model.Fabrica;

@SpringBootApplication
public class DemoWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoWebApplication.class, args);
		System.out.println("HOLA");
		DtUsuario u = new DtAdministrador("test@test.com","Pedro","Gomez",true);
		Fabrica f = Fabrica.getInstancia();
		IcUsuario iconu = f.getIControladorUsuario();
		iconu.altaUsuario(u);
	}

}
