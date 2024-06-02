## ZK Checkmate (R0 v1.0)

Let's experiment with a ZK chess game for verifying a winning move (a checkmate) is possible next turn without revealing what the move is to anyone.

1. Watch <a target="_blank" href="https://www.youtube.com/playlist?list=PLcPzhUaCxlCj7wKkzekYYq7QDvtGTOPm7">this playlist</a> to learn the basics
1. Use `rzup` to setup your development environment based on the **correct version of the <a target="_blank" href="https://dev.risczero.com/api/">RISC Zero Getting Started Docs</a>** for you.
   ```sh
   # Get rzup
   curl -L https://risczero.com/install | bash
   # Follow command instructions to use rzup
   # ... This will take a while first time!
   ```
1. Clone and run <a target="_blank" href="https://github.com/risc0/risc0/tree/v1.0.1/examples/chess">the chess example</a> with:
   ```sh
   git clone --branch v1.0.1 --depth=1 https://github.com/risc0/risc0
   cd risc0
   cd examples/chess
   cargo r -r
   # ... This will take a while first time!
   # If you get errors, see step one to get setup!
   ```
1. Take a look at the structure of the code:
   ```sh
   risc0/examples/chess
   ├── Cargo.toml
   ├── core                 
   │   ├── Cargo.toml
   │   └── src
   │       └── lib.rs       # SHARED logic (host & guest)
   ├── methods
   │   ├── build.rs
   │   ├── Cargo.toml
   │   ├── guest
   │   │   ├── Cargo.lock
   │   │   ├── Cargo.toml
   │   │   └── src
   │   │       └── main.rs  # 🌟 Guest = Game Logic to be proven
   │   └── src
   │       └── lib.rs
   ├── README.md
   └── src
       └── main.rs          # Host = Execution of guest & GUI & more unproven
   ```
1. Make some changes to:
   1. `src/main.rs` to change the FEN game state and see if a non-mate move is detected.
   1. `methods/guest/src/main.rs` to change what is proven about the game.
      Perhaps add something to `core/src/lib.rs` around player ID that could be proven?

## 📝 Key Takeaways

This example is a bit contrived as it's a single move that should be easy to spot, but highlights:

- Use crates in the zkVM without modification - no need to rewrite in circuits or zkDSL!
- Use standard patterns like `println!` & `fmt!` normally for basic experiments and debugging in `DEV_MODE`.
- 10s on lines of code overall -> useful proof, easily extensible!
- <a target="_blank" href="https://en.wikipedia.org/wiki/Bayesian_game">Incomplete information games</a> are possible on-chain! Hidden data/moves for players are proven, never revealed to _anyone_!

> Original <a target="_blank" href="https://www.youtube.com/watch?v=vxqxRiTXGBI&list=PLcPzhUaCxlCgig7ofeARMPwQ8vbuD6hC5&index=10">deep dive video</a> & <a target="_blank" href="https://drive.google.com/file/d/1Bum4x50qatqBUlQyNVkt90nnA2SEOHNO/view">slides</a> & <a target="_blank" href="https://github.com/risc0/risc0-rust-examples/tree/main/chess">source</a> - a great reference to supliment, but outdated using R0 v0.12 .
