<script lang="ts">
    import SubscriptionList from './subscriptionList.svelte'
    import SubscriptionPage from './subscriptionPage.svelte';
    import Login from './login.svelte'
    import { selectedSubscription } from './store.js';

</script>

<main>
    <div class="header">
<!--todo: add logo-->
        <div class="logo-div">
            <img src="/public/logo.png" width="70px">
            <h1>Subscriptions</h1>
        </div>
        <Login />
    </div>
    <div class="body">
        {#if $selectedSubscription} <!-- If a subscription is selected -->
            <SubscriptionPage selectedSubscription={$selectedSubscription}/> <!-- Render SubscriptionDetail -->
        {:else} <!-- Else -->
            <SubscriptionList /> <!-- else Render SubscriptionList -->
        {/if}
    </div>

</main>

<style>
.body {
    display: grid;

    justify-content: flex-start;
    align-items: flex-start;
    gap: 5rem;
    width: 80vw;

    margin-top: 200px;
}

.header {
    margin: 5rem 0;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    position: fixed;
    top: 0;
    width: 80vw;
    z-index: 1;
    height: 200px;
    color: #444444;
    /*margin-bottom: 100px;*/
}

.logo-div {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    gap: 1rem;
    /*width: 50vw;*/
}

h1 {
    margin: 0;
}



@media (max-width: 768px) {
    .header {
        flex-direction: column; /* Stack elements vertically */
        align-items: center; /* Center align items */
        width: 100vw;
        margin: 0;
    }
    .logo-div {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 0;
        /*width: 50vw;*/
    }

}
</style>
