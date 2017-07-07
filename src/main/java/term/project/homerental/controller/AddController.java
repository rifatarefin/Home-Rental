package term.project.homerental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import term.project.homerental.domain.Add;
import term.project.homerental.domain.AddRepository;
import term.project.homerental.domain.Search;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class AddController {




    @Autowired
    private AddRepository addRepository;

    @InitBinder("newAdd")
    public void initialiseBinder(WebDataBinder binder) {
        binder.setAllowedFields("productId",
                "name",
                "unitPrice",
                "description",
                "manufacturer",
                "category",
                "unitsInStock",
                "condition",
                "flatId",
                "title",
                "propertyType",
                "purpose",
                "image",
                "bed",
                "bath",
                "city",
                "details",
                "sqFeet",
                "location",
                "price");
    }


    @InitBinder("search")
    public void initialiseBinderSearch(WebDataBinder binder) {
        binder.setAllowedFields("minPrice",
                "maxPrice",
                "cities",
                "minBed",
                "maxBed",
                "minBath",
                "maxBath");
    }


    @RequestMapping("/add/img")
    public void imge(@RequestParam int addId, Model model, HttpServletResponse response) throws IOException {
        Add addFromRepo = addRepository.getAddById(addId);
        response.setContentType("image");
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(addFromRepo.getImage());
        outputStream.flush();
        outputStream.close();
    }


    @RequestMapping("/add")
    public String getAddById(@RequestParam("id") int addId, Model model, HttpSession session) {
        model.addAttribute("add", addRepository.getAddById(addId));
        session.setAttribute("add", addRepository.getAddById(addId));

        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        String username=auth.getName();
        model.addAttribute("username",username);

        return "add";
    }

    @RequestMapping(value = "/adds", method = RequestMethod.GET)
    public String list2(Model model) {
        Search search = new Search();


        model.addAttribute("allCities", search.getAllCities());
        model.addAttribute("adds", addRepository.getAllAdds());
        model.addAttribute("search", search);

        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        String username=auth.getName();
        model.addAttribute("username",username);


        return "adds";
    }

    @RequestMapping(value = "/adds", method = RequestMethod.POST)
    public String submitSearch(@ModelAttribute("search") Search search, Model model) {


        model.addAttribute("adds", addRepository.getAddsByCustomSearch(search));
        model.addAttribute("allCities", search.getAllCities());
        System.out.println(search.getMinBed());

        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        String username=auth.getName();
        model.addAttribute("username",username);


        return "adds";
    }


    @RequestMapping(value = "/adds/new", method = RequestMethod.GET)
    public String getPlaceAdd(Model model) {
        Add newAdd = new Add();
        model.addAttribute("newAdd", newAdd);

        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        String username=auth.getName();
        model.addAttribute("username",username);
        return "newAdd";
    }


    @RequestMapping(value = "/adds/new", method = RequestMethod.POST)
    public String processNewAddForm(@ModelAttribute("newAdd") Add newAdd, BindingResult result) {

        String[] suppressedFields = result.getSuppressedFields();
        if (suppressedFields.length > 0) {
            throw new RuntimeException("Attempting to bind disallowed fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
        }


        addRepository.placeNewAdd(newAdd);
        return "redirect:/adds";
    }


    @RequestMapping("/adds/propertyType/{propertyType}")
    public String getAddsByPropertyType(Model model, @PathVariable("propertyType") String propertyType) {

        Search search=new Search();
        model.addAttribute("allCities", search.getAllCities());
        model.addAttribute("adds", addRepository.getAddsByPropertyType(propertyType));
        model.addAttribute("search", search);

        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        String username=auth.getName();
        model.addAttribute("username",username);
        return "adds";
    }

    @RequestMapping("/adds/purpose/{purpose}")
    public String getAddsByPurpose(Model model, @PathVariable("purpose")String purpose)
    {
        Search search=new Search();
        model.addAttribute("allCities",search.getAllCities());
        model.addAttribute("adds",addRepository.getAddsByPurpose(purpose));
        model.addAttribute("search", search);

        Authentication auth= SecurityContextHolder.getContext().getAuthentication();
        String username=auth.getName();
        model.addAttribute("username",username);
        return "adds";
    }


    @RequestMapping("/adds/filter/{params}")
    public String getAddssByFilter(@MatrixVariable(pathVar = "params") Map<String, List<String>> filterParams, Model model) {
        model.addAttribute("adds", addRepository.getAddssByFilter(filterParams));
        return "adds";
    }


    //////////////////




    @InitBinder
    public void initMultipartConverter(WebDataBinder webDataBinder) {
        ByteArrayMultipartFileEditor multipartFileEditor = new ByteArrayMultipartFileEditor();
        webDataBinder.registerCustomEditor(byte[].class, multipartFileEditor);
    }


}


