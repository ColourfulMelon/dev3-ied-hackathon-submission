<script lang="ts">
    import {
        createActor,
        hello_backend,
    } from "../../declarations/hello_backend";
    import { AuthClient } from "@dfinity/auth-client";
    import { HttpAgent } from "@dfinity/agent";
    let actor = hello_backend;
    console.log(process.env.CANISTER_ID_INTERNET_IDENTITY);

    async function handleAuth(){
        let authClient = await AuthClient.create();
        // start the login process and wait for it to finish
        await new Promise((resolve) => {
            authClient.login({
                identityProvider:
                    process.env.DFX_NETWORK === "ic"
                        ? "https://identity.ic0.app"
                        : `http://rdmx6-jaaaa-aaaaa-aaadq-cai.localhost:4943`,
                onSuccess: resolve,
            });
        });
        const identity = authClient.getIdentity();
        const agent = new HttpAgent({ identity });
        actor = createActor(process.env.CANISTER_ID_II_INTEGRATION_BACKEND, {
            agent,
        });
        return false;
    }
</script>



<div class="auth">
    <button id="login-button" on:click={handleAuth}> <img id="login" src="/public/IC_logo.png" width="50px"><p id="login">Login</p></button>
    <!--            <p id="principal"></p>-->
</div>




<style>

    #login {
        color: #000000;

    }

    #login-button {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        gap: 1rem;
        padding: 1rem 2rem;
        border-radius: 1rem;
        background-color: #f0f0f0;
        border: none;
        cursor: pointer;
    }
</style>
