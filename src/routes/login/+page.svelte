<script lang="ts">
  import Logo from '$lib/components/Logo.svelte';

  const { data } = $props();
</script>

<div
  class="container mx-auto prose flex flex-col items-center justify-center p-8 h-full"
>
  <Logo />
  <form class="mt-8" method="POST" action="?/login">
    <div
      class="card card-compact sm:card-normal bg-base-100 w-80 sm:w-96 shadow-xl flex flex-col"
    >
      <div class="card-body">
        <input
          type="text"
          placeholder="Username"
          name="username"
          class="input input-bordered w-full"
        />
        <input
          type="password"
          placeholder="Password"
          name="password"
          class="input input-bordered w-full"
        />
        <div class="card-actions justify-center mt-4">
          <button class="btn btn-primary w-full">Se connecter</button>
          <span class="link link-primary">Créer un compte</span>
        </div>
      </div>
    </div>
  </form>
</div>
