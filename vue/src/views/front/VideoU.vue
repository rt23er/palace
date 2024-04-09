<template>
    <div class="video-container">

        <img v-if="!isPlaying" :src="coverImage" alt="Video Cover" @click="playVideo">
        <video v-else ref="videoPlayer" class="video-player" controls autoplay >
            <source :src="videoSrc" type="video/mp4">
            Your browser does not support the video tag.
        </video>

    </div>
</template>

<script>
export default {
    name: 'VideoU',
    props: {
        videoSrc: {
            type: String,
            required: true
        },
        coverImage: {
            type: String,
            required: true
        }
    },
    data() {
        return {
            isPlaying: false
        };
    },
    methods: {
        playVideo() {
            this.isPlaying = true;
            this.$refs.videoPlayer.play();

        },

    }
};
</script>

<style scoped>
.video-container {
    position: relative;
    width: 100%;
    height: 100%;
}

.video-player {
    /*position: ;*/
    top: 0;
    left: 0;
    width: 100%;
    height: 99vh;
}
img {
    width: 100%;
    height: 100%;
}
</style>
