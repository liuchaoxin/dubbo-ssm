package com.lcx.cms.service;

import com.github.pagehelper.PageInfo;
import com.lcx.cms.pojo.Article;
import com.lcx.cms.pojo.Condition;

public interface ArticleService {

	PageInfo<Article> selects(Integer pageNum, Integer pageSize, Condition con);

}
