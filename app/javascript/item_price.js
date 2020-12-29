window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);

    const profitValue = document.getElementById("profit");
      const addTaxValue = inputValue * 0.1
      profitValue.innerHTML = Math.floor(inputValue - addTaxValue);
  })
})