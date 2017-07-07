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
 * Created by rifat on 5/4/17.
 */
@Repository
public class AddRepository {


    @Autowired
    private NamedParameterJdbcTemplate jdbcTemplate;

    public List<Add> getAllAdds() {
        Map<String, Object> params = new HashMap<String, Object>();
        List<Add> result = jdbcTemplate.query("SELECT * FROM ADD", params, new AddMapper());

        return result;
    }

    private static final class AddMapper implements RowMapper<Add> {
        public Add mapRow(ResultSet rs, int rowNum) throws SQLException {

            Add add = new Add();
            add.setId(rs.getInt("ID"));
            add.setFlatId(rs.getInt("FLAT_ID"));
            add.setTitle(rs.getString("TITLE"));
            add.setOwnerId(rs.getInt("OWNER_ID"));
            add.setOwnersName(rs.getString("OWNERS_NAME"));
            add.setPropertyType(rs.getString("PROPERTY_TYPE"));
            add.setPurpose(rs.getString("PURPOSE"));
            add.setLocation(rs.getString("LOCATION"));
            add.setCity(rs.getString("CITY"));
            add.setDetails(rs.getString("DETAILS"));
            add.setPrice(rs.getInt("PRICE"));
            add.setSqFeet(rs.getInt("SQ_FEET"));
            add.setBed(rs.getInt("BED"));
            add.setBath(rs.getInt("BATH"));
            Blob b=rs.getBlob("IMAGE");
            if(b!=null)add.setImage(b.getBytes(1, (int) b.length()));
            //System.out.println(add.getId()+" "+add.getImage().length);
            return add;
        }

    }

    public Add getAddById(int addID) {
        String SQL = "SELECT * FROM ADD WHERE ID = :id";
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", addID);
        return jdbcTemplate.queryForObject(SQL, params, new AddMapper());

    }

    public List<Add>getAddsByPropertyType(String propertyType)
    {
        String SQL="SELECT * FROM ADD WHERE PROPERTY_TYPE =:propertyType";
        Map<String, Object> params= new HashMap<>();
        params.put("propertyType",propertyType);
        return jdbcTemplate.query(SQL,params,new AddMapper());
    }

    public List<Add>getAddsByPurpose(String purpose)
    {
        String SQL="SELECT * FROM ADD WHERE PURPOSE = :purpose";
        Map<String,Object> params=new HashMap<>();
        params.put("purpose",purpose);
        return jdbcTemplate.query(SQL,params,new AddMapper());
    }





    public List<Add> getAddssByFilter(Map<String, List<String>> filterParams) {
        String SQL = "SELECT * FROM ADD WHERE PROPERTY_TYPE IN ( :ptype ) AND PURPOSE IN ( :purpose)";

        return jdbcTemplate.query(SQL, filterParams, new AddMapper());
    }

    public List<Add> getAddsByCustomSearch(Search search)
    {
        String SQL="SELECT * FROM ADD WHERE PRICE >= ( :minprice) AND" +
                " PRICE <=( :maxprice) AND CITY IN ( :cities) AND BED >= ( :minbed) AND BED <=( :maxbed) AND " +
                "BATH >= ( :minbath) AND BATH <= ( :maxbath)";
        if(search.getCities().size()==0)search.setCities(search.getAllCities());

        Map<String,Object> params=new HashMap<>();
        params.put("minprice",search.getMinPrice());
        params.put("maxprice",search.getMaxPrice());
        params.put("cities",search.getCities());
        params.put("minbed",search.getMinBed());
        params.put("maxbed",search.getMaxBed());
        params.put("minbath",search.getMinBath());
        params.put("maxbath",search.getMaxBath());
        return jdbcTemplate.query(SQL,params,new AddMapper());
    }


    public void placeNewAdd(Add newAdd) {


        String SQL = "INSERT INTO ADD (ID, "
                + "TITLE,"
                + "FLAT_ID,"
                + "OWNER_ID,"
                + "OWNERS_NAME,"
                + "PROPERTY_TYPE,"
                + "PURPOSE,"
                + "LOCATION,"
                + "CITY,"
                + "DETAILS,"
                + "PRICE,"
                + "SQ_FEET,"
                + "BED,"
                + "BATH,"
                +"IMAGE) "
                + "VALUES (DEFAULT , :title, :flatid, :ownerid, :ownername, :proptype, :purpose," +
                " :location, :city, :details, :price, :sqfeet, :bed, :bath, :image)";

        Map<String, Object> params = new HashMap<>();
        params.put("title",newAdd.getTitle());
        params.put("flatid",newAdd.getFlatId());
        params.put("ownerid",newAdd.getOwnerId());
        params.put("ownername",newAdd.getOwnersName());
        params.put("proptype",newAdd.getPropertyType());
        params.put("purpose",newAdd.getPurpose());
        params.put("location",newAdd.getLocation());
        params.put("city",newAdd.getCity());
        params.put("details",newAdd.getDetails());
        params.put("price",newAdd.getPrice());
        params.put("sqfeet",newAdd.getSqFeet());
        params.put("bed",newAdd.getBed());
        params.put("bath",newAdd.getBath());
        params.put("image",newAdd.getImage() );


        jdbcTemplate.update(SQL, params);
    }

}

