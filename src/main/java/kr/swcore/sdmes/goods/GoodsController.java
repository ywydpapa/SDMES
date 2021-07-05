package kr.swcore.sdmes.goods;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sdmes.goods.dto.GoodsDTO;
import kr.swcore.sdmes.goods.service.GoodsService;

@Controller
@RequestMapping("/goods/*")
public class GoodsController {
	
	@Inject
	GoodsService goodsService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("goods/listview");
		mav.addObject("list01", goodsService.listGoods01());
		return mav;
	}
	
	
	@RequestMapping("listGoods01.do")
	public ModelAndView listgoods01(ModelAndView mav) {
		mav.setViewName("goods/list01goods");
		mav.addObject("list01", goodsService.listGoods01());
		return mav;
	}
	
	@RequestMapping("listGoods.do")
	public ModelAndView listgoods(ModelAndView mav) {
		mav.setViewName("goods/list01goods");
		mav.addObject("list01", goodsService.listGoods());
		return mav;
	}

	@RequestMapping("/goodsdetail/{goodsNo}")
	public ModelAndView detail(@PathVariable("goodsNo") Integer goodsNo, ModelAndView mav) {
		mav.setViewName("goods/goodsdetail");
		mav.addObject("dto", goodsService.goodsDetail(goodsNo));
		return mav;
	}
	
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = goodsService.insertGoods(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute GoodsDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = goodsService.updateGoods(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute GoodsDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int codeUpdate = goodsService.deleteGoods(dto);
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			
	
	
	
	
}
