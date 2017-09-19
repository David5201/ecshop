package com.lbcto.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lbcto.model.dao.AddressDao;
import com.lbcto.model.entity.Address;
import com.lbcto.model.service.AddressService;

@Service("addressService")
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDao addressDao;

	@Override
	public boolean addAddressService(Address address) {
		// TODO Auto-generated method stub
		return addressDao.addAddress(address);
	}

	@Override
	public List<Address> showAllAddressByUidService(int uid) {
		// TODO Auto-generated method stub
		return addressDao.showAllAddressByUid(uid);
	}

	@Override
	public boolean deleteAddressService(int addressId) {
		// TODO Auto-generated method stub
		return addressDao.deleteAddress(addressId);
	}

	@Override
	public Address getAddressInfoByIdService(int id) {
		// TODO Auto-generated method stub
		return addressDao.getAddressInfoById(id);
	}

}
