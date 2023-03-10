package com.kh.tour.tour.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tour.common.util.PageInfo;
import com.kh.tour.course.model.vo.DetailCourse;
import com.kh.tour.tour.model.mapper.TotalTourMapper;
import com.kh.tour.tour.model.vo.Category;
import com.kh.tour.tour.model.vo.DetailCultural;
import com.kh.tour.tour.model.vo.DetailEvent;
import com.kh.tour.tour.model.vo.DetailHotel;
import com.kh.tour.tour.model.vo.DetailRestaurant;
import com.kh.tour.tour.model.vo.DetailReview;
import com.kh.tour.tour.model.vo.DetailShopping;
import com.kh.tour.tour.model.vo.DetailSports;
import com.kh.tour.tour.model.vo.DetailTourist;
import com.kh.tour.tour.model.vo.EventHighLike;
import com.kh.tour.tour.model.vo.RepeatInfo;
import com.kh.tour.tour.model.vo.Tour;
import com.kh.tour.tour.model.vo.TourImage;
import com.kh.tour.tour.model.vo.TourLike;



@Service
public class TourServiceImpl implements TourService{
	
	@Autowired
	private TotalTourMapper mapper;


	@Override
	public List<Tour> getEventList(PageInfo pageInfo, Map<String, String> param, String[] neighbourhood){
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		String searchValue = param.get("searchValue");
		String searchMonth = param.get("searchMonth");

		if (searchValue != null && searchValue.length() > 0) {
			searchMap.put("eventKeyword", searchValue);
		}
		if (searchMonth != null && searchMonth.length() > 0) {
			searchMap.put("eventStartDate", searchMonth);
		}
		if(neighbourhood != null) {
			searchMap.put("neighbourhood", neighbourhood);
		}

		System.out.println(searchMap.toString());
		return mapper.selectEventList(rowBounds, searchMap);
	}
	
	@Override 
	public int getEventCount(Map<String, String> param, String[] neighbourhood) { //{searchType=??????, searchValue=?????????}
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		String searchValue = param.get("searchValue");
		String searchMonth = param.get("searchMonth");

		if (searchValue != null && searchValue.length() > 0) {
			searchMap.put("eventKeyword", searchValue);
		}
		if (searchMonth != null && searchMonth.length() > 0) {
			searchMap.put("eventStartDate", searchMonth);
		}
		if(neighbourhood != null) {
			searchMap.put("neighbourhood", neighbourhood);
		}

		System.out.println(searchMap.toString());
		 
		return mapper.selectEventListCount(searchMap);
	}

	@Override //contentId??? ?????? + ????????? + ????????? ??????
	public Tour findByContentId(int contentId) {
		Tour tour = mapper.selectByContentId(contentId);
		return tour;
	}

	
	@Override
	public int getTourCount(Map<String, String> param, String tourType, List<String> areaCode, String cat1, List<String> cat2) {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		String searchValue = param.get("searchValue"); // ?????????
		
		
		if (searchValue != null && searchValue.length() > 0) {
			searchMap.put("searchValue", searchValue); //????????? 1??? ??????
		}
		
		String bookingDate = param.get("bookingDate"); //????????? ?????? 2022-10-26 to 2022-11-07
		try {
			String strDate = bookingDate.substring(0,10); //2022-10-26??? ?????????
			String endDate = bookingDate.substring(14,24); //2022-11-07??? ?????????
			
			String[] strDateArray = strDate.split("-"); //[2022,10,26]??? ?????????
			String[] endDateArray = endDate.split("-"); //[2022,11,07]??? ?????????
		
			StringBuilder sb1 = new StringBuilder();
			for (int i = 0; i < strDateArray.length; i++) {
				sb1.append(strDateArray[i]);
			}
			
			StringBuilder sb2 = new StringBuilder();
			for (int i = 0; i < endDateArray.length; i++) {
				sb2.append(endDateArray[i]);
			}
			int eventStartDate = Integer.parseInt(sb1.toString()); //int?????? 20221026??? ??????
			int eventEndDate = Integer.parseInt(sb2.toString()); //int?????? 20221107??? ??????
			
			System.out.println(eventStartDate);
			System.out.println(eventEndDate);
			
			if (eventStartDate != 0 && eventStartDate > 0) {
				searchMap.put("eventStartDate", eventStartDate); // ????????? ?????? ???????????? (NUMBER)
			}
			if (eventEndDate != 0 && eventEndDate > 0) {
				searchMap.put("eventEndDate", eventEndDate); // ????????? ??? ???????????? (NUMBER)
			}
			
		} catch (Exception e) {
		}
		try {
			if (tourType != null) {
			int tourType1 = Integer.parseInt(param.get("tourType")); // ????????????
				searchMap.put("tourType", tourType1); // ???????????? 1??? ??????
			}
		} catch (Exception e) {
		}
		if(areaCode != null) {
			searchMap.put("areaCodeList", areaCode); // ???????????? ????????? ??????
		}
		if(cat1 != null) {
			searchMap.put("cat1", cat1); // ????????? 1??? ??????
		}
		if(cat2 != null) {
			searchMap.put("cat2List", cat2); // ????????? ????????? ??????
		}

		System.out.println(searchMap.toString());
		 
		return mapper.selectTourListCount(searchMap);
	}

	@Override
	public List<Tour> getTourList(PageInfo pageInfo, Map<String, String> param, String tourType, List<String> areaCode, String cat1, List<String> cat2) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBound1 = new RowBounds(offset, pageInfo.getListLimit());
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		String searchValue = param.get("searchValue"); // ?????????
		
		
		if (searchValue != null && searchValue.length() > 0) {
			searchMap.put("searchValue", searchValue); //????????? 1??? ??????
		}
		
		String bookingDate = param.get("bookingDate"); //????????? ?????? 2022-10-26 to 2022-11-07
		try {
			String strDate = bookingDate.substring(0,10); //2022-10-26??? ?????????
			String endDate = bookingDate.substring(14,24); //2022-11-07??? ?????????
			
			String[] strDateArray = strDate.split("-"); //[2022,10,26]??? ?????????
			String[] endDateArray = endDate.split("-"); //[2022,11,07]??? ?????????
		
			StringBuilder sb1 = new StringBuilder();
			for (int i = 0; i < strDateArray.length; i++) {
				sb1.append(strDateArray[i]);
			}
			
			StringBuilder sb2 = new StringBuilder();
			for (int i = 0; i < endDateArray.length; i++) {
				sb2.append(endDateArray[i]);
			}
			int eventStartDate = Integer.parseInt(sb1.toString()); //int?????? 20221026??? ??????
			int eventEndDate = Integer.parseInt(sb2.toString()); //int?????? 20221107??? ??????
			
			System.out.println(eventStartDate);
			System.out.println(eventEndDate);
			
			if (eventStartDate != 0 && eventStartDate > 0) {
				searchMap.put("eventStartDate", eventStartDate); // ????????? ?????? ???????????? (NUMBER)
			}
			if (eventEndDate != 0 && eventEndDate > 0) {
				searchMap.put("eventEndDate", eventEndDate); // ????????? ??? ???????????? (NUMBER)
			}
			
		} catch (Exception e) {
		}
		try {
			if (tourType != null) {
			int tourType1 = Integer.parseInt(param.get("tourType")); // ????????????
				searchMap.put("tourType", tourType1); // ???????????? 1??? ??????
			}
		} catch (Exception e) {
		}
		if(areaCode != null) {
			searchMap.put("areaCodeList", areaCode); // ???????????? ????????? ??????
		}
		if(cat1 != null) {
			searchMap.put("cat1", cat1); // ????????? 1??? ??????
		}
		if(cat2 != null) {
			searchMap.put("cat2List", cat2); // ????????? ????????? ??????
		}

		System.out.println(searchMap.toString());
		 
		return mapper.selectTourList(rowBound1,searchMap);
	}


	@Override // ????????? ?????????
	@Transactional(rollbackFor = Exception.class)
	public int insertTourLike(int userNo, int contentId) {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		if (userNo != 0 && userNo > 0) {
			searchMap.put("userNo", userNo);
		}
		if (contentId != 0 && contentId > 0) {
			searchMap.put("contentId", contentId);
		}
		return mapper.tourLikeInsert(searchMap);
	}

	
	@Override
	public List<TourLike> selectTourLikeList(int userNo) {
		List<TourLike> tourLike = mapper.selectTourLikeList(userNo);
		return tourLike;
	}

	@Override
	public List<Category> getCat2List(String cat1) {
		List<Category> selectCat2List = mapper.selectCat1List(cat1);
		return selectCat2List;
	}
	
	
	@Override //contentId??? (?????????,????????????,????????????,?????????,??????,?????????) ?????? + ?????? ?????? 
    public List<RepeatInfo> findDetailByContentId(int contentId) {
        return mapper.selectDetailByContentId(contentId);
    }

	@Override
	public DetailTourist getDetailTourist(int contentId) {
		return mapper.detailTourist(contentId);
	}

	@Override
	public DetailCourse getDetailCourse(int contentId) {
		return mapper.detailCourse(contentId);
	}

	@Override
	public DetailHotel getDetailHotel(int contentId) {
		return mapper.detailHotel(contentId);
	}

	@Override
	public DetailCultural getDetailCultural(int contentId) {
		return mapper.detailCultural(contentId);
	}

	@Override
	public DetailEvent getDetailEvent(int contentId) {
		return mapper.detailEvent(contentId);
	}

	@Override
	public DetailSports getDetailSports(int contentId) {
		return mapper.detailSports(contentId);
	}

	@Override
	public DetailShopping getDetailShopping(int contentId) {
		return mapper.detailShopping(contentId);
	}

	@Override
	public DetailRestaurant getDetailRestaurant(int contentId) {
		return mapper.detailRestaurant(contentId);
	}

	@Override
	public List<TourImage> getTourImage(int contentId) {
		return mapper.tourImage(contentId);
	}

	@Override
	public List<DetailReview> getReviewList(int contentId) {
		return mapper.getReviewList(contentId);
	}
	
	@Override
	public int insertReview(DetailReview detailReview) {
		return mapper.insertReview(detailReview);
	}

	@Override
	public List<EventHighLike> getEventHighLike() {
		return mapper.getEventHighLike();
	}
}

	
	
	
