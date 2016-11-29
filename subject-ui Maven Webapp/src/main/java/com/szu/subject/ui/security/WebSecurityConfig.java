package com.szu.subject.ui.security;

import javax.servlet.Filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
		  .headers().frameOptions().sameOrigin()
		  .and()
	      .authorizeRequests()
	      .anyRequest().fullyAuthenticated()
	      .and()
	      .exceptionHandling().accessDeniedPage("/denied")
	      .and()
	      .formLogin().defaultSuccessUrl("/").successHandler(authenticationSuccessHandler())
	      .loginPage("/login").failureUrl("/login?error")
	      .and().rememberMe().key("remember-me")

	      .and()
	      .logout()
	      .logoutSuccessUrl("/login")
	      .and()
	      .addFilterBefore(filterSecurityInterceptor() , FilterSecurityInterceptor.class);
	}

	private Filter filterSecurityInterceptor() {
		// TODO Auto-generated method stub
		return null;
	}

	private AuthenticationSuccessHandler authenticationSuccessHandler() {
		// TODO Auto-generated method stub
		return null;
	}
}
