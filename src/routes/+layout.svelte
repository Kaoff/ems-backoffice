<script>
import "../app.css";

const { children } = $props();
</script>

<div class="with-background h-svh">
    <div class="backdrop h-full">
        {@render children()}
    </div>
</div>

<style>
    .with-background {
        background-image: url("$lib/assets/background.jpg");
        background-size: cover;
        background-position: center;
    }

    .backdrop {
        backdrop-filter: blur(15px);
    }
</style>