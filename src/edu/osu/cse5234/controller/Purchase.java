package edu.osu.cse5234.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.model.Item;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.model.PaymentInfo;
import edu.osu.cse5234.model.ShippingInfo;

@Controller
@RequestMapping("/purchase")
public class Purchase {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Order order = new Order();
		
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
		
		order.setItemList(itemList);
		request.setAttribute("order", order);
		return "OrderEntryForm";
	}

	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		Iterator<Item> it = order.getItemList().iterator();
		while(it.hasNext()){
			Item item = it.next();
			if(item.getQuantity().equals("0"))
				it.remove();
		}
		request.getSession().setAttribute("order", order);
		return "redirect:/purchase/paymentEntry";
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("payment", new PaymentInfo());	
		return "PaymentEntryForm";
	}
	
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("shippingInfo", new ShippingInfo());	
		return "ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShipping(@ModelAttribute("shippingInfo") ShippingInfo shippingInfo, HttpServletRequest request) {
		request.getSession().setAttribute("shippingInfo", shippingInfo);
		return "redirect:/purchase/viewOrder";
	}
	
	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewOrder(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("order", request.getSession().getAttribute("order"));	
		return "ViewOrder";
	}

	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String confirmOrder(@ModelAttribute("shippingInfo") ShippingInfo shippingInfo, HttpServletRequest request) {
		return "redirect:/purchase/Confirmation";
	}
	
	@RequestMapping(path = "/Confirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) {
		return "Confirmation";
	}
}
