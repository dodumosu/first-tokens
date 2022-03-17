// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// an 'appeal' to a certain 'god' to leave Nigerians
// alone. consider it a sacrifice
contract MeffyCoin is ERC20 {
  address public admin;
  uint tokensPerEth = 1000;

  constructor() ERC20('MeffyCoin', 'MFC') {
    admin = msg.sender;
    _mint(admin, 1000000);
  }

  function buyToken(address receiver) public payable {
    require(receiver != admin, "Cannot buy tokens as admin!");
    require(msg.value > 0, "Send ETH to buy tokens");
    _mint(receiver, msg.value / tokensPerEth);
  }
}
