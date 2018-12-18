package com.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daoapi.TodoDao;
import com.entities.Todo;
import com.servicesapi.TodoService;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	TodoDao userDao;
	
	public boolean saveOrUpdate(Todo users) {
		return userDao.saveOrUpdate(users);
	}

	public List<Todo> list() {
		// TODO Auto-generated method stub
		return userDao.list();
	}

	public boolean delete(Todo users) {
		// TODO Auto-generated method stub
		return userDao.delete(users);
	}	
	
}
