package cn.zg.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zg.dao.PersonDao;
import cn.zg.domain.Person;
import cn.zg.service.PersonService;

@Service
public class PersonServiceImpl implements PersonService {
	public PersonServiceImpl() {
	}
	
	@Resource
	PersonDao personDao;

	@Override
	public List<Person> find(Map pMap) {
		return personDao.find(pMap);
	}

	@Override
	public void insert(Person person) {
		personDao.insert(person);
	}

	@Override
	public void update(Person person) {
		personDao.update(person);
	}

	@Override
	public void delete(Integer[] ids) {
		personDao.delete(ids);
	}

}
