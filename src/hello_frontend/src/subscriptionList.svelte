<script lang="ts">

    import Subscription from "./subscription.svelte";

</script>

<div class="subscriptionList">
    <Subscription
            title="Example 1"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={true}
    />
    <Subscription
            title="Example Title 2"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={true}
    />
    <Subscription
            title="Example Title 3"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={false}
    />

    <Subscription
            title="Example Title 4"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={false}
    />

    <Subscription
            title="Example Title 5"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={false}
    />

    <Subscription
            title="Example Title 6"
            description="Example Description"
            cost="50"
            logo="/public/vite.svg"
            subscribed={false}
    />

</div>

<style>
    .subscriptionList {
        display: grid;
        justify-content: flex-start;
        align-items: flex-start;
        gap: 5rem;
        width: 80vw;
        /*height: 20vh;*/
        grid-template-columns: repeat(3, 1fr);
    }

    @media (max-width: 768px) {
        .subscriptionList {
            grid-template-columns: repeat(1, 1fr);
        }
    }
</style>
