<template>
    <div>
        <h2>Home Page</h2>
        <div class="container">
            <div class="row">
                <div v-for="image in latest" :key="image" class="col-lg-3">
                    <ImageCard :img="image" />
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import ImageCard from './ImageCard.vue'

export default {
    name: 'HomePage',
    components: {
        ImageCard
    },
    data() {
        return {
            latest: [
                "http://lorempixel.com/400/200",
                "http://lorempixel.com/400/200",
                "http://lorempixel.com/400/200",
                "http://lorempixel.com/400/200",
                "http://lorempixel.com/400/200"
            ]
        }
    },
}
</script>

<style>
body {
    background-color: #F4F4F4;
}
</style>