# hello

Some frontend development history can be found at [frontend.](https://github.com/ColourfulMelon/hackathon-frontend)



## Running the project locally

To rumn the project locally, you will need to have DFX installed (> v0.12). You can find instructions for that [here.](https://sdk.dfinity.org/docs/quickstart/local-quickstart.html)

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```

Once the job completes, your application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.
