function submitPaymentForm() {
  var requiredFields = {};

  // Get required, non-sensitive, values from host page
  requiredFields["full_name"] = document.getElementById("full_name").value;
  requiredFields["month"] = document.getElementById("month").value;
  // Prepend 20 in the year
  requiredFields["year"] = "20" + document.getElementById("year").value;

  Spreedly.tokenizeCreditCard(requiredFields);
}

$(document).ready(function() {
  function getMetaContent(attributeName, attributeValue) {
    var metas = document.getElementsByTagName("meta");

    for (var i = 0; i < metas.length; i++) {
      if (metas[i].getAttribute(attributeName) == attributeValue) {
        return metas[i].getAttribute("content");
      }
    }
  }

  var spreedlyToken = getMetaContent("name", "spreedly_token");

  Spreedly.init(spreedlyToken, {
    numberEl: "spreedly-number",
    cvvEl: "spreedly-cvv"
  });

  Spreedly.on("ready", function() {
    var submitButton = document.getElementById("submit-button");
    submitButton.disabled = false;
  });

  Spreedly.on("errors", function(errors) {
    var errorsDiv = document.getElementById("errors");

    errorsDiv.classList.remove("hidden");
    errorsDiv.innerHTML = "<ul>";
    for (var i = 0; i < errors.length; i++) {
      var error = errors[i];
      var message = errors[i].message;
      errorsDiv.innerHTML += "<li>" + message + "</li>";
      console.log(error);
    }
    errorsDiv.innerHTML += "</ul>";
  });

  Spreedly.on("paymentMethod", function(token, pmData) {
    // Set the token in the hidden form field
    var tokenField = document.getElementById("payment_method_token");
    tokenField.setAttribute("value", token);
    document.getElementById("last_four_digits").value = pmData.last_four_digits;
    document.getElementById("card_type").value = pmData.card_type;

    // Submit the form
    var masterForm = document.getElementById("payment-form");
    masterForm.submit();
  });
});
