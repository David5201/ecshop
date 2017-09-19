package com.lbcto.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lbcto.model.entity.Address;
import com.lbcto.model.entity.User;
import com.lbcto.model.service.AddressService;
import com.lbcto.utils.GetCurrentDateTime;
import com.opensymphony.xwork2.ActionContext;

public class AddressAction {

	@Autowired
	private AddressService addressService;
	
	private Address address;
	private List<Address> addresslist;
	private int addressID;
	
	public String addAddress(){
		User user =(User) ActionContext.getContext().getSession().get("user");
		address.setUserId(user.getId());
		address.setCreateTime(GetCurrentDateTime.getNowTime());
		addressService.addAddressService(address);
		saveAddressToSession();
		return "success";
	}
	
	public String getUserAddress(){
		saveAddressToSession();
		return "success";
	}
	
	public String deleteAddress(){
		addressService.deleteAddressService(addressID);
		saveAddressToSession();
		return "success";
	}
	
	
	
	public void saveAddressToSession(){
		User user =(User) ActionContext.getContext().getSession().get("user");
		addresslist=addressService.showAllAddressByUidService(user.getId());
		ActionContext.getContext().getSession().put("addresslist", addresslist);		
	}
	
	

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}
	
	
	
}
