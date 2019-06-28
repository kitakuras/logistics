package com.zz.service;

import java.util.List;

import com.zz.pojo.BasicData;

public interface IBasicDataService {

	public List<BasicData> query(BasicData bd);
	
	public Integer addBasicData(BasicData bd);
	
	public Integer updateBasicData(BasicData bd);
	
	public Integer deleteBasicData(Integer id);
	
	public BasicData queryById(Integer id);

	public List<BasicData> queryParentData();

	public List<BasicData> queryBase(String typeName);
}
