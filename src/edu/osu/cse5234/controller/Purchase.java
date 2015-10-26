package edu.osu.cse5234.controller;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.model.PaymentInfo;
import edu.osu.cse5234.model.ShippingInfo;
import edu.osu.cse5234.util.ServiceLocator;

@Controller
@RequestMapping("/purchase")
public class Purchase {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Order order = new Order();
		order.setItemList(ServiceLocator.getInventoryService().getAvailableInventory().getItemList());
		request.setAttribute("order", order);
		return "OrderEntryForm";
	}

	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request){
		Iterator<Item> it = order.getItemList().iterator();
		while(it.hasNext()){
			Item item = it.next();
			if(item.getQuantity().equals("0"))
				it.remove();
		}
		
		//Object#3&#4 (5)
		Boolean isvalid = ServiceLocator.getOrderProcessingService().validateItemAvailability(order);
		if(!isvalid){
			request.setAttribute("invalidMessage", "Please resubmit item quantities");
			//request.getRequestDispatcher("OrderEntryForm").forward(request,response);
			return "OrderEntryForm";
		}
		
		request.getSession().setAttribute("order", order);
		return "redirect:/purchase/paymentEntry";
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryPage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("payment", new PaymentInfo());	
		return "PaymentEntryForm";
	}
	
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submmitPayment(@ModelAttribute("payment") PaymentInfo paymentInfo, HttpServletRequest request) {
		request.getSession().setAttribute("payment", paymentInfo);	
		return "redirect:/purchase/shippingEntry";
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
		//request.setAttribute("order", request.getSession().getAttribute("order"));
		//request.setAttribute("payment", request.getSession().getAttribute("payment"));
		//request.setAttribute("shippingInfo", request.getSession().getAttribute("shippingInfo"));
		return "ViewOrder";
	}

	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String confirmOrder(@ModelAttribute("shippingInfo") ShippingInfo shippingInfo, HttpServletRequest request) {
		return "redirect:/purchase/Confirmation";
	}
	
	@RequestMapping(path = "/Confirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("confirmationCode", ServiceLocator.getOrderProcessingService().processOrder((Order)request.getSession().getAttribute("order")));
		return "Confirmation";
	}
}
