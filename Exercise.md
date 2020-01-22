# Cryptocurrencies Bonus Exercise

Completing the following exercises can give you a bonus of up to 5 points in the
upcoming semester exam. The first part is concerned with the implementation of a
hash-time-lock store of ether in Solidity. The second part is concerned with the
exploitation of insecure randomness.

## 1. Hash-Time-Lock Store of Ether

### 1.1. Solidity Implementation (2P)

Implement a hash-time-lock store of ether as a Solidity smart contract. It must
implement the interface in file `contracts/Store.sol`. Your contract should
enable users to deposit ether with a hash-time-lock, claimable within a duration
specified by the depositor. After the claim period has timed out, the depositor
should be able to recover his funds.

- When `deposit` is called, the amount of attached ether and the submitted `lock`
  should be stored. Make sure that repeated calls with the same `lock` increase
  the locked amount and that the timeout for this lock is reset. Repeated calls
  for the same `lock` must be sent by the same depositor. A `Deposited` event
  should be emitted.
- When `claim` is called, `require` that there is some ether stored at the
  corresponding `lock = keccak256(key)` and that the claim period is not over,
  yet. If successful, send the stored ether for the lock to the sender of the
  `claim` call. A `Claimed` event should be emitted.
- When `recover` is called, check that the claim period for this lock is over
  and that the sender of the transaction is the initial depositor.

Remember to perform all necessary security `require` checks and state changes.
Once a lock has been claimed or recovered, it should not be possible to deposit
to the same lock again. Make sure that your implementation is as secure as
possible, e.g., it does not allow unintended or double payouts etc.

Deploy your contract to the Rinkeby testnet. Get ether from a so-called testnet
[faucet](https://faucet.rinkeby.io/). Contact us if you are having trouble
getting some testnet ether. You will have to submit the address of your deployed
contract, as we are going to run a test-suite against it.

### 1.2. Security Issues (0.5 P)

Explain the security issues that this type of hash-locking on Ethereum exhibits.

## 2. Treasure Hunt

In this exercise, you will hunt for some ERC20 tokens by exploiting an insecure
source of randomness. Treasure Hunt Tokens can be generated and acquired by
guessing a key that must equal the insecure randomness from function
`insecureRandomness`. The first successful hunter wins 1024e18 tokens after which
the reward is halved for every new successful hunter. The ERC20 contract from
file `contracts/Treasure.sol` is deployed at address
[`0xcd82B734351b9398DC7Cf380556507Ba422754A5`](https://rinkeby.etherscan.io/address/0xcd82B734351b9398DC7Cf380556507Ba422754A5).

#### 2.1. Insecure Randomness (0.5 P)

Explain why the randomness from function `insecureRandomness` is insecure.

#### 2.2. Exploit (2 P)

Exploit the security issue that you just described! Write either a browser-based
or terminal-based dApp and claim your CAC tokens by calling `claimTreasure` on
the `Treasure` contract with the correct key.

In any case, let us know about the address that you are going to use for the
hunt so that we can add it to the whitelist of the contract. Exploits executed
by unregistered addresses cannot be executed successfully. Full points will
only be rewarded to successful hunters.

## Submission

Your solution has to be submitted via moodle and should contain three files that
follow the specifications below. Files with different names or format cannot be
accounted.

Your solutions for exercise 1.2, 2.1 and the address of your deployed contract
of exercise 1.1 needs to be submitted as a text file called   
`<First name group member 1>_<Last name group member 1>_Solution.txt`
that has the following format:

>= Solution Bonus Exercise
>
>== Group Information
>
> <First name group member 1>, <Last name group member 1>, <Matiriculation number group member 1>   
> [<First name group member 2>, <Last name group member 2>, <Matiriculation number group member 2>]   
> [<First name group member 3>, <Last name group member 3>, <Matiriculation number group member 3>]   
>
> == Solution 1.1
>
> Contract address: < Address of the deployed hash-time-lock store contract>
>
> == Solution 1.2
>
> <Solution for exercise 1.2 as free text>
>
> == Solution 2.1
>
> <Solution for exercise 2.1 as free text>
>
> == Solution 2.2
>
> Hunter address: < The whitelisted address you have used for your exploit>

The code you have deployed for exercise 1.1 needs to be submitted in form of a
solidity source code file. The file has to be called   
`<First name group member 1>_<Last name group member 1>_Contract1.sol`.

The code you have utilized for your exploit in exercise 2.2 needs to be submitted
in form of a source code file. The name of this file has to start with   
`<First name group member 1>_<Last name group member 1>_Solution2.<file extension>`.

_Remark: Replace `<...>` with the information specified between the brackets.   
Information between `[...]` is optional._
