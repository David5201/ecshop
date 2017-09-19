package com.lbcto.model.service;

import java.util.List;

import com.lbcto.model.entity.Address;

public interface AddressService {

	boolean addAddressService(Address address);
	
	List<Address> showAllAddressByUidService(int uid);
	
	boolean deleteAddressService(int addressId);
	
	Address getAddressInfoByIdService(int id);
}
