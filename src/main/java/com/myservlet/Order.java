package com.myservlet;
public class Order {
    private int id;

    private String firstName;

    private String lastName;

    private String address;

    private String phone_num;

    private String credit_card_num;

    private String cvv;

    private String shippingMethod;

    private String expiryDate;
    
    private ShoppingCart orderDetail;

    public int getId(){
        return id;
    }

    public void setId(int id){
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }
    
    public String getFirstName(){
        return firstName;
    }

    public void setLastName(String lastname){
        this.lastName = lastname;
    }

    public void setFirstName(String firstname) {
       this.firstName = firstname;
    }

    public String getShippingMethod(){
        return this.shippingMethod;
    }

    public void setShippingMethod(String shippingMethod){
        this.shippingMethod = shippingMethod;
    }

    public String getExpiryDate(){
        return this.expiryDate;
    }

    public void setExpiryDate(String expiryDate){
        this.expiryDate= expiryDate;
    }

    public String getCvv(){
        return this.cvv;
    }

    public void setCvv(String cvv){
        this.cvv= cvv;
    }

    public ShoppingCart getOrderDetail(){
        return this.orderDetail;
    }

    public void setOrderDetail(ShoppingCart orderDetail){
        this.orderDetail= orderDetail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getCredit_card_num() {
        return credit_card_num;
    }

    public void setCredit_card_num(String credit_card_num) {
        this.credit_card_num = credit_card_num;
    }
    
    
}
