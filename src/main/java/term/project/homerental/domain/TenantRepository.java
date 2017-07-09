package term.project.homerental.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by rifat on 7/9/17.
 */
public class TenantRepository {


    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    public static final class TenantMapper implements RowMapper<Tenant>{

        @Override
        public Tenant mapRow(ResultSet rs, int rowNum) throws SQLException {
            Tenant tenant=new Tenant();
            tenant.setUsername(rs.getString("USERNAME"));
            tenant.setEmail(rs.getString("EMAIL"));
            tenant.setPermanentAddress("PERMANENT_ADDR");
            tenant.setOccupation(rs.getString("OCCUPATION"));
            tenant.setWorkAddress(rs.getString("WORK_ADDR"));

            return tenant;
        }
    }

}
