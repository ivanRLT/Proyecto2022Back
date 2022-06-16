package com.amq.controller;

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
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
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
import com.amq.datatypes.DtUsuario;
import com.amq.model.Administrador;
import com.amq.model.Anfitrion;
import com.amq.model.Usuario;
import com.amq.passwordReset.UsuarioService;
import com.amq.repositories.RepositoryUsuario;
//import com.amq.service.IUsuarioService;
//import com.amq.service.UsuarioService;
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.api.gax.batching.RequestBuilder;
import com.fasterxml.jackson.databind.ObjectMapper;


//@ExtendWith(SpringExtension.class)
//@ContextConfiguration(classes = { DemoWebApplication.class })
//@WebAppConfiguration
//@RunWith(SpringRunner.class)
//@SpringBootTest
@WebMvcTest(ControladorUsuario.class)
//@WebMvcTest(value = ControladorUsuario.class)
public class ControladorUsuarioTest {
	
//	private WebApplicationContext webApplicationContext;
	@Autowired
	private MockMvc mockMvc;
	
	
	//permite crear simulacros
	@Mock
	private ControladorUsuario cu;
//	private DtAdministrador dtAdminBean;
	
//	@Mock
//	@InjectMocks
	@Autowired
	private RepositoryUsuario repoUsrBean;

	//	private UsuarioService usrService;
	ObjectMapper objectMapper;
	
	@Before
	public void setUp() {
		 objectMapper = new ObjectMapper();
	}
	
	
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
		
		Administrador admin = new Administrador();
		admin.setActivo(true);
		admin.setEmail("email");
		admin.setApellido("apellido");
		admin.setPass("pass");
		admin.setNombre("nombre");
		
		when(cu.repoU.save(any())).then(invocation -> {
			Administrador a = invocation.getArgument(0);
			a.setId(3);
			return a;
		});
		
		//tipo contenido a enviar
		mockMvc.perform(post("/usuario/AltaAdmin").contentType(MediaType.APPLICATION_JSON)
				//le mando un usuario
				.content(objectMapper.writeValueAsString(admin)))
//				.andExpect(status().isCreated()) 
				//espero el tipo respuesta 
				.andExpect(content().contentType(MediaType.APPLICATION_JSON))
//				.andExpect(content().json(objectMap.writeValueAsString(respuesta)));
				.andExpect(jsonPath("$.id",is(3)))
				.andExpect(jsonPath("$.email",is("email")))
				.andExpect(jsonPath("$.apellido",is("apellido")))
				.andExpect(jsonPath("$.pass",is("pass")))
				.andExpect(jsonPath("$.nombre",is("nombre")));
		
		verify(repoUsrBean.save(any()));

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

	@Test
	public void testAltaAnfitrion() {
//		fail("Not yet implemented");
	}

	@Test
	public void testAltaHuesped() {
//		fail("Not yet implemented");
	}

	@Test
	public void testBuscarUsuario() {
//		fail("Not yet implemented");
	}

	@Test
	public void testDesactivarUsuario() {
//		fail("Not yet implemented");
	}

	@Test
	public void testBloquearUsuario() throws Exception {
		
//		Optional<Usuario> usr;
//		if(usr.get() instanceof Anfitrion){
//			anf = (Anfitrion) usr.get();
//			Mockito.when(cu.repoU.findById(Mockito.anyInt())).thenReturn(anf);
//		}
		
		
		//		fail("Not yet implemented");
	}

	@Test
	public void testDesbloquearUsuario() {
//		fail("Not yet implemented");
	}

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

	@Test
	public void testAprobarAnfitrion() {
//		fail("Not yet implemented");
	}

	@Test
	public void testRechazarAnfitrion() {
//		fail("Not yet implemented");
	}

	@Test
	public void testIniciarSesion() throws Exception{
		
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
	}

	@Test
	public void testAgregarAlojamientoAnfitrion() {
//		fail("Not yet implemented");
	}

	@Test
	public void testListarAlojamientosAnfitrion() {
//		fail("Not yet implemented");
	}

	@Test
	public void testCambiarEstadoAnfitrion() {
//		fail("Not yet implemented");
	}

	@Test
	public void testListarReservasHuesped() {
//		fail("Not yet implemented");
	}

	@Test
	public void testModificarReservaHuesped() {
//		fail("Not yet implemented");
	}

	@Test
	public void testResetPassword() {
//		fail("Not yet implemented");
	}

	@Test
	public void testSavePassword() {
//		fail("Not yet implemented");
	}
	
//	private String mapToJson(Object object) throws JsonProcessingException{
//		ObjectMapper oMapper = new ObjectMapper();
//		return oMapper.writeValueAsString(oMapper);
//	}

}
