SuperHeroToken Contract

Description:
The SuperHeroToken is a simple ERC-20 compatible token smart contract that represents a collection of superhero-themed tokens. The contract allows users to create, transfer, and burn these tokens. It has features like transferring tokens between addresses, approving others to spend tokens on your behalf, minting new tokens, and burning existing tokens.

Contract Details:

State Variables:

name: A constant string representing the name of the token ("SuperHeroToken").
symbol: A constant string representing the token symbol ("HERO").
decimals: An 8-bit unsigned integer representing the number of decimals for token values (18).
totalSupply: The total supply of tokens in circulation.
balances: A mapping that stores the balance of each token holder.
allowances: A mapping that stores the approved spending amount of each spender for each token holder.
tokenIdToOwner: A mapping that stores the owner address of each token ID.
ownedTokens: A mapping that stores the list of token IDs owned by each address.
tokenExists: A mapping that indicates whether a token ID exists or not.
nextTokenId: An unsigned integer that keeps track of the next token ID to be minted.
Events:

Transfer: Emitted when tokens are transferred from one address to another.
Approval: Emitted when one address approves another to spend tokens on its behalf.
Mint: Emitted when a new token is minted and assigned to an address.
Burn: Emitted when an existing token is burned and removed from circulation.
Constructor:

The constructor takes an initialSupply as a parameter and sets the totalSupply and the balance of the contract deployer (msg.sender) to the specified initialSupply.
Functions:

transfer: Allows the token owner (msg.sender) to transfer their tokens to another address (to).
approve: Allows the token owner (msg.sender) to approve another address (spender) to spend a certain number of tokens on their behalf.
transferFrom: Allows an approved address (msg.sender) to transfer tokens from a token owner (from) to another address (to).
mint: Allows the contract deployer to mint new tokens and assign them to a specified address (to).
burn: Allows a token owner (msg.sender) to burn their own tokens, effectively removing them from circulation.
Note:

The contract is based on Solidity version 0.8.18.
The contract uses the ERC-20 standard functions for transferring tokens (transfer, approve, transferFrom).
The contract allows minting and burning of tokens, which means new tokens can be created, and existing tokens can be removed from circulation by the token owner.
The contract does not implement any specific business logic for the token. It provides basic functionalities for token management and can be used as a foundation to build more complex token-based applications.
Usage Instructions:

Deploy the SuperHeroToken contract with an initial supply of tokens.
Use the mint function to create new tokens and assign them to specific addresses.
Use the transfer function to transfer tokens from one address to another.
Use the approve function to allow other addresses to spend tokens on your behalf.
Use the transferFrom function to transfer tokens from a token owner to another address when approved.
Use the burn function to remove tokens from circulation (burn them) if you are the token owner.
