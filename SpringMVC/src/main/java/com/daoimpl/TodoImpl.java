package com.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daoapi.TodoDao;
import com.entities.Todo;


@Repository
@Transactional
public class TodoImpl implements TodoDao{

	@Autowired
	SessionFactory session;
	
	public boolean saveOrUpdate(Todo users) {
		// TODO Auto-generated method stub
		session.getCurrentSession().saveOrUpdate(users);
		return true;
	}

	public List<Todo> list() {
		return session.getCurrentSession().createQuery("from Todo").list();
	}

	public boolean delete(Todo users) {
		try{
			session.getCurrentSession().delete(users);
		}catch(Exception ex){
			return false;
		}
		
		return true;
	}
	
	
}
