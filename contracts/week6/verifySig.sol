// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


/*
0. message to sign 
1. hash(message)
2. sign(hash(message), private key) | offchain 
3. ecrecover(hash(message), signature) == signer
*/

contract verifySig {
    // 驗證簽名是否為 signer 本人的（ signer 地址 , 要驗證的字串 , 簽名 ）
    function verify(address _signer, string memory _message, bytes memory _sign) external pure returns(bool) {
        // 1 .先 hash message
        bytes32 messageHash = getMessageHash(_message);
        // 2. 取得透過私鑰將 hash 後的 message 簽章
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        // 3. 驗證是否為本人簽章
        return recover(ethSignedMessageHash, _sign) == _signer;
    } 


    function getMessageHash(string memory _message) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns(bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sign) public pure returns(address) {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sign);
        // 透過 ecrecover函式 回傳地址，若為 0 代表簽章無效
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function _split(bytes memory _sign) internal pure returns (bytes32 r, bytes32 s, uint8 v) {
        require(_sign.length == 65 , "invalid signature length");
        // assembly 可直接取 memory byte 做操作
        assembly {
            // : = assembly 內作用等同於 =
            r:= mload(add(_sign, 32))
            s:= mload(add(_sign, 64))
            v:= byte(0,mload(add(_sign, 96)))
        }

    }

}