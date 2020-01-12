# Cryptocurrencies Bonus Exercise

Completing the following exercises can give you a bonus of up to 5 points in the
upcoming semester exam. The first part is concerned with the implementation of a
hash-time-lock store of ether in Solidity. The second part is concerned with the
exploitation of insecure randomness.

## 1. Hash-Time-Lock Store of Ether

### 1.1. Solidity Implementation (2P)

Implement a hash-time-lock store of ether as a Solidity smart contract. It must
fulfill the interface in file `contracts/Store.sol`. Your contract should make
it possible to deposit ether with a hash-time-lock, claimable within a duration
specified by the depositor.  After the claim period has timed out, the depositor
should be able to recover their funds.

- When `deposit` is called, the amount of the attached ether should be stored
  with the lock. Make sure that repeated calls with the same `lock` increase the
  locked amount and that the timeout for this lock is reset. Repeated calls for
  the same `lock` must be sent by the same depositor. A `Deposited` event should
  be emitted.
- When `claim` is called, `require` that there is some ether stored at the
  corresponding `lock = keccak256(key)` and that the claim period is not over
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
getting some testnet ether. Once deployed, let us know about your contract
address so we can check that it fulfills the above specification. We'll run a
test-suite against it.

### 1.2. Security Issues (1/2 P)

Explain the security issues that this type of hash-locking on Ethereum exhibits.

## 2. Treasure Hunt

In this exercise, you will hunt for some ERC20 token by exploiting an insecure
source of randomness. Treasure Hunt Token can be generated and acquired by
guessing a key that must equal the insecure randomness from function
`insecureRandomness`. The first successful hunter wins 1024e18 token after which
the reward is halved for every new successful hunter. The ERC20 contract from
file `contracts/Treasure.sol` is deployed at address ...

#### 2.1. Insecure Randomness (1/2 P)

Explain why the randomness from function `insecureRandomness` is insecure.

#### 2.2. Exploit (2 P)

Exploit the security issue that you just described! Write either a browser-based
or terminal-based dApp and claim your CAC token by calling `claimTreasure` on
the `Treasure` contract with the correct key.

In any case, let us know about the address that you are going to use for the
hunt so that we can add it to the whitelist of the contract. Full points will
only be rewarded to successful hunters.

## Submission

All source code files must be submitted via moodle. Your submission must also
include the names of all group members and their matriculation numbers. And
don't forget to tell us the address of your deployed contract on the Rinkeby
testnet for exercise 1. E-Mail us the Rinkeby address that you are going to use
for the treasure hunt in exercise 2 to `david.kretzler@cysec.de` as soon as you
are going to start your exploit so that we can add it to the whitelist
beforehand.
