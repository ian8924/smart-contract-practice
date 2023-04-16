// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IERC165 {
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface IERC721Metadata {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function tokenURI(uint256 tokenId) external view returns (string memory);
}

interface IERC721 is IERC165 {
    function balanceOf(address owner) external view returns (uint balance);

    function ownerOf(uint tokenId) external view returns (address owner);

    function safeTransferFrom(address from, address to, uint tokenId) external;

    function safeTransferFrom(
        address from,
        address to,
        uint tokenId,
        bytes calldata data
    ) external;

    function transferFrom(address from, address to, uint tokenId) external;

    function approve(address to, uint tokenId) external;

    function getApproved(uint tokenId) external view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) external;

    function isApprovedForAll(
        address owner,
        address operator
    ) external view returns (bool);
}

interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

contract ERC721 is IERC721 , IERC721Metadata {
    event Transfer(address indexed from, address indexed to, uint indexed id);
    event Approval(address indexed owner, address indexed spender, uint indexed id);
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    // 記錄每個 token (即 NFT，以 token ID 編號)的擁有者是誰。
    mapping(uint => address) internal _ownerOf;

    // 記錄每個地址擁有多少個 NFT。
    mapping(address => uint) internal _balanceOf;

    // 記錄每個 NFT 允許被哪些地址取用
    mapping(uint => address) internal _approvals;

    // 紀錄哪些地址可取用此地址所有NFT
    mapping(address => mapping(address => bool)) public isApprovedForAll;

    string _name;

    string _symbol;
    // 儲存 tokenID 對應的 tokenURI
    mapping(uint256 => string) _tokenURI;

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {
        address owner = _ownerOf[tokenId];
        require(owner != address(0), "token not exist");
        return _tokenURI[tokenId];
    }

    // 設定 NFT URI
    function setTokenURI(uint256 tokenId, string memory URI) public {
        _tokenURI[tokenId] = URI;
    }

    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }
    
    function supportsInterface(bytes4 interfaceId) external pure returns (bool) {
        return interfaceId == type(IERC165).interfaceId || interfaceId == type(IERC721).interfaceId || interfaceId == type(IERC721Metadata).interfaceId;
    }

    // 取得NFT擁有數量
    function balanceOf(address owner) external view returns (uint balance) {
        require(owner != address(0), "owner = zero address");
        return _balanceOf[owner];
    }

    // 取得NFT擁有者
    function ownerOf(uint tokenId) external view returns (address owner) {
        require(_ownerOf[tokenId] != address(0), "owner = zero address");
        return _ownerOf[tokenId];
    }

    // 設置允許取用所有NFT權限
    function setApprovalForAll(address operator, bool _approved) external {
        require(operator != address(0), "operator = zero address");
        isApprovedForAll[msg.sender][operator] =_approved;
        emit ApprovalForAll(msg.sender, operator, _approved);
    }

    // 允許取用
    function approve(address to, uint tokenId) external {
        address owner = _ownerOf[tokenId];
        require( owner == msg.sender || isApprovedForAll[owner][msg.sender] , "not authorized");
        _approvals[tokenId] = to;
        emit Approval(owner , to , tokenId);
    }

    // 取得允許權
    function getApproved(uint tokenId) external view returns (address operator) {
        require(_ownerOf[tokenId] != address(0), "token dosent exit");
        return _approvals[tokenId];
    }

    function _isApprovedOrOwner(
        address owner,
        address spender,
        uint tokenId
    ) internal view returns (bool) {
        require(_ownerOf[tokenId] != address(0), "token dosent exit");
        return (spender == owner ||
            isApprovedForAll[owner][spender] ||
            spender == _approvals[tokenId]);
    }

    // 一般轉移
    function transferFrom(address from, address to, uint tokenId) public {
        require( _ownerOf[tokenId] == from , "from != owner");
        require( to != address(0), "to == address(0)");
        require( _isApprovedOrOwner(from, msg.sender, tokenId), "not authorized");

        _balanceOf[from]--;
        _balanceOf[to]++;
        _ownerOf[tokenId] = to;

        delete _approvals[tokenId];

        emit Transfer(from , to, tokenId);
    }
    // 安全轉移
    function safeTransferFrom(address from, address to, uint id) external {
        transferFrom(from, to, id);

        require(
            // 確保 to 不是一個合約的檢查，且能去檢查能不能對 token 操作
            to.code.length == 0 ||
                IERC721Receiver(to).onERC721Received(msg.sender, from, id, "") ==
                IERC721Receiver.onERC721Received.selector,
            "unsafe recipient"
        );
    }
    // 安全轉移 帶data
    function safeTransferFrom(
        address from,
        address to,
        uint id,
        bytes calldata data
    ) external {
        transferFrom(from, to, id);

        require(
            to.code.length == 0 ||
                IERC721Receiver(to).onERC721Received(msg.sender, from, id, data) ==
                IERC721Receiver.onERC721Received.selector,
            "unsafe recipient"
        );
    }

    // mint
    function _mint(address to, uint id) internal {
        require(to != address(0), "mint to zero address");
        require(_ownerOf[id] == address(0), "already minted");

        _balanceOf[to]++;
        _ownerOf[id] = to;

        emit Transfer(address(0), to, id);
    }

    // burn
    function _burn(uint id) internal {
        address owner = _ownerOf[id];
        require(owner != address(0), "not minted");

        _balanceOf[owner] -= 1;

        delete _ownerOf[id];
        delete _approvals[id];

        emit Transfer(owner, address(0), id);
    }

}

contract MyNFT is ERC721 {
    // 帶入建構值
    constructor() ERC721("Test TOKEN","TEST") {

    }

    function mint(address to, uint id) external {
        _mint(to, id);
    }

    function burn(uint id) external {
        require(msg.sender == _ownerOf[id], "not owner");
        _burn(id);
    }
}