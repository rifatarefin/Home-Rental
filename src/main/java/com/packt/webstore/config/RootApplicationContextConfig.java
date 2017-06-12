package com.packt.webstore.config;

import javax.sql.DataSource;

import org.h2.tools.Server;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import java.sql.SQLException;

@Configuration
@ComponentScan("com.packt.webstore")
public class RootApplicationContextConfig {

   @Bean
   public DataSource dataSource() {
      EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
      EmbeddedDatabase db = builder
         .setType(EmbeddedDatabaseType.H2)
         .addScript("db/sql/create-table.sql")
         .addScript("db/sql/insert-data.sql")
         .build();
//       try {
//           Server server=Server.createWebServer().start();
//           System.out.println(server.getURL());
//       } catch (SQLException e) {
//           e.printStackTrace();
//       }
       return db;
   }
  
   @Bean
   public NamedParameterJdbcTemplate getJdbcTemplate() {
      return new NamedParameterJdbcTemplate(dataSource());
   }
}
