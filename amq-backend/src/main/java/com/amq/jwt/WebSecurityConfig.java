package com.amq.jwt;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors().and().csrf().disable()
			.addFilterAfter(new JWTAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class)
			.authorizeRequests()
			.antMatchers(HttpMethod.POST, "/usuario/login").permitAll()
			.antMatchers(HttpMethod.GET, "/usuario/listar").permitAll()
			.antMatchers(HttpMethod.POST, "/alojamiento/desactivarAlojamiento/**").permitAll()
			.antMatchers("/v2/api-docs",
		            "/swagger-resources",
		            "/swagger-resources/**",
		            "/configuration/ui",
		            "/configuration/security",
		            "/swagger-ui.html",
		            "/webjars/**",
		            // -- Swagger UI v3 (OpenAPI)
		            "/v3/api-docs/**",
		            "/swagger-ui/**").permitAll().anyRequest().authenticated()
			.antMatchers(HttpMethod.POST, "/usuario/resetPassword").permitAll().anyRequest().authenticated()
		    .antMatchers(HttpMethod.GET, "http://localhost:8080/swagger-ui/index.html#").permitAll().anyRequest().authenticated();
		http.cors().configurationSource(request -> new CorsConfiguration().applyPermitDefaultValues());
	}



	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**")
				.allowedOrigins("*")
				.allowedMethods("GET", "PUT", "POST", "PATCH", "DELETE", "OPTIONS");
			}
		};
	}
}