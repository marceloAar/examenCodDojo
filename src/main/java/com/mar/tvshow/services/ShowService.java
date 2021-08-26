package com.mar.tvshow.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.mar.tvshow.models.Show;

import com.mar.tvshow.repositories.ShowRepository;

@Service
public class ShowService {

private final ShowRepository showRepository;
    
    public ShowService(ShowRepository showRepository) {
        this.showRepository = showRepository;
    }
    
    //Obtiene todos los show
    public List<Show> allUser() {
	    return showRepository.findAll();
	 }
    
    //Crea o actualiza show 
  	public Show creaEditaShow(Show b) {
  	    return showRepository.save(b);
  	}
    
    //Obteniendo la información de un ID
  	 public Show buscarShow(Long id) {
  	    Optional<Show> optional = showRepository.findById(id);
  	    if(optional.isPresent()) {
  	        return optional.get();
  	    } else {
  	        return null;
  	    }
  	 }
    
    //Elimina un registro por ID
	public void deleteShow(Long id ) {	    	
		showRepository.deleteById(id);
	}     

}
