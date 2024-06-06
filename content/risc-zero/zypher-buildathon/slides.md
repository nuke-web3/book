---
title: Verifiale Games Using RISC Zero
tags: RISC Zero, Talk, Presentation, Workshop, zkVM, zkGames, Zypher, Hackathon, Buildathon, Zero Knowledge Proof, Applied Cryptography, Rust, Zypher
duration: 60 minuets
description: RISC Zero Workshop for the Zypher Provable Games Buildathon - June 2024 
date: 2024-06-01
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

<link rel="stylesheet" href="../../../tools/styles/r0-theme.css">

<style>
.reveal .slide-background-content {
  background-image: url("./img/r0_planet.svg");
  background-size: contain;
  opacity: 0.3;
}
</style>

<section data-background-opacity=0.3>

# Verifiable Games

<h4 id="using-risc-zero" style="margin-top: -50px;"> <em>Using RISC Zero</em> </h4>

<img rounded style="width: 50%; height: 230px; object-fit: cover;" src="./img/fusion-dragon-ball.gif" />

**_On-chain_ $~~~$ 👉 $ZK$ 👈 $~~~$  _Off-chain_**

<a style="font-size: 0.8em" target="_blank" href="https://nuke-web3.github.io/book/risc-zero/zypher-buildathon/materials.html">Workshop Materials ↗️</a>

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

## What problems can ZK address for games?

On-chain (coprocessor):

- calldata limits restrict complexity
- gas costs are prohibitive
- public blockchains don’t support incomplete information games
- Zypher’s bullet points for challenges of on-chain gaming

Off-chain (TODO):

- Cheating through manipulation of official game logic
- Private game aspects without any 3rd party / admin to adjudicate.

Notes:

- Added **security** and **fairness** and **privacy** that zero-knowledge proofs can provide, as they involve complex decision-making and competitive interactions.
- Commonly turn based, but can simply be tick based (STF analogy -> blocks)
- Privacy is optional, fully transparent games with ZKPs _can_ provided added guarantees around many things other than that (if carefully designed)
  - cheating specifically in being able to go around rules of game logic, especially in cases with hidden player data/logic. (Don't trust. verify!)
- Private:
  - moves of known players
  - cards in your hand / hidden from all deck shuffle
  - hidden ID / anonymous interactions in multiplayer
  - Enabling incomplete information games (e.g. “fog of war” mechanics)
- Can prove final score without revealing _anything_ about the game that resulted in it! Proof of Exploit CTF.

- todo Mention alternatives? Why we are a good or the best choice? (privacy possible, not solidity or DSL specific)
- Off-chain: CFT game where you prove you got a flag without revealing it (because that needs to remain secret) no 3rd party to check, use a proof!

---

## RISC Zero Track Objective

> Develop games using RISC Zero to ensure **privacy and fairness**.

Notes:

Developers are encouraged to implement game designs that can verify player actions without disclosing specific game data. This approach allows for the exploration of new gaming models that operate off-chain but utilize on-chain verification to ensure transparency and fairness.

---

## Definitions & Lingo

- TODO diagram of host that encapsulates guest w/ input & output
- see https://www.youtube.com/watch?v=DzOWh3Ht0_Q & get diagrams

Notes:

- deeper understanding as exercise for views of this presentation.
  See the official docs & youtube for great deep
- very happy to answer questions on our discord!

---

# ✨ Inspiration

> :warning: _Do not copy&paste submissions_ :pray:

Notes:

Plagiarism, missing attribution and violating licenses will disqualify you!
Building on them to something significantly enhancements _**may**_ be considered - please let us know what you are planning :grin:

---

## ZK Checkmate Demo

<!-- FIXME link that works in book and slids and gh-pages -->

Join in following the [Hands-on instructions ↗️](./checkmate-chess-example.md)

Notes:

- Chess demo for verifying a winning move (checkmate) without revealing what the move is.
  Contrived example a bit, but highlights:
  - use crates without modification - no need to rewrite in circuits or zkDSL!
  - Use standard patterns like `println!` & `fmt!` normally for basic experiments.
  - 10s on lines of code overall -> useful proof, easily extensible!
- Original [deep dive video](https://www.youtube.com/watch?v=vxqxRiTXGBI&list=PLcPzhUaCxlCgig7ofeARMPwQ8vbuD6hC5&index=10) ([slides](https://drive.google.com/file/d/1Bum4x50qatqBUlQyNVkt90nnA2SEOHNO/view))

---

## <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/bevy">Bevy (R0 v0.21)</a>

- Serious Rust game engine for ZK games
- BEST place to start to see if you can compile & run this without modification on your machine.

---

## <a target="_blank" href="https://devfolio.co/projects/zksnake-c689">zkSnake (R0 v0.20)</a>

<iframe loading=lazy width="560" height="315" src="https://www.youtube-nocookie.com/embed/zkMqd_AhCFU?si=XH-R6XPzIqf0pHN8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> https://github.com/0xAndoroid/zkSnake

Notes:

- Winner of RISC Zero Coprocessor Bounty at ETHDenver 2024 and did well in community quadratic voting too!
- Idea: take it further and make a bevy app in wasm w/ webGPU with **shared core logic identical on web & "re-player" zkVM**

---

## 3D ZK Games?!

## ▶️ <a target="_blank" href="https://bevyengine.org/examples/Games/alien-cake-addict">Bevy Wasm webGPL/webGPU example</a>

🤯 <a target="_blank" href="https://zyphergames.notion.site/Invitation-gZKm-Provable-Games-Buildathon-1e52aef746874bf08ff1a12c4eed799b?p=77dac845c4984302b9d43a34cc7c2892&pm=c">Zypher Real-time Multiplayer Games Track</a> featured demo!

- <a target="_blank" href="https://github.com/zypher-game/Alien-Cake-Addict">Rendered web game + wallet connect</a>
- <a target="_blank" href="https://github.com/bevyengine/bevy-website/blob/main/generate-wasm-examples/generate_wasm_examples.sh">Original Bevy docs source</a> to generate the playable browser example

---

## 🤔 What is special about RISC Zero?

- developer productivity (@ hackathons & beyond)
  - Top 1000 [crates.io](https://crates.io/) tested ~nightly: [reports.risczero.com](https://reports.risczero.com/)
- todo: key features that are HARD in zkDLS
- proof continuation
- execution separate from proof (realtime exec & prove in parallel / after / remote)
- foundry template & steel & mainnet verifiers

Notes:

- lots of ZKP option, why use R0?
- What killer features does R0 provide?

- Not exclusive on ZKP world for these in many cases longer term, but the collection of them together today makes it very compelling!

- Zeth _could_ run existing solidity games off chain, optionally unbounded computation per block (gasless). [Zeth deep dive](https://www.youtube.com/watch?v=4pBmf839eOA)
- NOTE: 256 view call limit - could you do inclusion proof checkpoints? contract state is simply recursive proof of minimal thing needed (maybe block header / hash?) updated by anyone to use for deep archival view calls? prove "this state was in block X that is a child of recent block {younger than 256}"

---

## 📝 Key Takeaways

- IMPORTANT: match version of `cargo risczero` & examples / templates / examples
- keep guest minimal - extra cycles are VERY expensive (but this is a hackathon, don't over optimize)
- USE DEV MODE!
- Bonsai API key priority & support
- you are designing a cryptographic system, not just a game
- Support forum on discord for help!
- dedicated channel for this event?
- TODO more

---

## TODO

- You emphasized that the proofs are “verrrry” expensive to build — I think we can dial that back. As a it’s something like 100k-1M times more expensive than native compute.
- Not sure what we can offer re malware/viruses — that felt a bit confusing to me
- Jumping around windows was disorienting — would suggest figuring out the specific ordering of which windows you want to open and try to use more words to flag what’s about to happen. perhaps even grabbing the relevant screenshots and importing things into the slides rather than doing a live-tour
- Make text bigger pretty much everywhere, but especially in terminal windows
- FEN is a format for notation chess games and chess positions https://en.wikipedia.org/wiki/Forsyth%E2%80%93Edwards_Notation
- Nice job highlighting the idea that you don't have to do everything inside the zkvm
- Would be nice to synthesize the design patterns. i.e., things we can do are:
  - Prove transcript of game for verifiable high scores
  - Prove state update based on complex game logic.
  - Prove validity of player moves while concealing
- Question about pulling something out into core library.
- Typo on last slide re: zkDSL (it says zkDLS)

youtube description workshop instructions?

see discord ref page for moving to book

missing:

- synthesis of design patterns used in games
  - play & prove latter (snake game)
  - proof for each hidden move, perhaps in a tx on chain
  - can run only core game logic in zkVM - GUI and other non-security/privacy/fairness aspects can live outside the proven core logic (diagram)
- recap
  - as a game dev: what does zk do and not do for me?
- randomness
  - cannot do within guest - only fake & deterministic random for replay of moves perhaps (who gets to know seed? Choose? VRF maybe?)
- video or screen shots instead of live code
- more diagrams especially wrt games
  - how the proof works in game context (seq. diagrams with actors IDed (player, execution, prover))
- what do we not know about web3 games... more on chain that we know of as a team?
- bigger text (for term especially)
- More about web3 integrations specifically? Does foundry worth with zypher?
  - scale solidity games off-chain with Zeth... but should rewrite in rust!
  -

---

# Further Reading & Resources

- <a style="font-size: 0.8em" target="_blank" href="https://nuke-web3.github.io/book/risc-zero/zypher-buildathon/materials.html">Event Materials ↗️</a>
