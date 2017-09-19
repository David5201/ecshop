package com.lbcto.model.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lbcto.model.dao.AddressDao;
import com.lbcto.model.entity.Address;

@Transactional
@Repository("addressDao")
public class AddressDaoImpl implements AddressDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addAddress(Address address) {
		// TODO Auto-generated method stub
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(address);
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public List<Address> showAllAddressByUid(int uid) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Address where userId=?");
		query.setParameter(0, uid);
		return query.list();
	}

	@Override
	public boolean deleteAddress(int addressId) {
		// TODO Auto-generated method stub
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("delete from Address where id=?");
			query.setParameter(0, addressId);
			query.executeUpdate();
			return true;
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Address getAddressInfoById(int id) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from Address where id=?");
		query.setParameter(0, id);
		return (Address) query.uniqueResult();
	}

}
