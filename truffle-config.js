const HDWalletProvider = require("truffle-hdwallet-provider");
const fs = require('fs');
const path = require('path');
const mnemonic = fs.readFileSync(path.resolve(__dirname, '.secret')).toString().trim();

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      // must be a thunk, otherwise truffle commands may hang in CI
      provider: () =>
        new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/3f31d4bec1fa44dc9cf19827c6e65d85"),
      network_id: '3',
    }
  }
};