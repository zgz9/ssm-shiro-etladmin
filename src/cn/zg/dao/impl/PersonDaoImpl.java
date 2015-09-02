package cn.zg.dao.impl;

import org.springframework.stereotype.Repository;

import cn.zg.dao.PersonDao;
import cn.zg.domain.Person;

@Repository
public class PersonDaoImpl extends BaseDaoImpl<Person> implements PersonDao {
	//默认构造方法设置命名空间
	public PersonDaoImpl() {
		super.setNs("cn.zg.mapper.PersonMapper");
	}
}
