package org.example.server.controllers;

import org.springframework.ui.Model;
import org.example.server.models.Support;
import org.example.server.service.SupportService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;


@Controller
@RequiredArgsConstructor
public class SupportController {
    private final SupportService supportService;

    @GetMapping("/")
    public  String supports(@RequestParam(name = "title",required = false) String title, Model model){
        model.addAttribute("supports", supportService.listSupports(title));
        return "supports";
    }

    @GetMapping("/support/{id}")
    public String supportsInfo(@PathVariable Long id, Model model){
        Support support = supportService.getSupportById(id);
        model.addAttribute("support", support);
        model.addAttribute("images", support.getImages());
        return "support-info";
    }

    @PostMapping(value = "/support/create")
    public String createSupport(@RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3,
                                @ModelAttribute("support") Support support) {
        try {
            supportService.saveSupport(support, file1, file2, file3);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            return "error-page";
        }
    }



    @PostMapping("/support/delete/{id}")
    public String deleteSupport(@PathVariable Long id){
        supportService.deleteSupport(id);
        return "redirect:/";
    }
}
