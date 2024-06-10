## ZK Checkmate (R0 v1.0)

Let's experiment with a ZK chess game for verifying a winning move (a checkmate) is possible next turn without revealing what the move is to anyone.
We extend the example by proving we know a set of moves that arrives at that final board state.

1. (Optional) <a target="_blank" href="https://www.youtube.com/watch?v=juxiL-PM6kk">Watch a primer</a> on <a target="_blank" href="https://en.wikipedia.org/wiki/Forsyth%E2%80%93Edwards_Notation">FEN</a> and <a target="_blank" href="https://www.dcode.fr/san-chess-notation">SAN</a> notation for chess.
1. Watch <a target="_blank" href="https://www.youtube.com/playlist?list=PLcPzhUaCxlCj7wKkzekYYq7QDvtGTOPm7">this playlist</a> to learn the basics of RISC Zero.
1. Use `rzup` to setup your development environment based on the **correct version of the <a target="_blank" href="https://dev.risczero.com/api/">RISC Zero Getting Started Docs</a>** for you.
   <center>
   <iframe loading=lazy style="width: 80%; aspect-ratio: 1400/900; margin: 0 0;" src="https://www.youtube-nocookie.com/embed/G25EtWklxFk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
   </center>

   ```sh
   # Get rzup
   curl -L https://risczero.com/install | bash
   # Follow command instructions to use rzup
   # ... This will take a while first time!
   ```
1. <a target="_blank" href="https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template">Generate a new repo from the template</a> for <a target="_blank" href="https://github.com/risc0/risc0/tree/v1.0.1/examples/chess">this chess example</a>:
   ```sh
   # Clone direct, or your new repo fom this template:
   git clone https://github.com/<YOUR_GH_USER>/risc0-v1-chess 
   # **OR** Clone the template direct:
   git clone https://github.com/nuke-web3/risc0-v1-chess 
   cd risc0-v1-chess 
   cargo r -r
   # ... This will take a while first time!
   # If you get errors, see step one to get setup!
   ```
1. Take a look at the structure of the code and key files:
   <center>
   <iframe loading=lazy style="width: 80%; aspect-ratio: 1400/900; margin: 0 0;" src="https://www.youtube-nocookie.com/embed/HTXlI3x8FFY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
   </center>

   ```sh
   risc0/examples/risc0-v1-chess 
   ├── Cargo.toml
   ├── core                 
   │   ├── Cargo.toml
   │   └── src
   │       └── lib.rs       # 🌍 Shared = Host ↔️ Guest
   ├── methods
   │   ├── build.rs
   │   ├── Cargo.toml
   │   ├── guest
   │   │   ├── Cargo.lock
   │   │   ├── Cargo.toml
   │   │   └── src
   │   │       └── main.rs  # 🧰 Guest = Game Logic to be proven 🌟
   │   └── src
   │       └── lib.rs
   ├── README.md
   └── src
       └── main.rs          # 🏃 Host = Execution of guest & GUI & more unproven
   ```
1. Add the ability to prove multiple moves arriving at a final checkmate:
   1. In `core/src/lib.rs` change `Inputs` to allow for many moves, also refactor where that struct is used as needed.
   1. In `src/main.rs` change the FEN `initial_state` and `mv` to `moves` to support multiple _(legal)_ moves.
      1. ✨Experiment with game `Inputs` on <a target="_blank" href="https://www.chess.com/analysis?tab=analysis">chess.com/analysis</a> by `Loading` a valid FEN in "setup position" any playing moves.
      1. Test if a non-mate move is detected.
   1. In `methods/guest/src/main.rs` change what is `commit`ed about the game.

<details>
<summary>⚠️ <b>SPOILERS</b> ⚠️</summary>

> <a target="_blank" href="https://github.com/nuke-web3/risc0-v1-chess/pull/1">One possible solution with comments and tips</a>

<center>
<iframe loading=lazy style="width: 80%; aspect-ratio: 1400/900; margin: 0 0;" src="https://www.youtube-nocookie.com/embed/cOEx0doRit0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</center>

</details>

## 📝 Key Takeaways

<center>
<iframe loading=lazy style="width: 80%; aspect-ratio: 1400/900; margin: 0 0;" src="https://www.youtube-nocookie.com/embed/TjDZcLUgRV0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</center>

- Use crates in the zkVM without modification - no need to rewrite in circuits or zkDSL!
- Use standard patterns like `println!` & `fmt!` normally for basic experiments and debugging in `DEV_MODE`.
- 10s on lines of code overall -> useful proof, easily extensible!
- <a target="_blank" href="https://en.wikipedia.org/wiki/Bayesian_game">Incomplete information games</a> are possible on-chain! Hidden data/moves for players are proven, never revealed to _anyone_!
- There is still many risks of creating privacy and security faults via bugs and all the normal ways cryptographic systems can break down...
  _**With zkVMs you are abstracting the math/circuits of zk... NOT the robust design and audits required to harden your system!**_

## 🤓 Taking it Further

Here are some ideas to keep extending this example to learn more:

- Add something to `core/src/lib.rs` around player identity that could be proven, perhaps their blockchain account via [ENS](https://ens.domains/).
- Make the game multiplayer with turns between untrusting parties
  - Perhaps using moves signed by players in a <a target="_blank" href="https://ethereum.org/en/developers/docs/scaling/state-channels/">state channel</a> type construction, latter proven to arrive at a final winner (only?) in the receipt.
- Integrate with the <a target="_blank" href="https://github.com/risc0/risc0-foundry-template">Foundry Template</a>
  - Game with stake or pot to play?
  - Verify a winner and dispense funds accordingly.

> Original <a target="_blank" href="https://www.youtube.com/watch?v=vxqxRiTXGBI&list=PLcPzhUaCxlCgig7ofeARMPwQ8vbuD6hC5&index=10">deep dive video</a> & <a target="_blank" href="https://drive.google.com/file/d/1Bum4x50qatqBUlQyNVkt90nnA2SEOHNO/view">slides</a> & <a target="_blank" href="https://github.com/risc0/risc0-rust-examples/tree/main/chess">source</a> - a great reference to supplement, but outdated using R0 v0.12 .
