package com.codingdojo.javaproject.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class LoginUser {
	@NotEmpty(message="Email required.")
    @Email(message="Invalid email or password.")
    private String email;
    
	@NotNull
    @Size(min=8, max=128, message="Invalid email or password.")
    private String password;
    
    public LoginUser() {}

    
    // GETTERS AND SETTERS 
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}