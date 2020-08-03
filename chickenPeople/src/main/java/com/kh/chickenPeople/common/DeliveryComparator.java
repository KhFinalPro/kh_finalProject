package com.kh.chickenPeople.common;

import java.util.Comparator;

import com.kh.chickenPeople.delivery.model.vo.Delivery;

public class DeliveryComparator implements Comparator<Delivery>{

	@Override
	public int compare(Delivery first, Delivery second) {
		double firstValue = first.getDistance_user();
		double secondValue = second.getDistance_user();
		
		if(firstValue > secondValue)
		{
			return 1;
		}
		else if(firstValue < secondValue)
		{
			return -1;
		}
		else
		{
			return 0;
		}
	}

}
