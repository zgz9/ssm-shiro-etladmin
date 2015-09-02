package cn.zg.service;

import java.util.List;
import java.util.Map;

import cn.zg.domain.Person;

public interface PersonService {
	public List<Person> find(Map pMap);
	public void insert(Person person);
	public void update(Person person);
	public void delete(Integer[] ids);
}
