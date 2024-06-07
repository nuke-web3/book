# Zypher gZKm Provable Games Buildathon

## 📝 Event Specific Info

- <a target="_blank" href="https://dorahacks.io/hackathon/zypher-hackathon/hackers">Dora Hacks Event Page <strong>(APPLY HERE)</strong></a>
- <a target="_blank" href="https://zyphergames.notion.site/gZKm-Provable-Games-Buildathon-1a14e60564894ec59c919549f381a46c?p=4e4d1938a8ed4359be42e528fd6c6846&pm=c">Event & RISC Zero Track Info</a>
- <a target="_blank" href="https://zypher.network/">Zypher Homepage</a>
- RISC Zero [🪧 Presentation (Video & Sides)](./presentation.md)
- RISC Zero [👷 Workshop (ZK Chess Checkmate)](./workshop.md)

### ⭐ Zypher 🤝 RISC Zero Example

<a target="_blank" href="https://github.com/zypher-game/poker0">poker0</a> - A poker game leveraging RISC Zero and PLONK for off-chain proof of game processes, with on-chain validation, built on the <a target="_blank" href="https://github.com/zypher-game/z4">Z4 engine</a>.

> Note: This perhaps is a rather complex starting point from without any experience with RISC Zero or PLONK, we suggest experimenting with the [more basic examples](#risc-zero-game-examples) first to get a feel for things first 😸.

## 🧠 Further Reading & Resources

### RISC Zero Game Examples

Note that many other <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/">examples</a> showcase things you might want (reading a JSON file, checking a password, and more!)

Here are a few key game specific ones:

- <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/bevy">Bevy</a> - a serious Rust game engine
- <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/wordl">Wordl</a> - A non-trivial game
- <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/chess">Chess</a>
- <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/composition">Bevy</a>

### RISC Zero powered <a target="_blank" href="https://devfolio.co/projects/zksnake-c689">zkSnake (R0 v0.20)</a>

<iframe loading=lazy width="560" height="315" src="https://www.youtube-nocookie.com/embed/zkMqd_AhCFU?si=XH-R6XPzIqf0pHN8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

> https://github.com/0xAndoroid/zkSnake

- Winner of RISC Zero Coprocessor Bounty at ETHDenver 2024 and did well in community quadratic voting too!
- Idea: take it further and make a bevy app in wasm w/ webGPU with **shared core logic identical on web & "re-player" zkVM**

### <a target="_blank" href="https://blog.zkga.me/announcing-darkforest">Dark Forest</a>

<iframe loading=lazy width="560" height="315" src="https://www.youtube-nocookie.com/embed/z7V830zndoA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

☝️ A fantastic veteran review of their work and showcases fundamentally new type of game that web3 makes possible: build base infrastructure for others **to build on top of _permissionless_**.
Shared infra -> plurality of ways to interact with a wider community on the same base layer opens up novel MMO games _**built by and for players**_!

Although today zkVMs help devs avoid needing to write most of the game in some contract language or (zk)DSL, like is enabled in RISC Zero with <a target="_blank" href="https://github.com/risc0/risc0/tree/release-0.21/examples/bevy">the bevy game engine</a>.
And it's very likely to be far more cost effective to run too!

### More for RISC Zero

- [zkVM Guest Optimization Tips and Tricks (RISC Zero Study Club)](https://www.youtube.com/watch?v=MckieUBpakw)
- [DOOM on RISC Zero](https://www.risczero.com/blog/when-the-doom-music-kicks-in) (not playable, but proof DOOM can run _**everything**_ in zkVM guest)
- [zkVM Benchmarks, Tested Crates & More](https://reports.risczero.com/)
