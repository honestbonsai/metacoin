const { callbackify } = require("util");
const MetaCoin = artifacts.require("MetaCoin");
const MetaCoin2 = artifacts.require("MetaCoin2");
const MetaCoin3 = artifacts.require("MetaCoin3");
const MetaCoin4 = artifacts.require("MetaCoin4");
const MetaCoin5 = artifacts.require("MetaCoin5");

const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

module.exports = callbackify(async function (...args) {
  const contracts = await Promise.all([
    MetaCoin.deployed(),
    MetaCoin2.deployed(),
    MetaCoin3.deployed(),
    MetaCoin4.deployed(),
    MetaCoin5.deployed(),
  ]);

  const accounts = await web3.eth.getAccounts();
  const max = 10;
  let j = 0;

  for (let i = 0; i < max; i++) {
    for (let contract of contracts) {
      j++;
      console.log(`${j} | Sending...`);
      await contract.sendCoin(accounts[1], 1).then((res) => {
        console.log(`${j} | to: ${res.receipt.to} | tx: ${res.tx}`);
      });
    }
  }

  // Make sure the logs appear even when theres not that many
  await delay(2 * 60 * 1000);
});
