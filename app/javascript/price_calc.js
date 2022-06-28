function priceCalc() {
  const priceForm = document.getElementById("item-price");
  const priceTax = document.getElementById("add-tax-price");
  const priceProfit = document.getElementById("profit");

  priceForm.addEventListener('input', function() {
    const priceTaxResult = (priceForm.value) * 0.1;
    priceTax.innerHTML = `${Math.round(priceTaxResult)}`;
    priceProfit.innerHTML = `${Math.round((priceForm.value) - priceTaxResult)}`
  })
}

window.addEventListener('load', priceCalc);