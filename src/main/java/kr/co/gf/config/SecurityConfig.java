package kr.co.gf.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public  PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		// csrf 토큰 기능을 disable 처리해야 403이 발생 안함
		// Cross Site Request Forgery: 다른 사이트에서 내가 요청하지 않은 내용이 요청되는 해킹방법
		// fishing 사이트에 들어갔다가 어떤 js가 받아졌는데, 이게 버튼에 어떤 명령어를 심어 원치 않는 동작을 하게됨
		// 이것을 방지하기 위해 CSRF 토큰을 발행해 변조된 페이지인지 확인
		
		return http.httpBasic().disable().csrf().disable().build();
	}
	
}