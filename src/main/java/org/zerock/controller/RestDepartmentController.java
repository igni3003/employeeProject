package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.vo.depart.DepartmentVO;
import org.zerock.domain.vo.depart.DeptEmpVO;
import org.zerock.domain.vo.depart.DeptTitleVO;
import org.zerock.domain.vo.title.TitleVO;
import org.zerock.service.interfaces.DepartmentService;
import org.zerock.service.interfaces.TitleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rest/department")
@RequiredArgsConstructor
@Log4j
public class RestDepartmentController {

	private final DepartmentService departmentService;
	private final TitleService titleService;
	
	@GetMapping(value = "", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<DepartmentVO>> getList() {
		return new ResponseEntity<>(departmentService.getDepartments(), HttpStatus.OK);
	}

	@GetMapping(value = "/titles/{dept_no}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<DeptTitleVO>> getDeptTitleList(@PathVariable("dept_no") String dept_no) {
		log.info("dept_no : " + dept_no);
		return new ResponseEntity<>(departmentService.getDeptTitles(dept_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/employee/{emp_no}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<DeptEmpVO>> getDeptEmpList(@PathVariable("emp_no") Long emp_no){
		log.info("emp_no : " + emp_no);
		return new ResponseEntity<>(departmentService.getDeptEmployee(emp_no), HttpStatus.OK);
	}

	@GetMapping(value = "/employee/titles/{emp_no}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<TitleVO>> getTitles(@PathVariable("emp_no") Long emp_no){
		log.info("emp_no : " + emp_no);
		return new ResponseEntity<>(titleService.getTitles(emp_no), HttpStatus.OK);
	}
	
}
