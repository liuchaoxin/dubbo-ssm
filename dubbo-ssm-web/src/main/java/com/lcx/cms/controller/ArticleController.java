package com.lcx.cms.controller;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.lcx.cms.pojo.Article;
import com.lcx.cms.pojo.Condition;
import com.lcx.cms.service.ArticleService;

@Controller
public class ArticleController {
	
	@Reference
	private ArticleService   articleService;
	
	@RequestMapping("list")
	public String list(Condition con,Model m,@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "5")Integer pageSize) {
		
		PageInfo<Article> selects = articleService.selects(pageNum, pageSize, con);
		m.addAttribute("con", con);
		m.addAttribute("info", selects);
		return "list";
		
		
		
	}
	
	
	
}
