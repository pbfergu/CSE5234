package edu.osu.cse5234.util;

import edu.osu.cse5234.business.OrderProcessingServiceBean;
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
}
