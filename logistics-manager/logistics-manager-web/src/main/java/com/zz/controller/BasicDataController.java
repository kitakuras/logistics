package com.zz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zz.pojo.BasicData;
import com.zz.service.IBasicDataService;

@Controller
@RequestMapping("/basicdata")
public class BasicDataController {

	@Autowired
	private IBasicDataService basicDataService;

	@RequestMapping("/query")
	public String query(BasicData bd, Model m) {
		m.addAttribute("list", basicDataService.query(bd));
		return "basicdata/basicdata";
	}
	
	@RequestMapping("/goAddOrUpdate")
	public String goAddOrUpdate(Integer baseId,Model m) {
		if (baseId != null) {
			m.addAttribute("data", basicDataService.queryById(baseId));
		}
		List<BasicData> parents = basicDataService.queryParentData();
		m.addAttribute("parents", parents);
		return "basicdata/update_basicdata";
	}
	
	@RequestMapping("/saveAddOrUpdate")
	public String saveAddOrUpdate(BasicData bd,Model m) {
		if (bd.getParentId() == -1) {
			bd.setParentId(null);
		}
		if (bd.getBaseId() != null) {
			basicDataService.updateBasicData(bd);
		} else {
			basicDataService.addBasicData(bd);
		}
		return "redirect:/basicdata/query";
	}
	@RequestMapping("/delete")
	public String delete(Integer baseId){
		basicDataService.deleteBasicData(baseId);
		return "redirect:/basicdata/query";
	}
}
