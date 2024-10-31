<script lang="ts">
    import AppIcon from '$lib/components/AppIcon/AppIcon.svelte';
    import Logo from "$lib/components/Logo.svelte";
    import Time, { dayjs } from "svelte-time";
    import "dayjs/locale/fr";
    import { apps } from '$lib/apps';

    dayjs.locale("fr");
    let date = $state(new Date());

    $effect(() => {
        const interval = setInterval(() => {
            date = new Date();
        }, 1000);

        return () => clearInterval(interval);
    })

    const { data, children } = $props();
  </script>
  
  <div class="container mx-auto h-full p-4 flex flex-col">
    <div class="flex gap-4 items-center">
        <Logo size="small" />
        <div
            class="card card-compact sm:card-normal bg-base-100 shadow-xl flex flex-row items-center justify-center md:justify-between px-4 grow text-sm h-full"
        >
            <div class="hidden md:block">  
                Bienvenue, {data.personnel.firstName}
                {data.personnel.lastName.toUpperCase()} [{data.personnel.emsRole}]
            </div>
            <div class="font-bold">
                <Time timestamp={date} format="dddd DD MMMM HH:mm:ss"  />
            </div>
        </div>
        <div class="dropdown dropdown-end">
          <div tabIndex="0" role="button" class="m-1"><AppIcon size="small" color="base" icon="ri:apps-2-fill" /></div>
          <ul tabIndex="0" class="menu dropdown-content bg-base-100 rounded-box z-10 p-2 shadow min-w-60">
            {#each apps as { color, icon, name, href }}
                <li>
                    <a {href}>
                        <AppIcon size="small" {color} {icon} {href} />
                        <span>{name}</span>
                    </a>
                </li>
            {/each}
          </ul>
        </div>
    </div>
    <div class="card card-compact sm:card-normal bg-base-100 bg-opacity-70 shadow-xl p-8 mt-4 grow">
        {@render children()}
    </div>
  </div>