package edu.osu.cse5234.util;

import edu.osu.cse5234.business.InventoryServiceBean;
import edu.osu.cse5234.business.OrderProcessingServiceBean;
import edu.osu.cse5234.business.view.InventoryService;

import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ServiceLocator {
	public static OrderProcessingServiceBean getOrderProcessingService() {
		try {
	         return (OrderProcessingServiceBean) InitialContext.doLookup(
					"java:module/OrderProcessingServiceBean!edu.osu.cse5234.business.OrderProcessingServiceBean");
		} catch (NamingException ne) {
				throw new RuntimeException(ne);
		}
	}
	
	public static InventoryService getInventoryService() {
		try {
	         return (InventoryService) InitialContext.doLookup(
					"java:global/HongliOptical-EJBEAR/HongliOptical-EJB/InventoryServiceBean!edu.osu.cse5234.business.view.InventoryService");
		} catch (NamingException ne) {
				throw new RuntimeException(ne);
		}
	}
}
