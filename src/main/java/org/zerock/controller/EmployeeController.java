package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.zerock.domain.Criteria;
import org.zerock.domain.dto.EmployeeDTO;
import org.zerock.domain.dto.PageDTO;
import org.zerock.service.interfaces.DepartmentService;
import org.zerock.service.interfaces.EmployeeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.zerock.service.interfaces.TitleService;

@Controller
@RequestMapping("/employees/*")
@RequiredArgsConstructor
@Log4j
public class EmployeeController {

	private final EmployeeService employeeService;
	private final DepartmentService departmentService;

	private final TitleService titleService;

	@PostMapping("/register")
	public String register(EmployeeDTO empDTO) {
		log.info(".........../register : " + empDTO);
		employeeService.register(empDTO);
		return "redirect:/employees/list";
	}
	
	// Get /register
	@GetMapping("/register")
	public void register() {
		log.info(".........../register");
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", employeeService.getList(cri));
		model.addAttribute("pageMaker", 
				new PageDTO(cri, employeeService.getTotal(cri)));
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("emp_no") Long emp_no, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info(emp_no);
		model.addAttribute("employee", employeeService.get(emp_no));
	}
	
	@PostMapping("/modify")
	public String modify(EmployeeDTO empDTO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
		log.info("modify.......................");
		employeeService.modify(empDTO);
		return "redirect:/employees/list"; 
		// + cri.getListLink();
	}

	@PostMapping("/retire")
	public String retire(Long emp_no, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
		log.info("Retire.......................");
		employeeService.retire(emp_no);
		return "redirect:/employees/list";
	}
}
