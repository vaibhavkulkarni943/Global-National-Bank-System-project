package com.bank.dao;

import com.bank.dto.ContactDTO;

public interface ContactDAO {
	
	
    boolean saveContactRequest(ContactDTO contact);
}
