package com.dine.root.search.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dine.root.search.dto.SearchDTO;
import com.dine.root.search.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService {
   @Autowired
   private SearchMapper mapper;
   
   @Override
   public List<SearchDTO> viewAll(String keyword) throws Exception {
      return mapper.viewAll(keyword);
   }

   @Override
   public int countArticle(String keyword) throws Exception {
      return mapper.countArticle(keyword);
   }

   @Override
   public List<SearchDTO> categorise(String country, String addr, String food) {
      return mapper.categorise(country, addr, food);
   }

   @Override
   public int countCategories(String country, String addr, String food) {
      return mapper.countCategories(country, addr, food);
   }
   

}