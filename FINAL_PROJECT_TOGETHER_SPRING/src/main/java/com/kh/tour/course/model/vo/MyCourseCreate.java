package com.kh.tour.course.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyCourseCreate {

	
	private int myCourseNo;
	private int userNo;
	private String myCourseTitle;
	private String myCourseThema;
	private String myCourseSchedule;
	private String myCourseContent;
	private String myCourseMainImage;
	private String myCourseStatus;
}
