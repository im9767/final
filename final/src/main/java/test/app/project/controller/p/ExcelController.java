package test.app.project.controller.p;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.L.PaymentService;
@Controller
public class ExcelController {
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value = "/admin/excelDown.do")
	public void excelDown(@RequestParam(value="year",defaultValue="2019")int year,HttpServletResponse response) throws Exception {

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int years = year+1;
		map.put("year", year);
		map.put("years", years);

	    // 게시판 목록조회

	    List<HashMap<String, Object>> list = paymentService.statics(map);



	    // 워크북 생성

	    Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("게시판");

	    Row row = null;

	    Cell cell = null;

	    int rowNo = 0;



	    // 테이블 헤더용 스타일

	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.

	    headStyle.setBorderTop(BorderStyle.THIN);

	    headStyle.setBorderBottom(BorderStyle.THIN);

	    headStyle.setBorderLeft(BorderStyle.THIN);

	    headStyle.setBorderRight(BorderStyle.THIN);



	    // 배경색은 노란색입니다.

	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);



	    // 데이터는 가운데 정렬합니다.

	    headStyle.setAlignment(HorizontalAlignment.CENTER);



	    // 데이터용 경계 스타일 테두리만 지정

	    CellStyle bodyStyle = wb.createCellStyle();

	    bodyStyle.setBorderTop(BorderStyle.THIN);

	    bodyStyle.setBorderBottom(BorderStyle.THIN);

	    bodyStyle.setBorderLeft(BorderStyle.THIN);

	    bodyStyle.setBorderRight(BorderStyle.THIN);



	    // 헤더 생성

	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(0);

	    cell.setCellStyle(headStyle);

	    cell.setCellValue("월");

	    cell = row.createCell(1);

	    cell.setCellStyle(headStyle);

	    cell.setCellValue("매출");
	    /*
	    cell = row.createCell(2);

	    cell.setCellStyle(headStyle);

	    cell.setCellValue("제목");
		*/


	    // 데이터 부분 생성

	    for(HashMap<String, Object> vo : list) {

	        row = sheet.createRow(rowNo++);

	        cell = row.createCell(0);

	        cell.setCellStyle(bodyStyle);

	        cell.setCellValue((String)vo.get("PAY_DAY"));

	        cell = row.createCell(1);

	        cell.setCellStyle(bodyStyle);
	        
	        cell.setCellValue(((BigDecimal)vo.get("PAY")).intValue());
	        
	        /*
	        cell = row.createCell(2);

	        cell.setCellStyle(bodyStyle);

	        cell.setCellValue(vo.getTitle());
			*/
	    }



	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");

	    response.setHeader("Content-Disposition", "attachment;filename=test.xls");



	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    wb.close();

	}
	
}
