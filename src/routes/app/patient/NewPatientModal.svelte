<script lang="ts">
  import { superForm } from "sveltekit-superforms";
  import type { PageData } from "./$types";
  import { NEW_PATIENT_MODAL_ID } from "./const";

  const { form: propForm }: { form: PageData["form"] } = $props();
  const { form, errors, enhance, delayed } = superForm(propForm);
</script>

<input type="checkbox" id={NEW_PATIENT_MODAL_ID} class="modal-toggle" />
<div role="dialog" class="modal">
  <div class="modal-box">
    <h3 class="text-lg font-bold">Ajouter un patient</h3>
    <form
      class="mt-2 flex flex-col"
      method="POST"
      action="?/add_patient"
      use:enhance
    >
      <label class="form-control">
        <div class="label">
          <span class="label-text">Identité</span>
        </div>
        <div class="flex gap-2">
          <input
            type="text"
            name="firstname"
            class="input input-bordered basis-1/2"
            class:input-error={$errors.firstname}
            bind:value={$form.firstname}
            placeholder="Prénom"
          />
          <input
            type="text"
            name="lastname"
            class="input input-bordered basis-1/2"
            class:input-error={$errors.lastname}
            bind:value={$form.lastname}
            placeholder="Nom"
          />
        </div>
        <div class="flex gap-2">
          <div class="label text-error basis-1/2">
            <span class="label-text-alt text-error">{$errors.firstname}</span>
          </div>
          <div class="label text-error basis-1/2">
            <span class="label-text-alt text-error">{$errors.lastname}</span>
          </div>
        </div>
      </label>
      <label class="form-control">
        <div class="label">
          <span class="label-text">Date de naissance</span>
        </div>
        <div>
          <input
            type="text"
            name="dateOfBirth"
            class="input input-bordered w-full"
            class:input-error={$errors.dateOfBirth}
            bind:value={$form.dateOfBirth}
            placeholder="01/01/2001"
          />
        </div>
        <div class="label text-error">
          <span class="label-text-alt text-error">{$errors.dateOfBirth}</span>
        </div>
      </label>
      <label class="form-control">
        <div class="label">
          <span class="label-text">N° de carte vitale</span>
        </div>
        <div>
          <input
            type="number"
            name="vitalCardNumber"
            class="input input-bordered w-full"
            class:input-error={$errors.vitalCardNumber}
            bind:value={$form.vitalCardNumber}
            placeholder="12345"
          />
        </div>
        <div class="label text-error">
          <span class="label-text-alt text-error"
            >{$errors.vitalCardNumber}</span
          >
        </div>
      </label>
      <label class="form-control">
        <div class="label">
          <span class="label-text">N° de téléphone</span>
          <span class="label-text-alt">(optional)</span>
        </div>
        <div>
          <input
            type="text"
            name="phone"
            class="input input-bordered w-full"
            class:input-error={$errors.phone}
            bind:value={$form.phone}
            placeholder="555-123-1234"
          />
        </div>
        <div class="label text-error">
          <span class="label-text-alt text-error">{$errors.phone}</span>
        </div>
      </label>
      <div class="mt-1">
        <span class="label-text ml-1">Informations supplémentaires</span>
        <div class="form-control mt-2 p-4 bg-base-200 rounded-btn">
          <label class="label cursor-pointer">
            <span class="label-text">Membre de la LSPD</span>
            <input
              type="checkbox"
              bind:checked={$form.isLSPD}
              name="isLSPD"
              class="checkbox"
            />
          </label>
          {#if $form.isLSPD}
            <label class="form-control">
              <div class="label">
                <span class="label-text">N° de matricule</span>
              </div>
              <div>
                <input
                  type="number"
                  name="lspdNumber"
                  class="input input-bordered w-full"
                  class:input-error={$errors.lspdNumber}
                  bind:value={$form.lspdNumber}
                  placeholder="01"
                />
              </div>
              <div class="label text-error">
                <span class="label-text-alt text-error"
                  >{$errors.lspdNumber}</span
                >
              </div>
            </label>
          {/if}
        </div>
      </div>
      <div class="modal-action">
        <label for={NEW_PATIENT_MODAL_ID} class="btn btn-neutral">
          Annuler
        </label>
        <button class="btn btn-primary">
          {#if $delayed}<span class="loading loading-spinner"></span>{/if}
          Enregistrer
        </button>
      </div>
    </form>
  </div>
</div>
