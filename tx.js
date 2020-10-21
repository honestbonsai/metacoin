const { callbackify } = require("util");
const MetaCoin = artifacts.require("MetaCoin");

const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

module.exports = callbackify(async function (...args) {
  const contracts = await Promise.all([
    MetaCoin.deployed(),
  ]);

  const accounts = await web3.eth.getAccounts();
  const max = 1;
  let j = 0;

  for (let i = 0; i < max; i++) {
    for (let contract of contracts) {
      j++;
      console.log(`${j} | Sending...`);
      await contract.sendCoin(accounts[1], 1).then((res) => {
        console.log(`${j} | Sent to: ${res.receipt.to} | tx: ${res.tx}`);
      });
    }
  }

  // Make sure the logs appear even when theres not that many
  await delay(2 * 60 * 1000);
});
