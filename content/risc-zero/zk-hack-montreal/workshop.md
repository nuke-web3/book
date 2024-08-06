# Prove ERC20 Balance of Verified Account Owner (R0 v1.0)

## 👷 _Signing and Steeling_

Let's experiment with the powers provided by the [Steel library](https://github.com/risc0/risc0-ethereum/tree/main/steel) by taking the [base ERC20 example](https://github.com/risc0/risc0-ethereum/tree/main/examples/erc20) and extending it with the [base ECDSA example](https://github.com/risc0/risc0/tree/main/examples/ecdsa).
The ERC20 example only proves that some address holds a balance, with the essential proof being "Some address holds over 1 token at some ERC20 contract at the most recent block"
That isn't a particularly useful statement... in our case we want to know that the **owner** of some account has a balance.

### 🫡 Our Mission

_**Constrain**_ the ERC20 example to _**assert**_ that the **prover** also holds the key to the account we are checking the balance of, hence is the "owner".
We do this by verifying a ECDSA signature for the EVM account in question.

_NOTE: The address and contract are optionally hidden to the verifier, so we can know the prover has a balance, but not DOX them!_

### 🚀 Let's GO!

1. Watch <a target="_blank" href="https://www.youtube.com/playlist?list=PLcPzhUaCxlCj7wKkzekYYq7QDvtGTOPm7">this playlist</a> to learn the basics of RISC Zero.
1. Use `rzup` to setup your development environment based on the **correct version of the <a target="_blank" href="https://dev.risczero.com/api/">RISC Zero Getting Started Docs</a>** for you.
   ```sh
   # Get rzup
   curl -L https://risczero.com/install | bash
   # Follow command instructions to use rzup
   # ... This will take a while first time!
   ```
1. <a target="_blank" href="https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template">Generate a new repo from the template</a> for <a target="_blank" href="https://github.com/nuke-web3/signing-and-steeling">this workshop source</a>:
   ```sh
   # Clone direct, or your new repo fom this template:
   git clone https://github.com/<YOUR_GH_USER>/risc0-v1-chess 
   # **OR** Clone the template direct:
   git clone https://github.com/nuke-web3/signing-and-steeling
   cd signing-and-steeling
   cargo r -r
   # ... This will take a while first time!
   # If you get errors, see step one to get setup!
   ```

1. Take a look at the structure of the code and key files:
   ```sh
   signing-and-steeling
   ├── README.md
   ├── Cargo.toml           # 📝 Config = MUST use consistent R0 versions!
   ├── methods
   │   └── guest
   │       └── src
   │           └── main.rs  # 🧰 Guest = Game Logic to be proven 🌟
   └── src
       └── main.rs          # 🏃 Host = Execution of guest & GUI & more unproven
   ```
   Other files may need some minor adjustments, but is essentially boilerplate for the context of this workshop.

1. Extend the ERC20 balance check to ensure that the **prover is the owner of the account being checked.**

<details>
<summary>⚠️ <b>SPOILERS</b> ⚠️</summary>

> <a target="_blank" href="https://github.com/nuke-web3/signing-and-steeling/pull/1">One possible solution with comments and tips</a>

</details>

## 📝 Key Takeaways

- Use crates in the zkVM without modification - no need to rewrite in circuits or zkDSL!
- Use standard patterns like `println!` & `fmt!` normally for basic experiments and debugging in `DEV_MODE`.
- 10s on lines of code overall -> useful proof, easily extensible!
- There is still many risks of creating privacy and security faults via bugs and all the normal ways cryptographic systems can break down...

> 🧠 You don't need to know the deeper cryptographic details to build proof systems using zkVMs... BUT don't forget you are building a _cryptographic system!_
>
> ⚠ **With zkVMs you are NOT abstracting the requirement for robust design and audits of your proof system!**

## 🤓 Taking it Further

Here are some ideas to keep extending this example to learn more:

- Take the core logic and host workflows and embed them into a **coprocessor**with the [Foundry Template](https://github.com/risc0/risc0-foundry-template)- NOTE: versions MUST match throughout for `Cargo.toml` with respect to `risc0-...` dependencies.
- Fix the replay attack inherent in this example to ensure the prover is the key holder, rather than anyone that has a valid signed message for this proof.
- Bench and optimize the guest program, as there are likely ways to make this example _much_ more performant!
