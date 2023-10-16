

function submitForm() {
    var productId = document.getElementById("product_id").innerHTML;
    var quantity = document.getElementById("quantity").value;
    var firstName = document.getElementById("first-name").value;
    var lastName = document.getElementById("last-name").value;
    var phoneNumber = document.getElementById("phone-number").value;
    var shippingAddress = document.getElementById("shipping-address").value;
    var shippingMethod = document.getElementById("shipping-method").value;
    var creditCardNumber = document.getElementById("creditCardNumber").value;
    var expiryDate = document.getElementById("expiryDate").value;
    var cvv = document.getElementById("cvv").value;

    if (!productId || !quantity || !firstName || !lastName || !phoneNumber || !shippingAddress || !shippingMethod || !creditCardNumber || !expiryDate || !cvv) {
        alert('Please fill in all the fields in the form!');
    }else if(!checkAddress(shippingAddress) || !checkBankAccount(creditCardNumber) || !checkCVV(cvv) || !checkExpiryDate(expiryDate) || !checkPhoneNumber(phoneNumber)){
        return false;
    }else {
        var body = "Dear " + firstName +" " + lastName + ",%0D%0A" + "We are writing to inform you that your order for the Orange Phone has been successfully submitted. Thank you for choosing Orange as your provider of cutting-edge mobile technology." + "%0D%0AHere is you order information:" + "%0D%0AProduct identifier: " + productId + "%0D%0A"
            + "Quantity: " + quantity + "%0D%0A"
            + "First name: " + firstName + "%0D%0A"
            + "Last name: " + lastName + "%0D%0A"
            + "Phone number: " + phoneNumber + "%0D%0A"
            + "Shipping address: " + shippingAddress + "%0D%0A"
            + "Shipping method: " + shippingMethod + "%0D%0A"
            + "Credit card number: " + creditCardNumber + "%0D%0A"
            + "Thank you for your business. We look forward to serving you.%0D%0A" +
            "%0D%0A" +
            "Best regards,%0D%0A" +
            "The Orange Team"  ;
        window.location.href = "mailto:customer@orange.com?subject=Order Confirmation - Your Orange Phone is on its way!&body=" + body;
        window.location.href = "index.html";
    }
}

function checkPhoneNumber(input) {
    var phoneNumberPattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
    var phoneNumber = input;
    if (!phoneNumberPattern.test(phoneNumber)) {
        alert("Invalid phone number format. Please enter a valid US phone number.");
        return false;
    }
    return true;
}
function checkBankAccount(input) {
    var bankAccountPattern = /^[0-9]{13,19}$/;
    var bankAccount = input;
    if (!bankAccountPattern.test(input)) {
        alert("Invalid bank account format. Please enter a valid bank account number.");
        return false;
    }
    return true;
}

function checkAddress(input) {
    var addressPattern = /^[a-zA-Z0-9\s,'-]*$/;
    var address = input;
    if (!addressPattern.test(address)) {
        alert("Invalid address format. Please enter a valid address.");
        return false;
    }
    return true;
}

function checkCVV(input) {
    var cvvPattern = /^[0-9]{3}$/;
    var cvv = input;
    if (!cvvPattern.test(cvv)) {
        alert("Invalid CVV format. Please enter a valid CVV number.");
        return false;
    }
    return true;
}

function checkExpiryDate(input) {
    var expiryDatePattern = /^(0[1-9]|1[0-2])\/\d{2}$/;
    var expiryDate = input;
    if (!expiryDatePattern.test(expiryDate)) {
        alert("Invalid expiry date format. Please enter a valid expiry date in the format MM/YY.");
        return false;
    }
    return true;
}
