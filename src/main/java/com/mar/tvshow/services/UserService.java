package com.mar.tvshow.services;

import java.util.List;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.mar.tvshow.models.User;
import com.mar.tvshow.repositories.UserRepository;

@Service
public class UserService {
	
private final UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    //Obtiene todos los usuarios
    public List<User> allUser() {
	    return userRepository.findAll();
	 }
    
    //Crea o actualiza usuario 
  	public User creaEditaUser(User b) {
  	    return userRepository.save(b);
  	}
    
    //Obteniendo la información de un ID
  	 public User buscarUser(Long id) {
  	    Optional<User> optional = userRepository.findById(id);
  	    if(optional.isPresent()) {
  	        return optional.get();
  	    } else {
  	        return null;
  	    }
  	 }
    
    //Elimina un registro por ID
	public void deleteUser(Long id ) {	    	
		 userRepository.deleteById(id);
	}
    
    // registrar el usuario y hacer Hash a su password
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }
    
    // encontrar un usuario por su email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
            
    // autenticar usuario
    public boolean authenticateUser(String email, String password) {
        // primero encontrar el usuario por su email
        User user = userRepository.findByEmail(email);
        // si no lo podemos encontrar por su email, retornamos false
        if(user == null) {
            return false;
        } else {
            // si el password coincide devolvemos true, sino, devolvemos false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

}
