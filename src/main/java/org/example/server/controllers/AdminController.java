package org.example.server.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.server.models.Support;
import org.example.server.models.User;
import org.example.server.repositories.UserRepository;
import org.example.server.service.SupportService;
import org.example.server.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
@RequiredArgsConstructor
public class AdminController {
    private final SupportService supportService;
    private final UserService userService;
    private final UserRepository userRepository;

    @RequestMapping(value = "/admin/MyAccount",method = RequestMethod.GET)
    public String MyAccount(){
        return "admin/support-account";
    }


    @GetMapping("/admin/support/copy")
    public  String SupportCopy(@RequestParam(name = "title",required = false) String title, Model model){
        model.addAttribute("supports", supportService.listSupports(title));
        return "admin/support-copy";
    }

    @PostMapping(value = "/admin/support/change/{id}")
    public String changeSupport(@PathVariable Long id,
                                @RequestParam("text") String string){
        try {
            supportService.supplementSupport(id, string);
            supportService.hideSupport(id);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            return "error-page";
        }
    }

    @GetMapping("/admin/support/{id}")
    public String supportsInfo(@PathVariable Long id, Model model){
        Support support = supportService.getSupportById(id);
        model.addAttribute("support", support);
        model.addAttribute("images", support.getImages());
        return "/admin/support-info";
    }

    @GetMapping("/admin/support/delete/{id}")
    public String supportInfoDelete(@PathVariable Long id, Model model){
        Support support = supportService.getSupportById(id);
        model.addAttribute("support", support);
        model.addAttribute("images", support.getImages());
        return "/admin/support-delete";
    }

    @PostMapping("/admin/support/resume/{id}")
    public String resumeSupport(@PathVariable Long id) {
        try {
            log.info("Resuming support with id: {}", id);
            supportService.resumeSupport(id);
            return "redirect:/";
        } catch (Exception e) {
            log.error("Error resuming support", e);
            return "error-page";
        }
    }


    @GetMapping("/admin/account/allAccount")
    public String userAccount(@RequestParam(name = "title",required = false) String title, Model model){
        model.addAttribute("users", userService.listUser());
        return "/admin/account/All-account";
    }

    @GetMapping("/admin/account/MyAccount")
    public String myAccount(Model model) {
        User user = userService.getCurrentAuthenticatedUser();
        model.addAttribute("user", user);
        return "admin/account/My-account";
    }

    @GetMapping("/admin/account/{id}")
    public String supportDelete(@PathVariable Long id, Model model){
        model.addAttribute("user", userService.getUserById(id));
        return "admin/account/account-info";
    }

    @PostMapping("/admin/account/editAccount")
    public String accountEdit(@RequestParam(name = "Role") String role,
                              @RequestParam(name = "name") String email) {
        userService.updateUserRole(email, role);
        return "redirect:/";
    }

    @PostMapping("/admin/account/editMyAccount")
    public String myAccountEdit(@RequestParam(name = "firstName") String firstName,
                                @RequestParam(name = "lastName") String lastName,
                                @RequestParam(name = "email") String email) {
        User user = userService.getCurrentAuthenticatedUser();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        userRepository.save(user);
        return "redirect:/";
    }

    @GetMapping("/admin/account/editMyAccount")
    public String ediAccount(Model model){
        User user = userService.getCurrentAuthenticatedUser();
        model.addAttribute("user", user);
        return "/admin/account/edit-myAccount";
    }
}
