import { btc_payment_backend } from "../../declarations/btc_payment_backend";

document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  // Interact with foo actor, calling the greet method
  const addr = await btc_payment_backend.get_caller_p2pkh_address();

  button.removeAttribute("disabled");

  document.getElementById("btc-address").innerText = addr;

  return false;
});
