package test.app.project.vo;

import java.util.List;

public class RoomsJoinVo {

	private int room_num;
	private String roomname;
	private int room_price;
	private String room_info;
	private int max_Personnel;
	
	private List<RoomsImgVo> rooms_img;
	
	
	public RoomsJoinVo(){
		
	}

	public RoomsJoinVo(int room_num, String roomname, int room_price, String room_info, int max_Personnel,
			List<RoomsImgVo> rooms_img) {
		super();
		this.room_num = room_num;
		this.roomname = roomname;
		this.room_price = room_price;
		this.room_info = room_info;
		this.max_Personnel = max_Personnel;
		this.rooms_img = rooms_img;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public String getRoom_info() {
		return room_info;
	}

	public void setRoom_info(String room_info) {
		this.room_info = room_info;
	}

	public int getMax_Personnel() {
		return max_Personnel;
	}

	public void setMax_Personnel(int max_Personnel) {
		this.max_Personnel = max_Personnel;
	}

	public List<RoomsImgVo> getRooms_img() {
		return rooms_img;
	}

	public void setRooms_img(List<RoomsImgVo> rooms_img) {
		this.rooms_img = rooms_img;
	}
	
	
	
}
