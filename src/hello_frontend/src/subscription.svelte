<script lang="ts">
    import { selectedSubscription } from './store.js';
	export let title: string;
	export let description: string;
	export let cost: string;
	export let logo: string
    export let subscribed: boolean;
    import { fly } from 'svelte/transition';
    // export let subscription;

	function handleClick() {

        selectedSubscription.set(subscription); // set the selected subscription
	}


</script>

<button class="subscription" id="{subscribed ? 'subscribed' : ''}" on:click={handleClick} in:fly={{ y: 200, duration: 500 }}>
    <img src={logo} alt="Logo" class="logo">
    <div class="details">
        <h2 class="title">{title}</h2>
        <p class="description">{description}</p>
        <p class="cost">Cost: ${cost}</p>
        <p class="cost">Subscribed: {subscribed ? 'Yes' : 'No'}</p>
    </div>
</button>

<style>
    .subscription {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        padding: 20px;
        border: 1px solid #bbb;
        border-radius: 5px;
        box-shadow: 3px 5px 30px rgba(14, 14, 14, 0.15);
        color: rgb(68, 68, 68);
        background: #c5ffff;

    }

    .logo {
        width: 80px;
        height: 80px;
        margin-right: 20px;
        border-radius: 50%;
    }

    .details {
        flex: 1;
    }

    .title {
        margin: 0 0 5px;
        font-size: 1.2em;
    }

    .description {
        margin: 0 0 10px;
    }

    .cost {
        margin: 0;
        font-weight: bold;
    }
    #subscribed {
        background-color: #bcfc78; /* indicate user is subscribed to these tiers */
        border: 1px solid #769c51;
        box-shadow: 3px 5px 30px rgba(147, 194, 101, 0.24);
    }
</style>
