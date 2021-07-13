package kr.swcore.sdmes.store;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.swcore.sdmes.code.service.CodeService;
import kr.swcore.sdmes.goods.service.GoodsService;
import kr.swcore.sdmes.store.dto.StoreDTO;
import kr.swcore.sdmes.store.service.StoreService;
import kr.swcore.sdmes.supp.service.SuppService;

@Controller
@RequestMapping("/store/*")
public class StoreController {
	
	@Inject
	StoreService storeService;
	
	@Inject
	GoodsService goodsService;
	
	@Inject
	SuppService suppService;
	
	@Inject
	CodeService codeService;

	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("store/listview");
		mav.addObject("list01", storeService.listgoodsio(null));
		mav.addObject("goods", goodsService.listGoods01());
		return mav;
	}
	
	@RequestMapping("listviewReq.do")
	public ModelAndView listviewReq(ModelAndView mav) {
		mav.setViewName("store/listviewReq");
		mav.addObject("list01", storeService.listStorereq());
		mav.addObject("goods", goodsService.listGoods01());
		return mav;
	}

	@RequestMapping("storeview.do")
	public ModelAndView storeview(ModelAndView mav) {
		mav.setViewName("store/storeview");
		mav.addObject("list01", storeService.listStore());
		return mav;
	}
	
	@RequestMapping("listgoodsio.do")
	public ModelAndView listgio(ModelAndView mav) {
		mav.setViewName("store/listgoodsio");
		mav.addObject("list01", storeService.listgoodsio(null));
		mav.addObject("goods", goodsService.listGoods01());
		return mav;
	}
	
	@RequestMapping("/detailgoodsio/{storeioNo}")
	public ModelAndView gddetail(@PathVariable("storeioNo") Integer storeioNo, ModelAndView mav) {
		mav.setViewName("store/goodsio");
		mav.addObject("dto", storeService.storedetail(storeioNo));
		mav.addObject("list01", storeService.listgoodsio(storeioNo));
		mav.addObject("goods", goodsService.listGoods01());
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}

	@RequestMapping("listsuppio.do")
	public ModelAndView listsio(ModelAndView mav) {
		mav.setViewName("store/listsuppio");
		mav.addObject("list01", storeService.listsuppio(null));
		mav.addObject("supps", suppService.listSupp01(null));
		return mav;
	}

	@RequestMapping("/detailsuppio/{storeioNo}")
	public ModelAndView dddetail(@PathVariable("storeioNo") Integer storeioNo, ModelAndView mav) {
		mav.setViewName("store/suppio");
		mav.addObject("dto", storeService.storedetail(storeioNo));
		mav.addObject("list01", storeService.listsuppio(storeioNo));
		mav.addObject("supps", suppService.listSupp01(storeioNo));
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}

	
	@RequestMapping("goodsio.do")
	public ModelAndView gio(ModelAndView mav) {
		mav.setViewName("store/goodsio");
		mav.addObject("list01", storeService.listgoodsio(null));
		mav.addObject("goods", goodsService.listGoods01());
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}
	
	@RequestMapping("goodsReq.do")
	public ModelAndView greq(ModelAndView mav) {
		mav.setViewName("store/goodsReq");
		mav.addObject("list01", storeService.listgoodsio(null));
		mav.addObject("goods", goodsService.listGoods01());
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}

	
	@RequestMapping("buyreqlistview.do")
	public ModelAndView buyreqlist(ModelAndView mav) {
		mav.setViewName("store/listviewReq");
		mav.addObject("list01", storeService.listStorereq());
		mav.addObject("supp", suppService.listSupp01());
    	mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}
	
	@RequestMapping("buyrequest.do")
	public ModelAndView buyreq(ModelAndView mav) {
		mav.setViewName("store/buyrequest");
		mav.addObject("list01", storeService.listgoodsio());
		mav.addObject("supp", suppService.listSupp01());
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}
	
	@RequestMapping("suppio.do")
	public ModelAndView sio(ModelAndView mav) {
		mav.setViewName("store/suppio");
		mav.addObject("list01", storeService.listsuppio());
		mav.addObject("supps", suppService.listSupp01());
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}
	
	@RequestMapping("suppReq.do")
	public ModelAndView sreq(ModelAndView mav) {
		mav.setViewName("store/suppReq");
		mav.addObject("list01", storeService.listsuppio());
		mav.addObject("supps", suppService.listSupp01());
		mav.addObject("locc",codeService.listCode02(40));
		return mav;
	}

	
	@RequestMapping("storein.do")
	public ModelAndView storein(ModelAndView mav) {
		mav.setViewName("store/storeIn");
		mav.addObject("list01", storeService.listStore());
		return mav;
	}

	@RequestMapping("storeout.do")
	public ModelAndView storeout(ModelAndView mav) {
		mav.setViewName("store/storeout");
		mav.addObject("list01", storeService.listStore());
		return mav;
	}

	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = storeService.insertStore(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("insertReq.do")
	public ResponseEntity<?> insertReq(@ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = storeService.insertStoreReq(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute StoreDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = storeService.updateStore(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute StoreDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int codeUpdate = storeService.deleteStore(dto);
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			
}
