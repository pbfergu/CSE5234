package edu.osu.cse5234.model;

import java.util.List;

import edu.osu.cse5234.business.view.Item;

public class Order {
	
	private List<Item> itemList;

	public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}


	
}
