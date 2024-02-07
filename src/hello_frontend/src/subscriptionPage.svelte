<script lang="ts">
    export let selectedSubscription: {title: string, description: string};
</script>

<div class="subscriptionDetail">
    <!-- Display the subscription props here -->
    <h1>{selectedSubscription.title}</h1>
    <p>{selectedSubscription.description}</p>
    <p>Cost: ${selectedSubscription.cost}</p>
    <img src={selectedSubscription.logo} alt="Logo" class="logo">
    <p>Subscribed: {selectedSubscription.subscribed ? 'Yes' : 'No'}</p>

    {#if selectedSubscription.subscribed}
        <button on:click={() => console.log('Unsubscribed')}>Unsubscribe</button>
    {:else}
        <button on:click={() => console.log('Subscribed')}>Subscribe</button>
    {/if}
    <!-- Add more fields as needed -->
</div>

<style>
    .subscriptionDetail {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
        /*border: 1px solid #bbb;*/
        border-radius: 5px;
        /*box-shadow: 3px 5px 30px rgba(14, 14, 14, 0.15);*/
        color: rgb(68, 68, 68);
        /*background: #c5ffff;*/
        /*width: 100vw; !* Full width *!*/
        /*height: 100vh; !* Full height *!*/
    }

    .subscriptionDetail h1 {
        font-size: 2em;
        margin-bottom: 20px;
    }

    .subscriptionDetail p {
        font-size: 1.2em;
        margin-bottom: 10px;
    }
</style>