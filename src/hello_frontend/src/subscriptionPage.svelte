<script lang="ts">
    export let title: string;
    export let description: string;
    export let cost: string;
    export let logo: string
</script>

<div class="item-details">
    <h1>{title}</h1>
    <img src={logo}>
    <!-- todo add more details -->
</div>

<style>
    /* Styles for item details component */
</style>