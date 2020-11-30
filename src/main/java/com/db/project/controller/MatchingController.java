package com.db.project.controller;

import com.db.project.matching.MatchingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MatchingController {

    @Autowired
    MatchingService matchingService;



}
