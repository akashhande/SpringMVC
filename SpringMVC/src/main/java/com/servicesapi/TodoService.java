package com.servicesapi;

import java.util.List;

import com.entities.Todo;

public interface TodoService {
	public boolean saveOrUpdate(Todo users);
	public List<Todo> list();
	public boolean delete(Todo users);
}
