import prisma from "$lib/prisma";
import { redirect } from "@sveltejs/kit";
import type { PageServerLoad, RequestEvent } from "./$types";
import { superValidate } from "sveltekit-superforms";
import { zod } from "sveltekit-superforms/adapters";
import { patientSchema } from "$lib/forms/patient";

const addPatient = async ({ request }: RequestEvent) => {
	const form = await superValidate(request, zod(patientSchema));

	if (!form.valid) {
		return {
			status: 400,
			form,
		};
	}

	await prisma.patient.create({
		data: {
			...form.data,
			dateOfBirth: new Date(form.data.dateOfBirth),
		},
	});
};

export const actions = {
	add_patient: addPatient,
};

export const load: PageServerLoad = async (event) => {
	if (event.locals.personnel === null || event.locals.session === null) {
		return redirect(302, "/login");
	}

	const patientList = await prisma.patient.findMany();

	const form = await superValidate(zod(patientSchema));

	return {
		patientList,
		form,
	};
};