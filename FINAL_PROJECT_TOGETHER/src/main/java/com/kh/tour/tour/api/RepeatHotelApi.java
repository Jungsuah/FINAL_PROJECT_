package com.kh.tour.tour.api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.kh.tour.tour.model.vo.RepeatCourse;
import com.kh.tour.tour.model.vo.RepeatHotel;
import com.kh.tour.tour.model.vo.RepeatHotelParsing;
import com.kh.tour.tour.model.vo.RepeatInfo;

public class RepeatHotelApi {

	public static String TOUR_URL = "http://apis.data.go.kr/B551011/KorService/areaBasedList";
	public static String TOUR_REPEAT_INFO_URL = "http://apis.data.go.kr/B551011/KorService/detailInfo";
	public static String TOUR_URL_EXTRASTRING = "MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=C";
	public static String TOUR_REPEAT_INFO_EXTRASTRING1 = "MobileOS=ETC&MobileApp=AppTest";

	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	public static void main(String[] args) {
		RepeatHotelApi.callCurrentRepeatHotelByXML();
	}

	public static List<RepeatHotelParsing> callCurrentRepeatHotelByXML() {
		List<RepeatHotelParsing> list = new ArrayList<>();
		String serviceKey = null;
		// 1일차
//		for (int j = 1; j < 20; j++) {
//			if (j == 1) {
//				serviceKey = "MRGjsmhNXRX1D0nJfQ3jmGDOu1MpyezpskGaSewmi1%2Byy9aUHrq9gZ3i8q7%2FlGMxlu7nLmuvsb7MZpcM5puxhA%3D%3D";
//			}
//			if (j == 2) {
//				serviceKey = "lzhpNoakCHo5aenwJe7kub6egAg%2FlsfQ9QbSTSGrD%2F3JDieSA91XYej7TpMMWphOX%2BnHR7ZUVXj8lS6wP4ROig%3D%3D";
//			}
//			if (j == 3) {
//				serviceKey = "78wiFvQ0WDD8o%2Fd5%2BKLiuUSCz5WcokIXr0Q9dfcmyH6vs3bTdrxp8YSrjEQ1%2F4BgyxY%2Fj%2F%2BQCsGdNKIZ5jK6Ew%3D%3D";
//			}
//			if (j == 4) {
//				serviceKey = "xPgb4J1x4WD9jzYMbsGMZdsaMur9N1BVzLMvLNBpmtGVFfwPOwwVbvHPwUr68EaZLeWZZH13KWGj7YDyCSpgvA%3D%3D";
//			}
//			if (j == 5) {
//				serviceKey = "ruNaLgQMM1zN4TsgXK1aoN5hs6xaAd71GHt%2FkRKRYGACGGZKmrzi%2Bdn7O7e46o%2Fk9rYRLY%2FGMcEGhXSQy%2Fs2Lg%3D%3D";
//			}
//			if (j == 6) {
//				serviceKey = "pfrapdaIE4JSQTQlbaf%2FgQ5PHzhztyuhwsMSut4RNds4eIJE5iXE6%2F0WwwqeizAeieFOgSqPaRZN1PXF0bjYwA%3D%3D";
//			}
//			if (j == 7) {
//				serviceKey = "eiK%2BV76caR9ISOf1qIsgjV9ioCUXgzzvro%2BQqC4u1m20LIRJ%2B8mMAKILZoI0HEUhVFXOPEfpG4dLpuFTQijzsQ%3D%3D";
//			}
//			if (j == 8) {
//				serviceKey = "kbPxcL0m9hZ1CR8kULawo9YO3QnDjjfWMwysPXznkKllm8h7BgmYIv3n8tUDW6SP31J9qo1ESUUwvJdji4i3Tw%3D%3D";
//			}
//			if (j == 9) {
//				serviceKey = "DrszgCozJHG41Y9S22XMOKIU5X7mDWkETO%2BR6oUhQNnzdB1Euu7UNEV3XgDLxZoKKgoMS%2FTfkaT%2BgQ8UrteOAA%3D%3D";
//			}
//			if (j == 10) {
//				serviceKey = "fD0DCX7wMXP7oajt2G6gM9Gp9x3cxPbHZURBn3%2FG68CU%2Bta1e9Kx7vvu2vAg6Cj9%2BtuyfBqqPfJDbTw9IsfC%2Bw%3D%3D";
//			}
//			if(j == 11) {
//				serviceKey = "0L5Iqaft7cvvAFwyEcDDJLm%2FdpmPNBvCDwpM7tL3LZHsL2prES1i20X6QCvzIhZpF7he8BEFj%2FhFQhIplu2YfA%3D%3D";
//			}
//			if (j == 12) {
//				serviceKey = "vscKodtEDv6zV%2FYV6WMc1nrSXtGQlAo64qC%2FjIyEwSEaesH1cm9RfOx9%2ByYJn4N%2F830RmnCQLnMWJgm3U01WKg%3D%3D";
//			}
//			if (j == 13) {
//				serviceKey = "kxftassM%2BrRYbp7OhrzSCnL1udjm5%2B8ueXGAROz4WJsdE7UtAtmQaXTJ6n4XtU%2FILnqsuyLF0CTbZI1YqbbUuw%3D%3D";
//			}
//			if (j == 14) {
//				serviceKey = "neMSgCHKHQZ63FY1Tv%2B1SIiNnVJ2vfsVlHg%2FT%2FANBbP90yC7PgA%2BNsTB3CPB%2B8m6zsNNk1lICzdY7xCz1ZWDvQ%3D%3D";
//			}
//			if (j == 15) {
//				serviceKey = "qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D";
//			}
//			if (j == 16) {
//				serviceKey = "HDiMPHPdpb5BenyoGC9qF2vfNrVy3IWy9%2BHdxsTS7PxFuur3t3bVQ2UFFWOee9iAfwFCV3ioVJyrv4tYklC%2BIQ%3D%3D";
//			}
//			if (j == 17) {
//				serviceKey = "Bc1LLgHM%2Fgc%2FUrkBzSZURJM4qgoSFZ%2BA8whQuKAsyCCkNITBjNzxvWMB8ahECCyTKM%2BpHcVmZANaAH2wu9jS2w%3D%3D";
//			}
//			if (j == 18) {
//				serviceKey = "%2BERelxkpcuje7NJLgLdEDeimdjhWgfOhmG3W7Fz9tWihQjyffyBvz1pbHDk2Wi5hUkv9DDYDlrxwGEm887GYLw%3D%3D";
//			}
//			if (j == 19) {
//				serviceKey = "Xr4jMIQ0BD9HYlCiU4po7YUjFjL0yPduDsYgHVD%2FiJiboGPF2RrfoiVkc0xx7Leg7GOicWAW77JI%2BMdv7qFuRA%3D%3D";
//			}
		// 2일차
		for (int j = 20; j < 39; j++) {
			if (j == 20) {
				serviceKey = "MRGjsmhNXRX1D0nJfQ3jmGDOu1MpyezpskGaSewmi1%2Byy9aUHrq9gZ3i8q7%2FlGMxlu7nLmuvsb7MZpcM5puxhA%3D%3D";
			}
			if (j == 21) {
				serviceKey = "lzhpNoakCHo5aenwJe7kub6egAg%2FlsfQ9QbSTSGrD%2F3JDieSA91XYej7TpMMWphOX%2BnHR7ZUVXj8lS6wP4ROig%3D%3D";
			}
			if (j == 22) {
				serviceKey = "78wiFvQ0WDD8o%2Fd5%2BKLiuUSCz5WcokIXr0Q9dfcmyH6vs3bTdrxp8YSrjEQ1%2F4BgyxY%2Fj%2F%2BQCsGdNKIZ5jK6Ew%3D%3D";
			}
			if (j == 23) {
				serviceKey = "xPgb4J1x4WD9jzYMbsGMZdsaMur9N1BVzLMvLNBpmtGVFfwPOwwVbvHPwUr68EaZLeWZZH13KWGj7YDyCSpgvA%3D%3D";
			}
			if (j == 24) {
				serviceKey = "ruNaLgQMM1zN4TsgXK1aoN5hs6xaAd71GHt%2FkRKRYGACGGZKmrzi%2Bdn7O7e46o%2Fk9rYRLY%2FGMcEGhXSQy%2Fs2Lg%3D%3D";
			}
			if (j == 25) {
				serviceKey = "pfrapdaIE4JSQTQlbaf%2FgQ5PHzhztyuhwsMSut4RNds4eIJE5iXE6%2F0WwwqeizAeieFOgSqPaRZN1PXF0bjYwA%3D%3D";
			}
			if (j == 26) {
				serviceKey = "eiK%2BV76caR9ISOf1qIsgjV9ioCUXgzzvro%2BQqC4u1m20LIRJ%2B8mMAKILZoI0HEUhVFXOPEfpG4dLpuFTQijzsQ%3D%3D";
			}
			if (j == 27) {
				serviceKey = "kbPxcL0m9hZ1CR8kULawo9YO3QnDjjfWMwysPXznkKllm8h7BgmYIv3n8tUDW6SP31J9qo1ESUUwvJdji4i3Tw%3D%3D";
			}
			if (j == 28) {
				serviceKey = "DrszgCozJHG41Y9S22XMOKIU5X7mDWkETO%2BR6oUhQNnzdB1Euu7UNEV3XgDLxZoKKgoMS%2FTfkaT%2BgQ8UrteOAA%3D%3D";
			}
			if (j == 29) {
				serviceKey = "fD0DCX7wMXP7oajt2G6gM9Gp9x3cxPbHZURBn3%2FG68CU%2Bta1e9Kx7vvu2vAg6Cj9%2BtuyfBqqPfJDbTw9IsfC%2Bw%3D%3D";
			}
			if (j == 30) {
				serviceKey = "0L5Iqaft7cvvAFwyEcDDJLm%2FdpmPNBvCDwpM7tL3LZHsL2prES1i20X6QCvzIhZpF7he8BEFj%2FhFQhIplu2YfA%3D%3D";
			}
			if (j == 31) {
				serviceKey = "vscKodtEDv6zV%2FYV6WMc1nrSXtGQlAo64qC%2FjIyEwSEaesH1cm9RfOx9%2ByYJn4N%2F830RmnCQLnMWJgm3U01WKg%3D%3D";
			}
			if (j == 32) {
				serviceKey = "kxftassM%2BrRYbp7OhrzSCnL1udjm5%2B8ueXGAROz4WJsdE7UtAtmQaXTJ6n4XtU%2FILnqsuyLF0CTbZI1YqbbUuw%3D%3D";
			}
			if (j == 33) {
				serviceKey = "neMSgCHKHQZ63FY1Tv%2B1SIiNnVJ2vfsVlHg%2FT%2FANBbP90yC7PgA%2BNsTB3CPB%2B8m6zsNNk1lICzdY7xCz1ZWDvQ%3D%3D";
			}
			if (j == 34) {
				serviceKey = "qox%2BipaXoWnf%2FV01eNjOkt81Eh8nOc%2Fr82zCfdYqtbzqdsVuZr2o1iAq7VI8I0J8L71uxntJKSdmuP91QTQpEQ%3D%3D";
			}
			if (j == 35) {
				serviceKey = "HDiMPHPdpb5BenyoGC9qF2vfNrVy3IWy9%2BHdxsTS7PxFuur3t3bVQ2UFFWOee9iAfwFCV3ioVJyrv4tYklC%2BIQ%3D%3D";
			}
			if (j == 36) {
				serviceKey = "Bc1LLgHM%2Fgc%2FUrkBzSZURJM4qgoSFZ%2BA8whQuKAsyCCkNITBjNzxvWMB8ahECCyTKM%2BpHcVmZANaAH2wu9jS2w%3D%3D";
			}
			if (j == 37) {
				serviceKey = "%2BERelxkpcuje7NJLgLdEDeimdjhWgfOhmG3W7Fz9tWihQjyffyBvz1pbHDk2Wi5hUkv9DDYDlrxwGEm887GYLw%3D%3D";
			}
			if (j == 38) {
				serviceKey = "Xr4jMIQ0BD9HYlCiU4po7YUjFjL0yPduDsYgHVD%2FiJiboGPF2RrfoiVkc0xx7Leg7GOicWAW77JI%2BMdv7qFuRA%3D%3D";
			}

			try {
				StringBuilder urlBuilder = new StringBuilder();
				urlBuilder.append(TOUR_URL);
				urlBuilder.append("?" + "serviceKey=" + serviceKey); // 첫 번째만 물음표로 설정
				urlBuilder.append("&" + "numOfRows=" + 1000);
				urlBuilder.append("&" + "pageNo=" + j);
				urlBuilder.append("&" + TOUR_URL_EXTRASTRING);

				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestProperty("Accept", "application/xml");

				int code = conn.getResponseCode(); // 실제 호출하는 부
				if (code < 200 || code >= 300) {
					System.out.println("페이지가 잘못되었습니다.");
					return null;
				}

				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(conn.getInputStream()); //
				doc.normalizeDocument();

				NodeList nList = doc.getElementsByTagName("item");
				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);

					if (node.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) node;

						int contentId = getIntData(eElement, "contentid"); //
						int contentTypeId = getIntData(eElement, "contenttypeid"); //

						// -------------------------------------------------info 시작
//						System.out.println(contentTypeId);

						if (contentTypeId == 32) {
							URL url2 = new URL(
									RepeatHotelApi.repeatHotelUrl(serviceKey, contentId, contentTypeId).toString());

							System.out.println("url : " + url2);

							HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
							conn2.setRequestProperty("Accept", "application/xml");

							int code2 = conn2.getResponseCode(); // 실제 호출하는 부
							System.out.println("ResponseCode2 : " + code2);
							if (code2 < 200 || code2 >= 300) {
								System.out.println("페이지가 잘못되었습니다.");
								return null;
							}

							DocumentBuilderFactory dbf2 = DocumentBuilderFactory.newInstance();
							DocumentBuilder db2 = dbf2.newDocumentBuilder();
							Document doc2 = db2.parse(conn2.getInputStream()); //
							doc2.normalizeDocument();

							NodeList items = doc2.getElementsByTagName("item");
							for (int t = 0; t < items.getLength(); t++) {

								Element item = (Element) items.item(t);

								NodeList roomCodeList = item.getElementsByTagName("roomcode");
								NodeList roomTitleList = item.getElementsByTagName("roomtitle");
								NodeList roomSize1List = item.getElementsByTagName("roomsize1");
								NodeList roomCountList = item.getElementsByTagName("roomcount");
								NodeList roomBaseCountList = item.getElementsByTagName("roombasecount");
								NodeList roomMaxCountList = item.getElementsByTagName("roommaxcount");
								NodeList roompeakseasonminfee1List = item.getElementsByTagName("roompeakseasonminfee1");
								NodeList roompeakseasonminfee2List = item.getElementsByTagName("roompeakseasonminfee2");
								NodeList roomPeakSeasonMinFee1List = item.getElementsByTagName("roomPeakSeasonMinFee1");
								NodeList roomPeakSeasonMinFee2List = item.getElementsByTagName("roomPeakSeasonMinFee2");
								NodeList roomintroList = item.getElementsByTagName("roomintro");
								NodeList roombathfacilityList = item.getElementsByTagName("roombathfacility");
								NodeList roombathList = item.getElementsByTagName("roombath");
								NodeList roomhometheaterList = item.getElementsByTagName("roomhometheater");
								NodeList roomairconditionList = item.getElementsByTagName("roomaircondition");
								NodeList roomtvList = item.getElementsByTagName("roomtv");
								NodeList roompcList = item.getElementsByTagName("roompc");
								NodeList roomcableList = item.getElementsByTagName("roomcable");
								NodeList roominternetList = item.getElementsByTagName("roominternet");
								NodeList roomrefrigeratorList = item.getElementsByTagName("roomrefrigerator");
								NodeList roomtoiletriesList = item.getElementsByTagName("roomtoiletries");
								NodeList roomsofaList = item.getElementsByTagName("roomsofa");
								NodeList roomcookList = item.getElementsByTagName("roomcook");
								NodeList roomtableList = item.getElementsByTagName("roomtable");
								NodeList roomhairdryerList = item.getElementsByTagName("roomhairdryer");
								NodeList roomsize2List = item.getElementsByTagName("roomsize2");
								NodeList roomimg1List = item.getElementsByTagName("roomimg1");
								NodeList roomimg1altList = item.getElementsByTagName("roomimg1alt");
								NodeList roomimg2List = item.getElementsByTagName("roomimg2");
								NodeList roomimg2altList = item.getElementsByTagName("roomimg2alt");
								NodeList roomimg3List = item.getElementsByTagName("roomimg3");
								NodeList roomimg3altList = item.getElementsByTagName("roomimg3alt");
								NodeList roomimg4List = item.getElementsByTagName("roomimg4");
								NodeList roomimg4altList = item.getElementsByTagName("roomimg4alt");
								NodeList roomimg5List = item.getElementsByTagName("roomimg5");
								NodeList roomimg5altList = item.getElementsByTagName("roomimg5alt");

//							System.out.println("\nCurrent Element2 : " + node.getNodeName());
								for (int k = 0; k < roomCodeList.getLength(); k++) {
									int roomCode = Integer.parseInt(((Element) roomCodeList.item(k)).getTextContent());
									String roomTitle =  ((Element) roomTitleList.item(k)).getTextContent();
									int roomSize1 = Integer
											.parseInt(((Element) roomSize1List.item(k)).getTextContent());
									int roomCount = Integer
											.parseInt(((Element) roomCountList.item(k)).getTextContent());
									int roomBaseCount = Integer
											.parseInt(((Element) roomBaseCountList.item(k)).getTextContent());
									int roomMaxCount = Integer
											.parseInt(((Element) roomMaxCountList.item(k)).getTextContent());
									int roomOffSeasonMinFee1 = Integer
											.parseInt(((Element) roompeakseasonminfee1List.item(k)).getTextContent());
									int roomOffSeasonMinFee2 = Integer
											.parseInt(((Element) roompeakseasonminfee2List.item(k)).getTextContent());
									int roomPeakSeasonMinFee1 = Integer
											.parseInt(((Element) roomPeakSeasonMinFee1List.item(k)).getTextContent());
									int roomPeakSeasonMinFee2 = Integer
											.parseInt(((Element) roomPeakSeasonMinFee2List.item(k)).getTextContent());
									String roomIntro = (((Element) roomintroList.item(k)).getTextContent());
									String roomBathFacility = (((Element) roombathfacilityList.item(k)).getTextContent());
									String roomBath = (((Element) roombathList.item(k)).getTextContent());
									String roomHomeTheater = ((Element) roomhometheaterList.item(k)).getTextContent();
									String roomAircondition = ((Element) roomairconditionList.item(k)).getTextContent();
									String roomTv = ((Element) roomtvList.item(k)).getTextContent();
									String roomPc = ((Element) roompcList.item(k)).getTextContent();
									String roomCable = ((Element) roomcableList.item(k)).getTextContent();
									String roomInternet = ((Element) roominternetList.item(k)).getTextContent();
									String roomRefrigerator = ((Element) roomrefrigeratorList.item(k)).getTextContent();
									String roomToiletries = ((Element) roomtoiletriesList.item(k)).getTextContent();
									String roomSofa = ((Element) roomsofaList.item(k)).getTextContent();
									String roomCook = ((Element) roomcookList.item(k)).getTextContent();
									String roomTable = ((Element) roomtableList.item(k)).getTextContent();
									String roomHairdryer = ((Element) roomhairdryerList.item(k)).getTextContent();
									int roomSize2 = Integer
											.parseInt(((Element) roomsize2List.item(k)).getTextContent());
									String roomImg1 = ((Element) roomimg1List.item(k)).getTextContent();
									String roomImg1alt = ((Element) roomimg1altList.item(k)).getTextContent();
									String roomImg2 = ((Element) roomimg2List.item(k)).getTextContent();
									String roomImg2alt = ((Element) roomimg2altList.item(k)).getTextContent();
									String roomImg3 = ((Element) roomimg3List.item(k)).getTextContent();
									String roomImg3alt = ((Element) roomimg3altList.item(k)).getTextContent();
									String roomImg4 = ((Element) roomimg4List.item(k)).getTextContent();
									String roomImg4alt = ((Element) roomimg4altList.item(k)).getTextContent();
									String roomImg5 = ((Element) roomimg5List.item(k)).getTextContent();
									String roomImg5alt = ((Element) roomimg5altList.item(k)).getTextContent();

									RepeatHotelParsing repeatCourse = new RepeatHotelParsing(0, contentId, contentTypeId, roomCode,
											roomTitle, roomSize1, roomCount, roomBaseCount, roomMaxCount,
											roomOffSeasonMinFee1, roomOffSeasonMinFee2, roomPeakSeasonMinFee1,
											roomPeakSeasonMinFee2, roomIntro, roomBathFacility, roomBath,
											roomHomeTheater, roomAircondition, roomTv, roomPc, roomCable, roomInternet,
											roomRefrigerator, roomToiletries, roomSofa, roomCook, roomTable,
											roomHairdryer, roomSize2, roomImg1, roomImg1alt, roomImg2, roomImg2alt,
											roomImg3, roomImg3alt, roomImg4, roomImg4alt, roomImg5, roomImg5alt);
									list.add(repeatCourse);
									System.out.println(list.toString());
								}

							}
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	private static String getStrData(Element eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}

	private static int getIntData(Element eElement, String tagName) {
		try {
			return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	private static long getLongData(Element eElement, String tagName) {
		try {
			return Long.parseLong(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	// 정보페이지 url만들어서 넘김
	public static StringBuffer repeatHotelUrl(String serviceKey, int contentId, int contentTypeId) {
		StringBuffer repeatHotelUrl = new StringBuffer();
		repeatHotelUrl.append(TOUR_REPEAT_INFO_URL);
		repeatHotelUrl.append("?" + "serviceKey=" + serviceKey);
		repeatHotelUrl.append("&" + TOUR_REPEAT_INFO_EXTRASTRING1);
		repeatHotelUrl.append("&" + "contentId=" + contentId);
		repeatHotelUrl.append("&" + "contentTypeId=" + contentTypeId);

//			System.out.println(sportsUrl);

		return repeatHotelUrl;

	}

}