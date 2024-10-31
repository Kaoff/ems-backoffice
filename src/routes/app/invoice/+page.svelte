<script lang="ts">
    import "iconify-icon";

    const { data } = $props();
</script>

<div class="flex justify-between items-center w-full">
    <h2 class="text-2xl font-bold">Factures</h2>
    <div>
        <button class="btn btn-primary">
            <iconify-icon icon="ri:add-large-fill"></iconify-icon>
            Nouveau
        </button>
    </div>
</div>