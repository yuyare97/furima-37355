window.addEventListener('load', function () {
  const priceInput = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")

  priceInput.addEventListener('keyup', function () {
    const input_price = document.getElementById("item-price").value
    const tax_price = Math.floor(input_price * 0.1)
    const profit_price = input_price - tax_price
    console.log(profit_price)
    addTaxPrice.innerHTML = tax_price
    profitPrice.innerHTML = profit_price
  })
})
