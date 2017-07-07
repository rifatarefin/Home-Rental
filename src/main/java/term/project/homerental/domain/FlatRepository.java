package term.project.homerental.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rifat on 7/7/17.
 */
@Repository
public class FlatRepository {

    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    private static final class FlatMapper implements RowMapper<Flat>
    {

        @Override
        public Flat mapRow(ResultSet rs, int rowNum) throws SQLException {

            Flat flat=new Flat();
            flat.setFlatId(rs.getInt("FLAT_ID"));
            flat.setOwnerId(rs.getInt("OWNER_ID"));
            flat.setOwnerName(rs.getString("OWNERS_NAME"));
            flat.setPropertyType(rs.getString("PROPERTY_TYPE"));
            flat.setLocation(rs.getString("LOCATION"));
            flat.setCity(rs.getString("CITY"));
            flat.setSqFeet(rs.getInt("SQ_FEET"));
            flat.setBed(rs.getInt("BED"));
            flat.setBath(rs.getInt("BATH"));
            Blob b=rs.getBlob("IMAGE");
            if(b!=null)flat.setImage(b.getBytes(1, (int) b.length()));

            return flat;
        }
    }

    public List<Flat>getProperties(String username)
    {
        String SQL="SELECT * FROM FLAT WHERE OWNER_ID=(SELECT USER_ID FROM USERS WHERE USERNAME = :username)";

        Map<String,Object> params=new HashMap<>();
        params.put("username",username);
        return jdbcTemplate.query(SQL,params,new FlatMapper());
    }

}
