package com.lbcto.model.dao;

import java.util.List;

import com.lbcto.model.entity.Address;

public interface AddressDao {

	boolean addAddress(Address address);//添加地址
	
	List<Address> showAllAddressByUid(int uid);//显示用户的地址
	
	boolean deleteAddress(int addressId);//删除地址
	
	Address getAddressInfoById(int id);
}
