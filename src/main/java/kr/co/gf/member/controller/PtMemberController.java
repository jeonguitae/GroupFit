package kr.co.gf.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.gf.calender.dto.CalenderDTO;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.member.dto.MemberDTO;
import kr.co.gf.member.dto.PtMemberDTO;
import kr.co.gf.member.service.PtMemberService;

@Controller
public class PtMemberController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	PtMemberService service;

	// 리스트
	/*
	 * @RequestMapping(value = "/dailyptt") public String dailyptMain(Model model) {
	 * 
	 * logger.info("list call"); ArrayList<PtMemberDTO> dailyptlist =
	 * service.dailyptlist(); //logger.info("dailyptlist : "+dailyptlist); for
	 * (PtMemberDTO dto : dailyptlist) { System.out.println(dto.getMem_no()); //
	 * mem_no 값 출력 System.out.println(dto.getDailypt_no());
	 * System.out.println(dto.getMember_name()); // 나머지 필드에 대해서도 필요한 작업 수행 }
	 * 
	 * logger.info("list cnt : "+dailyptlist.size());
	 * model.addAttribute("dailyptlist", dailyptlist);
	 * 
	 * return "dailyptMain"; }
	 */

	@RequestMapping(value = "/dailyptt")
	public String dailyptMain(Model model) {

		return "dailyptMain";
	}

	@GetMapping(value = "/ptlist.ajax")
	@ResponseBody
	public HashMap<String, Object> memlist(HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");

		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("map : " + map);

		ArrayList<MemberDTO> list = service.ptlist(loginId);
		logger.info("list : " + list);

		map.put("ptlist", list);

		return map;
	}

	// 작성폼
	@RequestMapping(value = "/dailypt.go")
	public String dailypt(Model model, HttpSession session) {

		String loginId = (String) session.getAttribute("loginId");

		ArrayList<PtMemberDTO> dailypt = service.dailyptwritego(loginId);
		logger.info("dailypt : " + dailypt);

		model.addAttribute("dailypt", dailypt);

		return "dailyptForm";
	}

	@RequestMapping(value = "/dailyptWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitdailypt(@RequestParam HashMap<String, String> params,
			@RequestParam(value = "pt_name[]") ArrayList<String> pt_name,
			@RequestParam(value = "pt_kg[]") ArrayList<String> pt_kg,
			@RequestParam(value = "pt_set[]") ArrayList<String> pt_set, 
			HttpSession session,
			Model model) {

		// 로그인 한 트레이너 직번이 emp_no 에 들어가도록 세션
		EmpDTO empDTO = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = empDTO.getEmp_no();
		logger.info("map : " + params);
		logger.info("pt_kg[] : " + pt_kg);


		return service.submitdailypt(params, pt_name, pt_kg, pt_set, emp_no);
	}

	/*
	 * // 여기요 여기 수정시 결석버튼이요
	 * 
	 * @RequestMapping(value="/updatesubmitcut") public String
	 * updatesubmitcut(@RequestParam HashMap<String, String> params
	 * ,HttpServletRequest request ,HttpSession session) {
	 * 
	 * // 로그인 한 트레이너 직번이 emp_no 에 들어가도록 세션 EmpDTO empDTO = (EmpDTO)
	 * session.getAttribute("loginEmp"); String emp_no = empDTO.getEmp_no();
	 * 
	 * // pt_name 파라미터 처리 String[] ptNameArray =
	 * request.getParameterValues("pt_name[]"); ArrayList<String> pt_name = new
	 * ArrayList<>(Arrays.asList(ptNameArray));
	 * 
	 * // pt_kg 파라미터 처리 String[] ptKgArray = request.getParameterValues("pt_kg[]");
	 * ArrayList<String> pt_kg = new ArrayList<>(Arrays.asList(ptKgArray));
	 * 
	 * // pt_set 파라미터 처리 String[] ptSetArray =
	 * request.getParameterValues("pt_set[]"); ArrayList<String> pt_set = new
	 * ArrayList<>(Arrays.asList(ptSetArray));
	 * 
	 * 
	 * 
	 * String[] weightNoValueArray =
	 * request.getParameterValues("weight_no_value[]"); ArrayList<Integer>
	 * weightNoValueList = new ArrayList<>(); for (String weightNoValue :
	 * weightNoValueArray) { weightNoValueList.add(Integer.parseInt(weightNoValue));
	 * }
	 * 
	 * 
	 * return service.updatesubmitcut(params,pt_name,pt_kg,pt_set,emp_no); }
	 */

	@RequestMapping(value = "/submitcut", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitcut(@RequestParam HashMap<String, String> params, HttpSession session) {

		logger.info("submitcut params : " + params);

		EmpDTO empDTO = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = empDTO.getEmp_no();

		return service.submitcut(params, emp_no);
	}

	@RequestMapping(value = "/dailyPtDetail.do")
	public String dailyPtDetailgo(@RequestParam String dailypt_no, Model model) {
		String page = "redirect:/dailyptt";

		PtMemberDTO dto = service.dailyPtDetail(dailypt_no);

		model.addAttribute("dto", dto);

		ArrayList<PtMemberDTO> list = new ArrayList<PtMemberDTO>();
		list = service.weightList(dailypt_no);
		model.addAttribute("weightList", list);

		if (dto != null) {

			page = "dailyPtDetail";
		}

		return page;
	}

	@RequestMapping(value = "/dailyptUpdate.go")
	public String dailyPtDetail(@RequestParam String dailypt_no, Model model) {

		logger.info("dailypt_no : " + dailypt_no);

		PtMemberDTO dto = service.dailyPtDetail(dailypt_no);

		model.addAttribute("dto", dto);

		ArrayList<PtMemberDTO> list = new ArrayList<PtMemberDTO>();
		list = service.weightList(dailypt_no);
		model.addAttribute("weightList", list);

		return "dailyPtUpdate";
	}

	@RequestMapping(value = "/dailyptUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dailyptUpdate(@RequestParam HashMap<String, String> params, HttpSession session, Model model,
			HttpServletRequest request) {

		// 로그인 한 트레이너 직번이 emp_no 에 들어가도록 세션
		EmpDTO empDTO = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = empDTO.getEmp_no();

		// pt_name 파라미터 처리
		String[] ptNameArray = request.getParameterValues("pt_name[]");
		ArrayList<String> pt_name = new ArrayList<>(Arrays.asList(ptNameArray));

		// pt_kg 파라미터 처리
		String[] ptKgArray = request.getParameterValues("pt_kg[]");
		ArrayList<String> pt_kg = new ArrayList<>(Arrays.asList(ptKgArray));

		// pt_set 파라미터 처리
		String[] ptSetArray = request.getParameterValues("pt_set[]");
		ArrayList<String> pt_set = new ArrayList<>(Arrays.asList(ptSetArray));

		String[] weightNoValueArray = request.getParameterValues("weight_no_value[]");
		ArrayList<Integer> weightNoValueList = new ArrayList<>();
		for (String weightNoValue : weightNoValueArray) {
			weightNoValueList.add(Integer.parseInt(weightNoValue));
		}

		logger.info("update map : " + params);
		logger.info("pt_kg[] : " + pt_kg);
		logger.info("pt_name : " + pt_name);
		logger.info("pt_Set" + pt_set);
		logger.info("weight_no : " + weightNoValueList);

		return service.dailyptUpdate(params, pt_name, pt_kg, pt_set, emp_no, weightNoValueList);
	}

	@RequestMapping(value = "/dailyptdelete.do")
	public String delete(@RequestParam String dailypt_no, @RequestParam String mem_no) {
		// service.dailyptdelete(dailypt_no,mem_no);
		logger.info("delete dailypt_no : " + dailypt_no);
		return service.dailyptdelete(dailypt_no, mem_no);
	}

	// return "redirect:/dailyptt";

	@RequestMapping(value = "ptdailydel.ajax")
	@ResponseBody
	public HashMap<String, Object> ptdailydelete(@RequestParam(value = "dailypt[]") ArrayList<String> ptdailydel) {

		logger.info("memdelList : " + ptdailydel);

		return service.ptdailydelete(ptdailydel);

	}

	@RequestMapping(value = "/ptmemberSearch.ajax")
	@ResponseBody
	public HashMap<String, Object> ptmemberSearch(String ptmember, String searchInput, HttpSession session) {

		/* String loginId = (String) session.getAttribute("loginId"); */

		logger.info("ptmember : " + ptmember);
		logger.info("searchInput : " + searchInput);

		return service.ptmemberSearch(ptmember, searchInput);
	}
	
	
	
	
	
	
	

}
