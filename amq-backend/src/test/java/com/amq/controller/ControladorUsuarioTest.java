package com.amq.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.is;
//import static org.junit.Assert.*;
//:
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aopalliance.intercept.Invocation;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
//import org.springframework.web.context.WebApplicationContext;

import com.amq.DemoWebApplication;
import com.amq.datatypes.DtAdministrador;
import com.amq.datatypes.DtFiltrosUsuario;
import com.amq.datatypes.DtLogin;
import com.amq.datatypes.DtPassword;
import com.amq.datatypes.DtUsuario;
import com.amq.model.Administrador;
import com.amq.model.Anfitrion;
import com.amq.model.Usuario;
import com.amq.passwordReset.IUsuarioService;
import com.amq.passwordReset.UsuarioService;
import com.amq.repositories.RepositoryUsuario;
//import com.amq.service.IUsuarioService;
//import com.amq.service.UsuarioService;
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.api.gax.batching.RequestBuilder;
import com.fasterxml.jackson.databind.ObjectMapper;
/*

//@ExtendWith(SpringExtension.class)
//@ContextConfiguration(classes = { DemoWebApplication.class })
//@WebAppConfiguration
//@SpringBootTest
//@WebMvcTest(ControladorUsuario.class)
@DataJpaTest
//@Component
@Service
//@TestPropertySource(locations = "classpath:application.properties")
//@WebMvcTest(value = ControladorUsuario.class)
public class ControladorUsuarioTest {
	
//	private WebApplicationContext webApplicationContext;
//	@Autowired
//	private MockMvc mockMvc;
	
	@Autowired
	private RepositoryUsuario repoUsr;
	
	
	//permite crear simulacros
	@Mock
	private ControladorUsuario cu;
//	private DtAdministrador dtAdminBean;
	
//	@Mock
//	private RepositoryUsuario mockrepoUsr;
	
//	@Mock
//	@InjectMocks
//	private UsuarioService usrService;
	ObjectMapper objectMapper;
	
//	@Before
//	public void setUp() {
//		 objectMapper = new ObjectMapper();
//	}
	
	
	
	
//	Anfitrion anf = new Anfitrion("email",true, "apell", "nom", 4, null, null, null, null); 

	@Test
	public void testAltaAdministrador() throws Exception {
//		Optional<Usuario> usuario;
//		Usuario usr = new Usuario();
//		ObjectMapper objectMap = new ObjectMapper();
		
//		DtAdministrador dta = new DtAdministrador();
//		dta.setId();
		
//		dta.setEmail("amil");
//		dta.setNombre("nombre");
//		dta.setApellido("apellido");
//		dta.setActivo(true);
//		dta.setBloqueado(false);
//		dta.setPass("pass");
		
//		dta.setTipo("Ad");
//		dta.setJwToken(null);
//		repoUsrBean.(dta);
		
		Usuario admin = new Administrador();
		admin.setActivo(true);
		admin.setEmail("vm@vm.com");
		admin.setApellido("apeAn 10021");
		admin.setPass("123456");
		admin.setNombre("nomAn 10021");
		
		Usuario adminw = repoUsr.findByEmail(admin.getEmail());
		
//		assertThat(admin.getEmail()).isEqualTo(admin.getEmail());
		
//		when(cu.repoU.save(any())).then(invocation -> {
//			Administrador a = invocation.getArgument(0);
//			a.setId(3);
//			return a;
//		});
//		
		//tipo contenido a enviar
//		mockMvc.perform(post("/usuario/AltaAdmin").contentType(MediaType.APPLICATION_JSON)
//				//le mando un usuario
//				.content(objectMapper.writeValueAsString(admin)))
////				.andExpect(status().isCreated()) 
//				//espero el tipo respuesta 
//				.andExpect(content().contentType(MediaType.APPLICATION_JSON))
////				.andExpect(content().json(objectMap.writeValueAsString(respuesta)));
//				.andExpect(jsonPath("$.id",is(3)))
//				.andExpect(jsonPath("$.email",is("email")))
//				.andExpect(jsonPath("$.apellido",is("apellido")))
//				.andExpect(jsonPath("$.pass",is("pass")))
//				.andExpect(jsonPath("$.nombre",is("nombre")));
//		
////		verify(repoUsrBean.save(any()));

//		System.out.println(objectMap.writeValueAsString(dta));
//		
//		Map<String, Object> respuesta = new HashMap<>();
//		respuesta.put("dta", dta);
		
//		System.out.println(objectMap.writeValueAsString(respuesta));
		
//		mockMvc.perform(post("/usuario/AltaAdmin").contentType(MediaType.APPLICATION_JSON)
//				.content(objectMap.writeValueAsString(respuesta)))
//				.andExpect(status().isCreated())
//				.andExpect(content().contentType(MediaType.APPLICATION_JSON))
//				.andExpect(content().json(objectMap.writeValueAsString(respuesta)));
//				
//		
			
		
//		String inJson = this.mapToJson(dta);
//		String uri = "/usuario/altaAdmin";
		
//		Mockito.when(cu.altaAdministrador(Moc kito.any(DtAdministrador.class))).thenReturn(null);
		
//		RequestBuilder rb = MockMvcRequestBuilders
//				.post(uri)
//				.accept();
//		
//		
		
//		mockMvc.perform(post("/usuario/altaAdmin"))
//		.andExpect(status().isCreated()).
//		.contentType("application/json;charset=UTF-8"));
		
//		this.mockMvc.perform(post("/usuario/altaAdmin")).andDo(print())
//	      .andExpect(status().isOk()).andExpect(content()
//	      .contentType("application/json;charset=UTF-8"))
//	      .andExpect(jsonPath("$.message").value("Hello World!!!"));
		
		
		
//		DtAdministrador adminDt = new DtAdministrador(0, email, nombre, apellido, activo, "Ad", false, null);
		
		// Send course as body to /students/Student1/courses
//	    RequestBuilder requestBuilder = MockMvcRequestBuilders
//	            .post("/students/Student1/courses")
//	            .accept(MediaType.APPLICATION_JSON)
//	            .content(exampleCourseJson)
//	            .contentType(MediaType.APPLICATION_JSON);
//	    
//	    MvcResult result = mockMvc.perform(requestBuilder).andReturn();
//
//		
//		assertEquals(HttpStatus.CREATED.value(), response.getStatus());
//
//		assertEquals("http://localhost/students/Student1/courses/1",response.getHeader(HttpHeaders.LOCATION));
//		fail("Not yet implemented");
	}

//	@Test
//	public void testAltaAnfitrion() {
////		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testAltaHuesped() {
////		fail("Not yet implemented");
//	}
//
	@Test
	public void testBuscarUsuarioPorNombre(){
			ControladorUsuario cu;
			DtAdministrador dta;
			
			dta = new DtAdministrador(0, "emailAd 1001", "nom", "apellid", true, "Ad", false, null);
			
			
			cu = new ControladorUsuario();
			
			cu.altaAdministrador(dta);
//			cu.altaAdministrador(dta)
			//cu.bloquearUsuario(0);
			
			
			//String email = "pepe@gmail.com";
			//Usuario usr = repoUsr.findByEmail(email);
			
			//equals(usr.getEmail());
//			assertEquals(HttpStatus.INTERNAL_SERVER_ERROR, dta);
			assertThat("500 INTERNAL_SERVER_ERROR");
		}
//
//	@Test
//	public void testDesactivarUsuario() {
////		fail("Not yet implemented");
//	}

//	@Test
//	public void testBloquearUsuario() throws Exception {
//		
////		Optional<Usuario> usr;
////		if(usr.get() instanceof Anfitrion){
////			anf = (Anfitrion) usr.get();
////			Mockito.when(cu.repoU.findById(Mockito.anyInt())).thenReturn(anf);
////		}
//		
//		
//		//		fail("Not yet implemented");
//	}

//	@Test
//	public void testDesbloquearUsuario() {
////		fail("Not yet implemented");
//	}

	@Test
	public void testListarUsuarios() {
//		List<Usuario> usuarios = new ArrayList<Usuario>();
//		List<Usuario> usuarios = Arrays.asList(repoUsrBean.findAll().add(Usuario)));
		
//when(repoUsrBean.findByEmail(dtAdminBean.getEmail()));//.thenReturn(usr);
//		
//		mockMvc.perform(get("/usuario/altaAdmin").contentType(MediaType.APPLICATION_JSON))
//			   .andExpect(status().isOk())
//			   .andExpect(content().contentType(org.springframework.http.MediaType.APPLICATION_JSON))
//			    .andExpect(jsonPath("$.", null))
				
		
		
//		fail("Not yet implemented");
	}

//	@Test
//	public void testAprobarAnfitrion() {
////		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testRechazarAnfitrion() {
////		fail("Not yet implemented");
//	}

	//@Test
	//public void testIniciarSesion() throws Exception{
		
//		Administrador admin = new Administrador();
//		admin.setActivo(true);
//		admin.setEmail("email");
//		admin.setApellido("apellido");
//		admin.setPass("pass");
//		admin.setNombre("nombre");
//		
//		when(repoUsrBean.save(any())).then(invocation -> {
//			Administrador a = invocation.getArgument(0);
//			a.setId(0);
//			return a;
//		});
//		
//		//tipo contenido a enviar
//		mockMvc.perform(post("/usuario/AltaAdmin").contentType(MediaType.APPLICATION_JSON)
//				//le mando un usuario
//				.content(objectMapper.writeValueAsString(admin)))
////				.andExpect(status().isCreated()) 
//				//espero el tipo respuesta 
//				.andExpect(content().contentType(MediaType.APPLICATION_JSON))
////				.andExpect(content().json(objectMap.writeValueAsString(respuesta)));
//				.andExpect(jsonPath("$.id",is(3)))
//				.andExpect(jsonPath("$.email",is("email")))
//				.andExpect(jsonPath("$.apellido",is("apellido")))
//				.andExpect(jsonPath("$.pass",is("pass")))
//				.andExpect(jsonPath("$.nombre",is("nombre")));
//		
//		verify(repoUsrBean.save(any()));
////		fail("Not yet implemented");
	//}
	@Test
//	para cuando se persiste en base.
//	@Rollback(false) 
	public void testIniciarSesion() throws Exception {
		ControladorUsuario usrctl = new ControladorUsuario();
		DtLogin dt = new DtLogin("vm@vm.com", "123456", null);
		dt.setEmail(dt.getEmail());
//		RepositoryUsuario r;
		this.repoUsr.findByEmail("vm@vm.com");
		usrctl.iniciarSesion(dt);
		
		
		assertEquals("Error desconocido en el servidor.", HttpStatus.INTERNAL_SERVER_ERROR);
	}

//	@Test
//	public void testAgregarAlojamientoAnfitrion() {
////		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testListarAlojamientosAnfitrion() {
////		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testCambiarEstadoAnfitrion() {
////		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testListarReservasHuesped() {
////		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testModificarReservaHuesped() {
////		fail("Not yet implemented");
//	}

	@Test
	public void testResetPassword() {
		//DtPassword dtPass = new DtPassword();
		IUsuarioService iusr = new UsuarioService();
		String token = "20daa031-8317-480a-816f-97ec302e35eb";
		iusr.validatePasswordResetToken(token);
		
		assertThat(token);
	}
	
	@Test
	public void testUsuarioCumpleFiltros() {
		//DtPassword dtPass = new DtPassword();
		Usuario usr = new Administrador();
		usr.setActivo(true);
		usr.setEmail("vm@vm.com");
		usr.setApellido("apeAn 10021");
		usr.setPass("123456");
		usr.setNombre("nomAn 10021");
		
		DtFiltrosUsuario fil = new DtFiltrosUsuario();
		fil.setActivo(true);
		fil.setBloqueado(false);
		fil.setCalificacion_desde(0.0);
		fil.setEstado("APROBADO");
		fil.setTipo("TIPO");
		
//		cu.usuarioCumpleFiltros 
		
		
		assertTrue(true);
	}

//	@Test
//	public void testSavePassword() {
////		fail("Not yet implemented");
//	}
//	
//	private String mapToJson(Object object) throws JsonProcessingException{
//		ObjectMapper oMapper = new ObjectMapper();
//		return oMapper.writeValueAsString(oMapper);
//	}

}*/
