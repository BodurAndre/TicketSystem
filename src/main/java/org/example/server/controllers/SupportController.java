package org.example.server.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.example.server.models.Support;
import org.example.server.service.SupportService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
@Slf4j
@RequiredArgsConstructor
public class SupportController {
    private final SupportService supportService;

    @GetMapping("/")
    public String supports(@RequestParam(name = "title",required = false) String title, Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        String userRole = authentication.getAuthorities().toString();
        model.addAttribute("supports", supportService.listSupports(title));
        model.addAttribute("userName", userName);
        if(userRole.equals("[ROLE_ADMIN]")){
            return "admin/support";
        }
        return "support/support";
    }

    @RequestMapping(value = "/create",method = RequestMethod.GET)
    public String create(HttpServletRequest request, HttpServletResponse response, Model model){
        Support support = new Support();
        model.addAttribute("support",support);
        return "support/support-create";
    }


    @GetMapping("/support/{id}")
    public String supportsInfo(@PathVariable Long id, Model model){
        Support support = supportService.getSupportById(id);
        model.addAttribute("support", support);
        model.addAttribute("images", support.getImages());
        return "support/support-info";
    }

    @GetMapping("/support/delete/{id}")
    public String supportDelete(@PathVariable Long id, Model model){
        Support support = supportService.getSupportById(id);
        model.addAttribute("support", support);
        model.addAttribute("images", support.getImages());
        return "support/support-delete";
    }

    @GetMapping("/support/copy")
    public  String SupportCopy(@RequestParam(name = "title",required = false) String title, Model model){
        model.addAttribute("supports", supportService.listSupports(title));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        model.addAttribute("userName", userName);
        return "support/support-copy";
    }

    @PostMapping(value = "/support/create")
    public String createSupport(@RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3,
                                @ModelAttribute("support") Support support) {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String userName = authentication.getName();
            support.setUser(userName);
            supportService.saveSupport(support, file1, file2, file3);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            return "error-page";
        }
    }

    @PostMapping("/support/hide/{id}")
    @Transactional
    public String hideSupport(@PathVariable Long id){
        supportService.hideSupport(id);
        return "redirect:/";
    }

    @PostMapping("/support/delete/{id}")
    @Transactional
    public String deleteSupport(@PathVariable Long id){
        supportService.deleteSupport(id);
        return "redirect:/";
    }

    @PostMapping("/support/delete/image/{id}")
    @Transactional
    public String deleteImage(@PathVariable Long id){
        supportService.deleteImage(id);
        return "redirect:/";
    }

    @PostMapping(value = "/support/edit/{ID}")
    public String editSupport(@PathVariable Long ID,
                              @RequestParam("tema") String tema,
                              @RequestParam("priority") String priority,
                              @RequestParam("status") String status,
                              @RequestParam("description") String description) {
        log.info("Changing support with id: {}", ID, tema, priority, status, description);
        Support support = supportService.getSupportById(ID);
        support.setTema(tema);

        if (!description.isEmpty()) {
            support.setDescription(description);
        }
        support.setPriority(priority);
        support.setStatus(status);
        if(status.equals("Закрыта")){
            support.setActive("false");
        }
        else {
            support.setActive("true");
        }
        supportService.changeSupport(support);
        return "redirect:/";
    }
}