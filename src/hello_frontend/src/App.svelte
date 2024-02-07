<script lang="ts">
    import SubscriptionList from './subscriptionList.svelte'
    import Login from './login.svelte'
    let myComponent = false;
    let componentTitle = '';
    switch (componentTitle) {
        case '':
            myComponent = false;
            break;
        default:
            myComponent = true;
            break;
    }



</script>

<main>
    <div class="header">
<!--todo: add logo-->
        <div class="logo-div">
            <img src="/public/vite.svg">
            <h1>Subscriptions</h1>
        </div>
        <Login />
    </div>
    <div class="body">
        <SubscriptionList />




    </div>

</main>

<style>
.body {
    display: grid;

    justify-content: flex-start;
    align-items: flex-start;
    gap: 5rem;
    width: 80vw;
    /*height: 20vh;*/

}

.header {
    display: flex;
    justify-content: space-between;
    /*width: 100vw;*/
    align-items: center;
}

.logo-div {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    gap: 1rem;
    width: 50vw;
}

</style>
