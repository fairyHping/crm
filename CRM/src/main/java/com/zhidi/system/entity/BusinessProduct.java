package com.zhidi.system.entity;

public class BusinessProduct {
    private Integer id;

    private Integer businessId;

    private Integer productId;

    private Float salesPrice;

    private Float estimatePrice;

    private Integer amount;

    private Integer discountRate;

    private Integer taxRate;

    private Float unitPrice;

    private Float subtotal;

    private String description;

    private Float subtotalVal;

    private Float discountPrice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Integer businessId) {
        this.businessId = businessId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Float getSalesPrice() {
        return salesPrice;
    }

    public void setSalesPrice(Float salesPrice) {
        this.salesPrice = salesPrice;
    }

    public Float getEstimatePrice() {
        return estimatePrice;
    }

    public void setEstimatePrice(Float estimatePrice) {
        this.estimatePrice = estimatePrice;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Integer getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(Integer discountRate) {
        this.discountRate = discountRate;
    }

    public Integer getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(Integer taxRate) {
        this.taxRate = taxRate;
    }

    public Float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Float getSubtotalVal() {
        return subtotalVal;
    }

    public void setSubtotalVal(Float subtotalVal) {
        this.subtotalVal = subtotalVal;
    }

    public Float getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }
}