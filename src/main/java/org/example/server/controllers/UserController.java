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
public class UserController {
    private final UserService userService;
    private final UserRepository userRepository;

    @GetMapping("/support/AllAccount")
    public String userAccount(@RequestParam(name = "title",required = false) String title, Model model){
        model.addAttribute("users", userService.listUser());
        return "support/account/All-account";
    }

    @GetMapping("/support/account/{id}")
    public String supportDelete(@PathVariable Long id, Model model){
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "support/account/account-info";
    }

    @GetMapping("/support/account/myAccount")
    public String myAccount(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        User user = userRepository.findUserByEmail(userName);
        model.addAttribute("user", user);
        return "support/account/My-account";
    }

    @GetMapping("/support/account/edit")
    public String ediAccount(Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        User user = userRepository.findUserByEmail(userName);
        model.addAttribute("user", user);
        return "support/account/edit-myAccount";
    }

    @PostMapping("/support/account/editAccount")
    public String AccountEdit(@RequestParam(name = "firstName") String firstName,
                              @RequestParam(name = "lastName") String lastName,
                              @RequestParam(name = "email") String email){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userName = authentication.getName();
        User user = userRepository.findUserByEmail(userName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        userRepository.save(user);
        return "redirect:/";
    }
}
