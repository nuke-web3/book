## ZK ERC20 Balance of ECDSA Verified Account (R0 v1.0)

### _Signing and Steeling_

Let's experiment with the powers provided by the [Steel library](https://github.com/risc0/risc0-ethereum/tree/main/steel) by taking the ERC20 example and extending it.
The base example only proves that some address holds a balance, with the essential proof being "Some address holds over 1 token at some ERC20 contract at the most recent block"
That isn't a particularly useful statement... let's constrain the proof a bit more to assert that the prover also holds the key to the account in question.

> NOTE: The address and contract are optionally hidden to the verifier, so we can know the prover has a balance, but not DOX them!

1. Watch <a target="_blank" href="https://www.youtube.com/playlist?list=PLcPzhUaCxlCj7wKkzekYYq7QDvtGTOPm7">this playlist</a> to learn the basics of RISC Zero.
1. Use `rzup` to setup your development environment based on the **correct version of the <a target="_blank" href="https://dev.risczero.com/api/">RISC Zero Getting Started Docs</a>** for you.
   ```sh
   # Get rzup
   curl -L https://risczero.com/install | bash
   # Follow command instructions to use rzup
   # ... This will take a while first time!
   ```
1. TODO workshop repo will be up soon™️

## 📝 Key Takeaways

- Use crates in the zkVM without modification - no need to rewrite in circuits or zkDSL!
- Use standard patterns like `println!` & `fmt!` normally for basic experiments and debugging in `DEV_MODE`.
- 10s on lines of code overall -> useful proof, easily extensible!
- There is still many risks of creating privacy and security faults via bugs and all the normal ways cryptographic systems can break down...
  _**With zkVMs you are abstracting the math/circuits of zk... NOT the robust design and audits required to harden your system!**_

## 🤓 Taking it Further

Here are some ideas to keep extending this example to learn more:

- Soon™️
