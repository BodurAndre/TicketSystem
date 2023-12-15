package org.example.server.service;

import org.example.server.repositories.UserRepository;
import org.springframework.stereotype.Service;
import org.example.server.models.User;


@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository){
        this.userRepository = userRepository;
    }
    public User getUserByEmail(String email){
        User user = userRepository.findUserByEmail(email);
        return user;
    }
    public User createUser(User user){
        User newUser = userRepository.save(user);
        userRepository.flush();
        return newUser;
    }
}
