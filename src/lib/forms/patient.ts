import { z } from "zod";

export const patientSchema = z
	.object({
		firstname: z.string().min(1, "Le prénom est requis."),
		lastname: z.string().min(1, "Le nom est requis."),
		dateOfBirth: z.string().refine(
			(data) => {
				const regex = new RegExp(
					/(^0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/(\d{4}$)/,
				);
				return regex.test(data);
			},
			{
				message: "La date de naissance doit être au format 'JJ/MM/AAAA'.",
			},
		),
		vitalCardNumber: z.number().min(1, "Le numéro de carte vitale est requis."),
		phone: z
			.string()
			.refine((data) => /(555|777)-([0-9]{3})-([0-9]{4})/.test(data), {
				message:
					"Le numéro de téléphone doit être au format '555-123-4567' ou '777-123-4567'.",
			}),
		isLSPD: z.boolean(),
		lspdNumber: z.number(),
	})
	.refine((data) => !data.isLSPD || data.lspdNumber > 0, {
		message: "Le numéro LSPD est requis.",
		path: ["lspdNumber"],
	});
