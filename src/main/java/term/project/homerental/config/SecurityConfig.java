package term.project.homerental.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;
 
    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select username, password, enabled from users where username=?")
                .authoritiesByUsernameQuery("select username, role from user_role where username=?");

//        auth.inMemoryAuthentication().withUser("john").password("pa55word").roles("USER");
//        auth.inMemoryAuthentication().withUser("admin").password("root123").roles("USER","ADMIN");
        
    }
     
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
  
       httpSecurity.formLogin().loginPage("/login")
                   .usernameParameter("username")
                   .passwordParameter("password");
       
       httpSecurity.formLogin().defaultSuccessUrl("/adds")
                    .failureUrl("/login?error");
       
       httpSecurity.logout().logoutSuccessUrl("/login?logout");
       
       httpSecurity.exceptionHandling().accessDeniedPage("/login?accessDenied");
       
       httpSecurity.authorizeRequests()
          .antMatchers("/").permitAll()
          .antMatchers("/**/new").access("hasRole('ROLE_USER')")
               .antMatchers("/user").access("hasRole('ROLE_USER')")
          .antMatchers("/**/adds/**").access("hasRole('ROLE_USER')");
       
       httpSecurity.csrf().disable();
    }
}
