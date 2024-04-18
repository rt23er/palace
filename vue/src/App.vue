<template>
  <div id="app">
    <router-view/>
  </div>
</template>
<style>


</style>
<script>
import DevicePixelRatio from "@/utils/scale";
export default {
    created() {
        // new DevicePixelRatio().init();
    }
}
</script>
