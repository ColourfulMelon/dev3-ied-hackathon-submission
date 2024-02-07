<script lang="ts">

    import Subscription from "./subscription.svelte";

</script>

<div class="subscriptionList">
    <Subscription
            title="Example Title"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={true}
    />
    <Subscription
            title="Example Title"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={true}
    />
    <Subscription
            title="Example Title"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={false}
    />

    <Subscription
            title="Example Title"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={false}
    />
</div>

<style>
    .subscriptionList {
        display: grid;
        grid-template-columns: repeat(2, 0.5fr);
        justify-content: flex-start;
        align-items: flex-start;
        gap: 5rem;
        width: 80vw;
        /*height: 20vh;*/

    }
</style>
