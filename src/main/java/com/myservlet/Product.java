package com.myservlet;
public class Product {

    // id
    private int id;

    private String phoneName;

    private String imageOne;

    private String imageTwo;

    private String imageThree;

    private String screenSize;

    private String resolution;

    private String processor;

    private String ram;

    private String storage;

    private String operatingSystem;

    private String RearFacingCamera;

    private String price;

    private double rate;
    
    private int numPeople;

    public Product(int id, String phoneName, String imageOne, String imageTwo, String imageThree, String screenSize, 
    String resolution, String processor, String ram, String storage, String operatingSystem, 
    String RearFacingCamera, String price, double rate, int numPeople){
        this.id = id;
        this.phoneName = phoneName;
        this.imageOne = imageOne;
        this.imageTwo = imageTwo;
        this.imageThree = imageThree;
        this.screenSize = screenSize;
        this.resolution = resolution;
        this.processor = processor;
        this.ram = ram;
        this.storage = storage;
        this.operatingSystem = operatingSystem;
        this.RearFacingCamera = RearFacingCamera;
        this.price = price;
        this.rate = rate;
        this.numPeople = numPeople;
    }

    public int getId(){
        return id;
    }

    public String getPhoneName(){
        return phoneName;
    }

    public String getImageOne(){
        return imageOne;
    }

    public String getImageTwo(){
        return imageTwo;
    }

    public String getImageThree(){
        return imageThree;
    }

    public String getScreenSize(){
        return screenSize;
    }

    public String getResolution(){
        return resolution;
    }

    public String getProcessor(){
        return processor;
    }

    public String getRam(){
        return ram;
    }

    public String getStorage(){
        return storage;
    }

    public String getOpratingSystem(){
        return operatingSystem;
    }

    public String getRearFacingCamera(){
        return RearFacingCamera;
    }

    public String getPrice(){
        return price;
    }

    public double getRate(){
        return rate;
    }

    public int getNumPeople(){
        return numPeople;
    }

    public void setRate(double rate){
        this.rate = rate;
    }

    public void setNumPeople(int numPeople){
        this.numPeople = numPeople;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPhoneName(String phoneName) {
        this.phoneName = phoneName;
    }

    public void setImageOne(String imageOne) {
        this.imageOne = imageOne;
    }

    public void setImageTwo(String imageTwo) {
        this.imageTwo = imageTwo;
    }

    public void setImageThree(String imageThree) {
        this.imageThree = imageThree;
    }

    public void setScreenSize(String screenSize) {
        this.screenSize = screenSize;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public void setProcessor(String processor) {
        this.processor = processor;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public void setOperatingSystem(String operatingSystem) {
        this.operatingSystem = operatingSystem;
    }

    public void setRearFacingCamera(String rearFacingCamera) {
        RearFacingCamera = rearFacingCamera;
    }

    public void setPrice(String price) {
        this.price = price;
    }



}
