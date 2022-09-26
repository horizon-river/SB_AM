package com.kpk.exam.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kpk.exam.demo.vo.Article;

@Controller
public class UsrArticleController {	
	private List<Article> articles;
	private int lastArticleId;
	
	public UsrArticleController() {
		this.articles = new ArrayList<>();
		this.lastArticleId = 0;
		
		makeTestData();
	}
	
	private void makeTestData() {
		for (int i = 1; i <= 10; i++) {
			int id = lastArticleId + 1;
			String title = "제목" + id;
			String body = "내용" + id;
			
			Article article = new Article(id, title, body);
			
			articles.add(article);
			lastArticleId = id;
		}
	}

	@RequestMapping("usr/article/doAdd")
	@ResponseBody
	public Article doAdd(String title, String body) {
		int id = lastArticleId + 1;
		Article article = new Article(id, title, body);
		articles.add(article);
		lastArticleId = id;
		
		return article;
	}
	
	@RequestMapping("usr/article/getArticles")
	@ResponseBody
	public List<Article> getArticles() {
		return articles;
	}
}