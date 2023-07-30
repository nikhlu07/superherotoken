// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SuperHeroToken {
    string public constant name = "SuperHeroToken";
    string public constant symbol = "HERO";
    uint8 public constant decimals = 18;
    uint public totalSupply;

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;
    mapping(uint256 => address) public tokenIdToOwner;
    mapping(address => uint256[]) public ownedTokens;
    mapping(uint256 => bool) public tokenExists;

    uint256 public nextTokenId = 1;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Mint(address indexed to, uint256 indexed tokenId);
    event Burn(address indexed from, uint256 indexed tokenId);

    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * (10**uint256(decimals));
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 tokenId) external returns (bool) {
        require(to != address(0), "Invalid recipient address");
        require(tokenExists[tokenId], "Token does not exist");
        require(tokenIdToOwner[tokenId] == msg.sender, "You don't own this token");

        tokenIdToOwner[tokenId] = to;
        emit Transfer(msg.sender, to, tokenId);
        return true;
    }

    function mint(address to) external {
        require(nextTokenId <= totalSupply, "Maximum token limit reached");

        uint256 tokenId = nextTokenId;
        tokenIdToOwner[tokenId] = to;
        ownedTokens[to].push(tokenId);
        tokenExists[tokenId] = true;
        nextTokenId++;

        emit Mint(to, tokenId);
        emit Transfer(address(0), to, tokenId);
    }

    function burn(uint256 tokenId) external {
        require(tokenExists[tokenId], "Token does not exist");
        require(tokenIdToOwner[tokenId] == msg.sender, "You don't own this token");
        require(balances[msg.sender] >= 1, "Insufficient balance for burning");

        tokenIdToOwner[tokenId] = address(0);
        tokenExists[tokenId] = false;
        balances[msg.sender]--;

        emit Burn(msg.sender, tokenId);
        emit Transfer(msg.sender, address(0), tokenId);
    }
}
