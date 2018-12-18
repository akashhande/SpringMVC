package com.daoapi;

import java.util.List;

import com.entities.Todo;

public interface TodoDao {
	public boolean saveOrUpdate(Todo users);
	public List<Todo> list();
	public boolean delete(Todo users);
}
