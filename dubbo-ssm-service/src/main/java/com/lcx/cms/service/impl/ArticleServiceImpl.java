package com.lcx.cms.service.impl;

import java.util.List;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lcx.cms.mapper.ArticleMapper;
import com.lcx.cms.pojo.Article;
import com.lcx.cms.pojo.Condition;
import com.lcx.cms.service.ArticleService;
@Service(interfaceClass=ArticleService.class)
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleMapper   articleMapper;
	
	@Override
	public PageInfo<Article> selects(Integer pageNum, Integer pageSize, Condition con) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<Article> list = articleMapper.selects(con);
		PageInfo<Article> info = new PageInfo<Article>(list);
		return info;
		
	}

}
