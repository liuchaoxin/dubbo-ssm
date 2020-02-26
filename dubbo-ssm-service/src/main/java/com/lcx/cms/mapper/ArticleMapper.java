package com.lcx.cms.mapper;

import java.util.List;

import com.lcx.cms.pojo.Article;
import com.lcx.cms.pojo.Condition;


public interface ArticleMapper {

	List<Article> selects(Condition con);

}
