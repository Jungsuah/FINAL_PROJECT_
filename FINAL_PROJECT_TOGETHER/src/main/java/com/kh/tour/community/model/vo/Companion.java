package com.kh.tour.community.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Companion {
	int companionNo;
	int userNo;
	String userName;
	Date departureDate;
	Date closeDate;
	String content;
	Date postDate;
	String area;
	String boardType;
	String status;
	List<CompanionComment> commentList;
}
