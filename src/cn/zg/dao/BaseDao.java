package cn.zg.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	public List<T> find(Map pMap);
	public void insert(T entity);
	public void update(T entity);
	public void delete(Integer[] ids);
}
