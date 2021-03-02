package com.com.gentelella.vo;

import lombok.Data;

@Data
public class WebSocketGroundVO {

	private String groundName;
	private int groundNumber;
	
	@Override
	public String toString() {
		return "Ground[groundNumber="+ groundNumber + ", goundName="+ groundName + "]";
	}
}
