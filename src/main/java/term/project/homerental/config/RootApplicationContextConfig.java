package term.project.homerental.config;

import org.h2.tools.Server;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.init.DataSourceInitializer;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.sql.DataSource;
import java.sql.SQLException;
@EnableWebMvc
@Configuration
@ComponentScan("term.project.homerental")
//@Import(SecurityConfig.class)
public class RootApplicationContextConfig {

   @Bean
   public DataSource dataSource() {
       DriverManagerDataSource dataSource = new DriverManagerDataSource();
       dataSource.setDriverClassName("org.h2.Driver");
       dataSource.setUrl("jdbc:h2:file:/tmp/h2db;DB_CLOSE_DELAY=-1");
       dataSource.setUsername("sa");
       dataSource.setPassword("");

//       return dataSource;

//       EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
//      EmbeddedDatabase db = builder
//         .setType(EmbeddedDatabaseType.H2)
//         .addScript("db/sql/create-table.sql")
//         .addScript("db/sql/insert-data.sql")
//         .build();
       try {
           Server server=Server.createWebServer().start();
           System.out.println(server.getURL());
       } catch (SQLException e) {
           e.printStackTrace();
       }

       return dataSource;
   }

   @Bean
   public DataSourceInitializer dataSourceInitializer() {
       DataSourceInitializer dataSourceInitializer = new DataSourceInitializer();
       dataSourceInitializer.setDataSource(this.dataSource());
       dataSourceInitializer.setDatabasePopulator(this.databasePopulator());

       return dataSourceInitializer;
   }

    @Bean
    public NamedParameterJdbcTemplate getJdbcTemplate() {
        return new NamedParameterJdbcTemplate(dataSource());
    }

   @Bean
   public DatabasePopulator databasePopulator() {
       ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
       populator.addScript(new ClassPathResource("/db/sql/create-table.sql"));
       populator.addScript(new ClassPathResource("/db/sql/insert-data.sql"));

       return populator;
   }


}
