<script lang="ts">
import AppIcon from "./AppIcon/AppIcon.svelte";
import type { AppIconProps } from "./AppIcon/types";

const { size = "large" }: { size?: AppIconProps["size"] } = $props();
</script>

<AppIcon {size} color={{from: "primary", to: "white"}} href="/app">
    <div class="w-full h-full flex justify-center items-center text-base-100 font-bold" class:text-5xl={size === "large"} class:text-xs={size !== "large"}>
        { size === "small" ? "eOS" : "emsOS" }
    </div>
</AppIcon>