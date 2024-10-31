<script lang="ts">
  import type { Color } from '$lib/types/colors';
  import "iconify-icon";
  import type { AppIconProps } from './types';
  import { browser } from '$app/environment';

  const plainBackgroundVariants: { [key: Color]: string } = {
    primary: "bg-primary",
    secondary: "bg-secondary",
    base: "bg-base-100",
    slate: "bg-slate-500",
    gray: "bg-gray-500",
    red: "bg-red-500",
    green: "bg-green-500",
    blue: "bg-blue-500",
    indigo: "bg-indigo-500",
    purple: "bg-purple-500",
    pink: "bg-pink-500",
    lime: "bg-lime-500",
    yellow: "bg-yellow-500",
    amber: "bg-amber-500",
    orange: "bg-orange-500",
    teal: "bg-teal-500",
    cyan: "bg-cyan-500",
    white: "bg-white",
    black: "bg-black",
    sky: "bg-sky-500",
    emerald: "bg-emerald-500",
    violet: "bg-violet-500",
    fuchsia: "bg-fuchsia-500",
    rose: "bg-rose-500",
  };

  const fromVariants: { [key: Color]: string } = {
    primary: "bg-gradient-to-br from-primary",
    secondary: "bg-gradient-to-br from-secondary",
    base: "bg-gradient-to-br from-base-100",
    slate: "bg-gradient-to-br from-slate-500",
    gray: "bg-gradient-to-br from-gray-500",
    red: "bg-gradient-to-br from-red-500",
    green: "bg-gradient-to-br from-green-500",
    blue: "bg-gradient-to-br from-blue-500",
    indigo: "bg-gradient-to-br from-indigo-500",
    purple: "bg-gradient-to-br from-purple-500",
    pink: "bg-gradient-to-br from-pink-500",
    lime: "bg-gradient-to-br from-lime-500",
    yellow: "bg-gradient-to-br from-yellow-500",
    amber: "bg-gradient-to-br from-amber-500",
    orange: "bg-gradient-to-br from-orange-500",
    teal: "bg-gradient-to-br from-teal-500",
    cyan: "bg-gradient-to-br from-cyan-500",
    white: "bg-gradient-to-br from-white",
    black: "bg-gradient-to-br from-black",
    sky: "bg-gradient-to-br from-sky-500",
    emerald: "bg-gradient-to-br from-emerald-500",
    violet: "bg-gradient-to-br from-violet-500",
    fuchsia: "bg-gradient-to-br from-fuchsia-500",
    rose: "bg-gradient-to-br from-rose-500",
  };

  const toVariants: { [key: Color]: string } = {
    primary: "to-primary",
    secondary: "to-secondary",
    base: "to-base-100",
    slate: "to-slate-500",
    gray: "to-gray-500",
    red: "to-red-500",
    green: "to-green-500",
    blue: "to-blue-500",
    indigo: "to-indigo-500",
    purple: "to-purple-500",
    pink: "to-pink-500",
    lime: "to-lime-500",
    yellow: "to-yellow-500",
    amber: "to-amber-500",
    orange: "to-orange-500",
    teal: "to-teal-500",
    cyan: "to-cyan-500",
    white: "to-white",
    black: "to-black",
    sky: "to-sky-500",
    emerald: "to-emerald-500",
    violet: "to-violet-500",
    fuchsia: "to-fuchsia-500",
    rose: "to-rose-500",
  };

  const { size, color, icon, href, children }: AppIconProps = $props();
</script>

<button
  class="mask mask-squircle hover:scale-105 active:scale-95 transition-all cursor-pointer"
  class:app-icon_small={size === "small"}
  class:app-icon_medium={size === "medium"}
  class:app-icon_large={size === "large"}
  onclick={() => href && browser && window.location.assign(href)}
>
  <div
    class={`w-full relative h-full flex justify-center items-center font-bold ${typeof color === "string" ? plainBackgroundVariants[color] : `${fromVariants[color.from]} ${toVariants[color.to]}`}`}
  >
    {#if icon}
      <iconify-icon {icon} class="z-20"></iconify-icon>
      <iconify-icon {icon} class="absolute translate-x-1 translate-y-1 text-black z-1 blur-sm"></iconify-icon>
    {:else if children}
      {@render children()}
    {/if}

  </div>
</button>

<style type="postcss">
  .app-icon_small {
    @apply w-12 h-12 min-w-12 min-h-12;
    @apply text-lg;
  }

  .app-icon_medium {
    @apply w-24 h-24 min-w-24 min-h-24;
    @apply text-5xl;
  }

  .app-icon_large {
    @apply w-52 h-52 min-w-52 min-h-52;
    @apply text-8xl;
  }
</style>
