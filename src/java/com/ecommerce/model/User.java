package com.ecommerce.model;

public class User {
    private int id;
    private String fullname;   // ✅ correct field name
    private String email;
    private String passwordHash;
    private String phone;

    // Getters and Setters
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public String getFullname() {   // ✅ getter for fullname
        return fullname;
    }
    public void setFullname(String fullname) {   // ✅ setter for fullname
        this.fullname = fullname;
    }

    public String getEmail() { 
        return email; 
    }
    public void setEmail(String email) { 
        this.email = email; 
    }

    public String getPasswordHash() { 
        return passwordHash; 
    }
    public void setPasswordHash(String passwordHash) { 
        this.passwordHash = passwordHash; 
    }

    public String getPhone() { 
        return phone; 
    }
    public void setPhone(String phone) { 
        this.phone = phone; 
    }
}
