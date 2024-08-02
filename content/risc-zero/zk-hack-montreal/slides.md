---
title: No Circuits Required - Building ZK Proof Systems in Pure Rust
tags: RISC Zero, Talk, Presentation, Workshop, zkVM, Steel, EVM, Hackathon, Zero Knowledge Proof, Applied Cryptography, Rust, ZK Hack, Montreal
duration: 60 minuets
description: RISC Zero Workshop for the Zypher Provable Games Buildathon - June 2024 
date: 2024-08-09
#
# RevealJS Settings
#
# Add custom css files for your slides here, comma separated:
separator: "\r?\n---\r?\n"
verticalSeparator: "\r?\n---v\r?\n"
# Below can be any of these: https://revealjs.com/config/
revealOptions:
  transition: "convex" # animation between slides = none/fade/slide/convex/concave/zoom
	backgroundTransition: "none" # background swap between slides = none/fade/slide/convex/concave/zoom
	slideNumber: true
	controls: true
	progress: true
---

<link rel="stylesheet" href="/tools/styles/r0-theme.css">

<section data-background-opacity=0.3>

# No Circuits Required

## Building ZK Proof Systems in _Pure Rust_

<a target="_blank" href="https://nuke-web3.github.io/book/risc-zero/zk-hack-montreal/materials.html">Event Materials ↗️</a>

---

## Why RISC Zero?

### _Write Rust 🦀<br/> Not Circuits 𝛌_

Notes:

### Story time!

Started in self-sovereign tech rabbit whole 2018 ETHDenver.
Mesh networks, local first, DAOs and co-ops, token engineering...
Then I found out about ZKPs and what they can do to fundamentally change the game and enable things that were impossible before.
As an fanboi of the ZK Podcast for years, I wanted so much to get in... but there was a problem: learning curve on cryptography.
I want to build cryptographic systems, but not need to deeply understand the moon math...
Enter zkVMs: RISC Zero.
Now we can all make ZKPs with only a strong conceptual grasp of constraint systems and Rust (more languages to come!)

---

## Why RISC Zero?

- **Verifiable Computation**: outsource-able
- **Highly Scalable**: low-cost verification
- **Tunable Privacy**: robust & universal\*

Notes:

- you can verify that a computation of a specific program ran exactly as it should, even if done by untrusted executor!
- _Prover_ that runs program & produces _receipt_ reveals as little as nothing to everything about execution to _verifier_.
- Verification is significantly cheaper than running computation yourself... at the cost of prover doing significantly more work to run the _zkVM_
- \* Privacy is from everyone outside the prover, if you are the prover, no one but you has secret data.

---

## What key web3 problems can ZK address?

<nuke-cols>
<nuke-col center>

### EVM Devs

- **Referring to historical state**
- **Trusting off-chain logic**
- **Boundless Execution**

</nuke-col>
<nuke-col center>

### Layer <0|1|2|...> Devs

- **True ZK (Privacy)**
- **Scalability (Compression)**
- **Interoperability (🌉, rollups)**

</nuke-col>
</nuke-cols>

> See RISC Zero <a target="_blank" href="https://dev.risczero.com/api/use-cases">docs</a> and <a target="_blank" href="https://risczero.com/blog">blog</a> for **lots** more

Notes:

- RETH / REVM -> ZETH - support EVM execution of contracts, REVM for only parts.
  - Also supports verifiable merkle proof of subset of global evm state.
- **ZK coprocessor** - run verifiable program logic in zkVM by 3rd party or yourself to untrusting parties
- Added **security** and **fairness** and **privacy** that zero knowledge proofs can provide, as they involve complex decision-making and competitive interactions.
- Privacy is optional, fully transparent games with ZKPs _can_ provided added guarantees around many things other than that (if carefully designed)

---

## RISC Zero Bounties

- 🤩 Best zkVM Application - _2x 500 USD_
- 🤝 ZK Coprocessor - _4x 500 USD_
- 👪 Integrations - _**15x** 200 USD_

<br/>

> **Qualifications on [Devfolio](https://zk-hack-montreal.devfolio.co/prizes?partner=RISC+Zero) 👀**

Notes:

---

## RISC Zero 101

<img rounded style="width: 60%;" src="./img/zkVM-diagram-black.png" />

> Read <a target="_blank" href="https://dev.risczero.com/api/getting-started">Getting Started</a> and/or watch the <a target="_blank" href="https://www.youtube.com/playlist?list=PLcPzhUaCxlCj7wKkzekYYq7QDvtGTOPm7">playlist</a>.

Notes:

- deeper understanding as exercise for views of this presentation.
- very happy to answer questions on our discord!

---

## RISC Zero On-chain

<img rounded style="width: 60%;" src="./img/risc0-ethereum-bonsai.png" />

> Read about <a target="_blank" href="https://dev.risczero.com/api/blockchain-integration/bonsai-on-eth">Blockchain Integration</a> and watch the <a target="_blank" href="https://www.youtube.com/playlist?list=PLcPzhUaCxlCgsTtFen4oxFIDkUMSVSFFo">Foundry Template playlist</a>.

---

# ✨ Inspiration

##### ⚠️ -- Do not copy 🍝 -- 🙏

Notes:

Plagiarism, missing attribution and violating licenses will disqualify you!
Building on them to something significantly enhancements _**may**_ be considered - please let us know what you are planning :grin:

---

## <a target="_blank" href="https://devfolio.co/projects/zksnake-c689">zkSnake (R0 v0.20)</a>

<iframe loading=lazy width="560" height="315" src="https://www.youtube-nocookie.com/embed/zkMqd_AhCFU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

#### <a target="_blank" href="https://github.com/0xAndoroid/zkSnake">zkSnake Source ↗️</a>

Notes:

- Winner of RISC Zero Coprocessor Bounty at ETHDenver 2024 and did well in community quadratic voting too!
- Idea: take it further and make a bevy app in wasm w/ webGPU with **shared core logic identical on web & "re-player" zkVM**

---

<img rounded style="width: 50%; height: 50%; object-fit: cover;" src="./img/steel-banner.png" />

Notes:

Want to build even more complicated or otherwise impossible contract logic?
Enter Steel - view call library.
Example: view call that checks existence of balance on chain, like in our ERC20 example workshop!

---

# 👷 Signing and Steeling Workshop

<!-- FIXME link that works in book and slides and gh-pages -->

**Join in following the [Hands-on instructions ↗️](./workshop.md)**

---

## 🎇 What is special about RISC Zero? (1)

- Developer productivity (@ hackathons & beyond)
  <br/>&nbsp; Top 1000 <a target="_blank" href="https://crates.io/">crates.io</a> tested nightly,
  <br/>&nbsp; benchmarks and more: <a target="_blank" href="https://reports.risczero.com/">reports.risczero.com</a>
- Hard in zkDSL, easy in zkVM:
  <br/>&nbsp; Loops & branching
  <br/>&nbsp; Design 🡺 Implementation 🡺 Auditing

Notes:

- Lots of ZKP options, why use R0?
  - zkDSL _could_ be more performant, but time to market is very high, small set of humans can implement them at all.
  - Why use us over other zkVMs?
    First, arguably best devex, v1.0 release stability and prover performance milestones!

---

## 🎇 What is special about RISC Zero? (2)

- Proof <a target="_blank" href="https://www.risczero.com/blog/continuations">continuation</a>
  <br/>&nbsp; Unbounded guest programs
- Proof <a target="_blank" href="https://www.risczero.com/blog/proof-composition">composition</a>
  <br/>&nbsp; "Proof-ception"
  <br/>&nbsp; Hybrid Client side {🕵️privacy} & server {🦾power}
- Execution _separate_ from proof generation

Notes:

- Proof-ception = efficient verification of proofs within a guest.
  - Privacy for small client side proofs and the bulk of proof computational overhead outsourced to an untrusted prover.
  - Reuse of existing proofs included in new proof using their journal
  - Batching/compression of many proofs
  - Proof transposition for compatibility of specific verifiers.
- Execution is near zero overhead, proving is high overhead.
  - Realtime exec & prove in parallel / after / remote is possible
- What killer features does R0 provide?

---

## 🎇 What is special about RISC Zero? (3)

**⛓️ EVM Support ⛓️**

- <a target="_blank" href="https://github.com/risc0/risc0-foundry-template">RISC Zero Foundry template</a>
  <br/>&nbsp; Write unbounded programs for EVM chains
- <a target="_blank" href="https://github.com/risc0/risc0-ethereum">Ethereum contracts, proof systems, and more</a>
  <br/>&nbsp; View call proofs with **Steel**
  <br/>&nbsp; ZK Rollups & RollApps
  <br/>&nbsp; ... Help us define more!

Notes:

- Zeth _could_ run existing solidity games off chain, optionally unbounded computation per block (gasless). [Zeth deep dive](https://www.youtube.com/watch?v=4pBmf839eOA)
- mention: 256 view call limit - could you do inclusion proof checkpoints? contract state is simply recursive proof of minimal thing needed (maybe block header / hash?) updated by anyone to use for deep archival view calls? prove "this state was in block X that is a child of recent block {younger than 256}"

---

## 🤿 Before you dive deep...

- You _must_ match versions of `cargo risczero` and your Cargo.toml deps
  <br/>&nbsp; Some examples / templates may not be the version you need!
  <br/>&nbsp; Use `^1.0` versions throughout.
- Keep guest minimal - extra cycles are _**expensive**_
  <br/>&nbsp; ...But this is a hackathon, don't stress too much!
- When experimenting, always use <a target="_blank" href="https://dev.risczero.com/api/generating-proofs/dev-mode"> `DEV_MODE`</a>!
  <br/>&nbsp; Execution _only_ with mocked proving (fast!)
- Bonsai API key priority & support
  <br/>&nbsp; Apply: <a target="_blank" href="https://www.bonsai.xyz/">bonsai.xyz/</a> (manual review & approval from our team)
- Discord `#💻|support-forum` channel for help
  <br/>&nbsp; Join: <a target="_blank" href="https://discord.com/invite/risczero">discord.gg/risczero</a>

> 🧠 Don't need to know the crypto details to build...<br/> don't forget you are building a cryptographic system!
