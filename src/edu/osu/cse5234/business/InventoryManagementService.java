package edu.osu.cse5234.business;

import java.util.ArrayList;
import java.util.List;

import edu.osu.cse5234.model.Inventory;
import edu.osu.cse5234.model.Item;

public class InventoryManagementService {
	
	private Inventory inventory = new Inventory();
	
	public InventoryManagementService() {
		List<Item> itemList = new ArrayList<Item>();
		
		Item item1 = new Item();
		item1.setName("Ray Ban");
		item1.setQuantity("0");
		itemList.add(item1);
		
		Item item2 = new Item();
		item2.setName("Levis");
		item2.setQuantity("0");
		itemList.add(item2);
		
		Item item3 = new Item();
		item3.setName("Gucci");
		item3.setQuantity("0");
		itemList.add(item3);
		
		Item item4 = new Item();
		item4.setName("Prada");
		item4.setQuantity("0");
		itemList.add(item4);
		
		Item item5 = new Item();
		item5.setName("Oakley");
		item5.setQuantity("0");
		itemList.add(item5);
		
		inventory.setItemList(itemList);
	}
	
	public Inventory getAvailableItems() {
		return inventory;
	}

}
