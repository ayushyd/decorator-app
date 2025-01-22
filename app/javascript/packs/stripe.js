import { loadStripe } from "@stripe/stripe-js";

document.addEventListener("DOMContentLoaded", async () => {
  const stripe = await loadStripe("<%= @stripe_publishable_key %>");
  const form = document.getElementById("payment-form");

  form.addEventListener("submit", async (event) => {
    event.preventDefault();

    const { setupIntent, error } = await stripe.confirmCardSetup(
      "YOUR_CLIENT_SECRET",
      {
        payment_method: {
          card: cardElement,
          billing_details: {
            name: "Your Customer Name",
          },
        },
      }
    );

    if (error) {
      console.error(error);
    } else {
      // Send setupIntent.payment_method to your server
    }
  });
});
