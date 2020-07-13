package mvc.vo;

import java.util.Map;

public class PageVO {

    // nowPage - ����������
    // startPage - ����������
    // endPage - ��������
    // total - �Խñ� �� ����
    // cntPerPage - �������� �� ����, ������������
    // lastPage - ������������
    // start, end  - ������ ���� ��
 private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
//������ ����� Cnt
 private int cntPage = 5;
 private String searchType, searchValue;
 private boolean prev, next;
 
 private int ilju_sky_num, ilju_land_num, ilju_sky_num2, ilju_land_num2,user_num;
 private char sex;

 
 
 public int getCntPage() {
	return cntPage;
}
public void setCntPage(int cntPage) {
	this.cntPage = cntPage;
}
public String getSearchType() {
	return searchType;
}
public void setSearchType(String searchType) {
	this.searchType = searchType;
}
public String getSearchValue() {
	return searchValue;
}
public void setSearchValue(String searchValue) {
	this.searchValue = searchValue;
}
public PageVO() {
 }
 public PageVO(int total, int nowPage, int cntPerPage) {
  this.nowPage=nowPage;
  this.cntPerPage=cntPerPage;
  this.total=total;
  memberLastPage(total, cntPerPage); //������ ������
  memberStartEndPage(nowPage, cntPage, cntPerPage, total); //����, �������� ���
  memberStartEnd(nowPage, cntPerPage); //������ ������ ���۰� �� ��ȣ
  
 }
 
 // ���� ������ ������ ���
 private void memberLastPage(int total, int cntPerPage) {
	 //ceil : �ø�ó��
  lastPage = (int) Math.ceil((double)total / (double)cntPerPage);
 }
 
 // ����, �� ������ ���, prev, next ó��
 private void memberStartEndPage(int nowPage, int cntPage, int cntPerPage, int total) {
  endPage = ((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage;
  if (getLastPage() < getEndPage()) {
   endPage = getLastPage();
  }
  startPage =getEndPage() - cntPage + 1;
  if (getStartPage() < 1) {
   startPage = 1;
  }
  
  prevnext(startPage, endPage, cntPerPage, total);
 } 
 
//������ ������ ���۰� �� ��ȣ
 private void memberStartEnd(int nowPage, int cntPerPage) {
  end = nowPage * cntPerPage;
  start = end - cntPerPage + 1;
 }
 
 private void prevnext(int startPage, int endPage, int cntPerPage, int total) {
	 
	if (startPage==1) {
		prev = false;
	}else {
		prev = true;
	}
	
	if (endPage*cntPerPage >= total) {
		next=false;
	}else {
		next=true;
	}
 }
 
 public int getNowPage() {
  return nowPage;
 }
 public void setNowPage(int nowPage) {
  this.nowPage = nowPage;
 }
 public int getStartPage() {
  return startPage;
 }
 public void setStartPage(int startPage) {
  this.startPage = startPage;
 }
 public int getEndPage() {
  return endPage;
 }
 public void setEndPage(int endPage) {
  this.endPage = endPage;
 }
 public int getTotal() {
  return total;
 }
 public void setTotal(int total) {
  this.total = total;
 }
 public int getCntPerPage() {
  return cntPerPage;
 }
 public void setCntPerPage(int cntPerPage) {
  this.cntPerPage = cntPerPage;
 }
 public int getLastPage() {
  return lastPage;
 }
 public void setLastPage(int lastPage) {
  this.lastPage = lastPage;
 }
 public int getStart() {
  return start;
 }
 public void setStart(int start) {
  this.start = start;
 }
 public int getEnd() {
  return end;
 }
 public void setEnd(int end) {
  this.end = end;
 } 
 public int setCntPage() {
  return cntPage;
 }
 public void getCntPage(int cntPage) {
  this.cntPage = cntPage;
 } 
 public boolean isPrev() {
	return prev;
 }
 public void setPrev(boolean prev) {
	this.prev = prev;
 }
 public boolean isNext() {
	return next;
 }
 public void setNext(boolean next) {
	this.next = next;
 }

 @Override
 public String toString() {
  return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
    + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
    + ", cntPage=" + cntPage + "prev=" + prev + ", next=" + next +"]";
 }
 
 
public int getIlju_sky_num() {
	return ilju_sky_num;
}
public void setIlju_sky_num(int ilju_sky_num) {
	this.ilju_sky_num = ilju_sky_num;
}
public int getIlju_land_num() {
	return ilju_land_num;
}
public void setIlju_land_num(int ilju_land_num) {
	this.ilju_land_num = ilju_land_num;
}
public int getIlju_sky_num2() {
	return ilju_sky_num2;
}
public void setIlju_sky_num2(int ilju_sky_num2) {
	this.ilju_sky_num2 = ilju_sky_num2;
}
public int getIlju_land_num2() {
	return ilju_land_num2;
}
public void setIlju_land_num2(int ilju_land_num2) {
	this.ilju_land_num2 = ilju_land_num2;
}
public char getSex() {
	return sex;
}
public void setSex(char sex) {
	this.sex = sex;
}
public int getUser_num() {
	return user_num;
}
public void setUser_num(int user_num) {
	this.user_num = user_num;
}

 
}