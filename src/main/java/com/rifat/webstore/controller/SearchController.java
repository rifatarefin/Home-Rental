package com.rifat.webstore.controller;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

/**
 * Created by rifat on 5/27/17.
 */
public class SearchController {
    @InitBinder("search")
    public void initialiseBinderSearch(WebDataBinder binder)
    {
        binder.setAllowedFields("minPrice");
    }
}
