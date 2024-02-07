<script lang="ts">
    export let selectedSubscription: {title: string, description: string};
</script>

<div class="subscriptionDetail">
    <!-- Display the subscription props here -->
    <h1>{selectedSubscription.title}</h1>
    <p>{selectedSubscription.description}</p>
    <!-- Add more fields as needed -->
</div>

<style>
    .subscriptionDetail {
        /* Add your styles here */
    }
</style>