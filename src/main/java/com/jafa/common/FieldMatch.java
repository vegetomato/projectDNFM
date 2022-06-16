package com.jafa.common;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.jafa.validation.FieldMatchValidator;

@Documented
@Constraint(validatedBy = {FieldMatchValidator.class})
@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface FieldMatch {
	
	String message() default "이 필드는 서로 부합되어야 함";
	Class<?>[] groups() default{};
	Class<? extends Payload>[] payload() default{};	
	String first(); //첫 번째 필드
	String second(); // 두 번째 필드
	
	@Documented
	@Target({ElementType.TYPE, ElementType.ANNOTATION_TYPE})
	@Retention(RetentionPolicy.RUNTIME)
	@interface List{
		FieldMatch[] value();
	}
}
