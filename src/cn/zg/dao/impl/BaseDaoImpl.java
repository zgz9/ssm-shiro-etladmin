package cn.zg.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import cn.zg.dao.BaseDao;

public abstract class BaseDaoImpl<T> extends SqlSessionDaoSupport implements BaseDao<T> {
	//怎么实现spring给我们注入sqlSessionFactory
	@Resource
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	private String ns;
	public String getNs() {
		return ns;
	}
	public void setNs(String ns) {
		this.ns = ns;
	}

	@Override
	public List<T> find(Map pMap) {
		return super.getSqlSession().selectList(this.getNs()+".find", pMap);
	}

	@Override
	public void insert(T entity) {
		super.getSqlSession().insert(this.getNs()+".insert", entity);
	}

	@Override
	public void update(T entity) {
		super.getSqlSession().update(this.getNs()+".update", entity);
	}

	@Override
	public void delete(Integer[] ids) {
		super.getSqlSession().delete(this.getNs()+".delete", ids);
	}

}
