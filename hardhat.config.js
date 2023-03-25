require("@nomicfoundation/hardhat-toolbox");

require("dotenv").config();

const privateKey = process.env.PRIVATE_KEY;
const endpoint = process.env.URL;
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  networks: {
    goerli: {
      url: endpoint,
      accounts: [`0x${privateKey}`]
    }
  }
};
