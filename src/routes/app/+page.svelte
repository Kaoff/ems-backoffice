<script lang="ts">
  import { apps } from '$lib/apps';
  import AppIcon from "$lib/components/AppIcon/AppIcon.svelte";
</script>

<div
  class="grid grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-8"
>
  {#each apps as { color, icon, name, href }}
    <div class="flex-col items-center hidden md:flex">
      <AppIcon size="large" {color} {icon} {href} />
      <div class="mt-2">{name}</div>
    </div>
    <div class="flex-col items-center flex md:hidden">
        <AppIcon size="medium" {color} {icon} {href} />
        <div class="mt-2 text-center">{name}</div>
      </div>
  {/each}
</div>
