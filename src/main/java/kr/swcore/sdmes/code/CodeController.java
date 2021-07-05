package kr.swcore.sdmes.code;

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

import kr.swcore.sdmes.code.dto.CodeDTO;
import kr.swcore.sdmes.code.service.CodeService;

@Controller
@RequestMapping("/code/*")
public class CodeController {

	@Inject
	CodeService codeService;
	
	@RequestMapping("listview.do")
	public ModelAndView listview(ModelAndView mav) {
		mav.setViewName("code/listview");
		mav.addObject("list01", codeService.listCode01());
		return mav;
	}
	
	
	@RequestMapping("listCode01.do")
	public ModelAndView list0201(ModelAndView mav) {
		mav.setViewName("code/list01code");
		mav.addObject("list01", codeService.listCode01());
		return mav;
	}
	
	@RequestMapping("listCode02.do")
	public ModelAndView list0202(ModelAndView mav) {
		mav.setViewName("code/list02code");
		mav.addObject("list01", codeService.listCode01());
		return mav;
	}
	
	@RequestMapping("getCode02.do")
	public ModelAndView get02(@RequestParam("motherCode") Integer motherCode,ModelAndView mav) {
		mav.setViewName("code/get02code");
		mav.addObject("list02", codeService.listCode02(motherCode));
		return mav;
	}


	@RequestMapping("getCode02-1.do")
	public ModelAndView get021(@RequestParam("motherCode") Integer motherCode,ModelAndView mav) {
		mav.setViewName("code/get021code");
		mav.addObject("list02", codeService.listCode02(motherCode));
		return mav;
	}
	
	@RequestMapping("getCode03.do")
	public ModelAndView get03(@RequestParam("motherCode") Integer motherCode,ModelAndView mav) {
		mav.setViewName("code/get03code");
		mav.addObject("list03", codeService.listCode03(motherCode));
		return mav;
	}
	
	

	@RequestMapping("listCode03.do")
	public ModelAndView list0203(ModelAndView mav) {
		mav.setViewName("code/list03code");
		mav.addObject("list01", codeService.listCode01());
		return mav;
	}


	@RequestMapping("/detail/{codeNo}")
	public ModelAndView detail(@PathVariable("codeNo") Integer codeNo, ModelAndView mav) {
		mav.setViewName("code/detailcode");
		mav.addObject("dto", codeService.codeDetail(codeNo));
		return mav;
	}
	
	
	@RequestMapping("insert.do")
	public ResponseEntity<?> insert(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeInsert = codeService.insertCode(dto);
		if (codeInsert >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("update.do")
	public ResponseEntity<?> update(@ModelAttribute CodeDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		int codeUpdate = codeService.updateCode(dto);
		if (codeUpdate >0) {
			param.put("code","10001"); 
		}
		else {param.put("code","20001");
		}
		return ResponseEntity.ok(param);
	}
	
	@RequestMapping("delete.do")
			public ResponseEntity<?> delete(@ModelAttribute CodeDTO dto) {
			Map<String, Object> param = new HashMap<String, Object>();
			int codeUpdate = codeService.deleteCode(dto);
			if (codeUpdate >0) {
				param.put("code","10001"); 
			}
			else {param.put("code","20001");
			}
			return ResponseEntity.ok(param);
		}
			
	
	
}
