<script lang="ts">
import "iconify-icon";
import { browser } from "$app/environment";
import Time from "svelte-time/Time.svelte";
import NewPatientModal from "./NewPatientModal.svelte";
import { NEW_PATIENT_MODAL_ID } from "./const";

// const mockedPatients: Prisma.PatientCreateInput[] = [
//   {
//     uuid: "1",
//     isLSPD: false,
//     firstname: "John",
//     lastname: "Doe",
//     dateOfBirth: new Date("2000-01-01"),
//     vitalCardNumber: 12345,
//     phone: "555-555-5555",
//   },
//   {
//     uuid: "2",
//     isLSPD: true,
//     firstname: "Jane",
//     lastname: "Doe",
//     dateOfBirth: new Date("2000-01-01"),
//     vitalCardNumber: 12346,
//     phone: "777-777-7777",
//     lspdNumber: 12,
//   },
// ];

const { data } = $props();
</script>

<div class="flex flex-col gap-4">
  <div class="flex justify-between items-center w-full">
    <h2 class="text-2xl font-bold">Patients</h2>
    <div>
      <label for={NEW_PATIENT_MODAL_ID} class="btn btn-primary">
        <iconify-icon icon="ri:add-large-fill"></iconify-icon>
        Nouveau
      </label>
    </div>
  </div>
  <div class="overflow-x-auto">
    <table class="table">
      <thead>
        <tr class="border-b-white border-b-2">
          <th>Identité</th>
          <th>Date de naissance</th>
          <th>N° de carte vitale</th>
          <th>N° de téléphone</th>
          <th>LSPD ?</th>
          <th align="right">Actions</th>
        </tr>
      </thead>
      <tbody>
        {#each data.patientList as patient}
          <tr
            class="border-b-white bg-base-100 bg-opacity-0 hover:bg-opacity-10 cursor-pointer"
            onclick={() =>
              browser && window.location.assign(`./${patient.uuid}`)}
          >
            <td>{patient.firstname} {patient.lastname}</td>
            <td><Time timestamp={patient.dateOfBirth} format="DD/MM/YYYY" /></td
            >
            <td>{patient.vitalCardNumber}</td>
            <td>{patient.phone}</td>
            <td>{patient.isLSPD ? `Oui (${patient.lspdNumber})` : "Non"}</td>
            <td align="right">
              <button class="btn btn-neutral">Voir</button>
              <button class="btn btn-error">Supprimer</button>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  </div>
  <!-- Modal -->
  <NewPatientModal form={data.form} />
</div>
