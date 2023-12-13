//package org.example.server.service;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.example.server.models.enums.Role;
//import org.example.server.repositories.UserRepository;
//import org.springframework.stereotype.Service;
//import org.example.server.models.User;
//
//
//@Service
//@Slf4j
//@RequiredArgsConstructor
//public class UserService{
//    private final UserRepository userRepository;
//
//    public boolean createUser(User user){
//        String email = user.getEmail();
//        if(userRepository.findByEmail(user.getEmail()) != null) return false;
//        user.setActive(true);
//        user.setPassword(user.getPassword());
//        user.getRoles().add(Role.ROLE_USER);
//        log.info("Saving new User with email: {}", email);
//        return true;
//    }
//}
