package com.nutrimedica.nutrimedica_api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nutrimedica.nutrimedica_api.dto.User;
import com.nutrimedica.nutrimedica_api.repository.UserRepository;
import com.nutrimedica.nutrimedica_api.utils.JwtUtil;
import com.nutrimedica.nutrimedica_api.utils.PasswordUtils;

@Service
public class UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void createUser(User user) {

        String encryptedPassword = PasswordUtils.encryptPassword(user.getPassword());
        user.setPassword(encryptedPassword);

        userRepository.createUser(user);
    }

    public String login(User user) {
        User findUser = userRepository.getUser(user.getEmail());

        if (findUser == null) {
            return "Dados inválidos";
        }

        if (!PasswordUtils.checkPassword(user.getPassword(), findUser.getPassword())) {
            return "Dados inválidos";
        }

        String jwtToken = JwtUtil.generateToken(findUser.getId());

        return jwtToken;
    }
}