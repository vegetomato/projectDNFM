package com.jafa.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.jafa.common.FieldMatch;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldMatch(first = "confirmPassword", second = "password", message = "비밀번호가 일치 하지 않음")
public class Member {

	private Long id;
	
//	@Size(min=2,max=5, message = "이름은 한글 또는 영어 2~5글자여야 합니다.")
	@Pattern(regexp = "^[가-힣|a-z|A-Z]{2,5}$", message = "이름은 한글 또는 영어 2~5글자여야 합니다.")
	private String userName;
	
	@Email(message="이메일 형식이 아닙니다.")
	@NotEmpty(message="이메일을 입력하세요")
	private String email;
	
	@Pattern(regexp="^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$",
			message="비밀번호 숫자, 문자, 특수문자 포함 8~15자리 이내로 입력하시오")
	private String password;
	private String confirmPassword;
	
}
