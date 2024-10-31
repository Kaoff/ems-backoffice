import prisma from "$lib/prisma";
import type { Personnel } from "@prisma/client";

export const hashPassword = async (password: string): Promise<string> => {
	const passwordHash = await Bun.password.hash(password, {
		memoryCost: 19456,
		timeCost: 2,
		algorithm: "argon2id",
	});
	return passwordHash;
};

export const createPersonnel = async (
	firstName: string,
	lastName: string,
	phone: string,
	username: string,
	password: string,
): Promise<Personnel> => {
	const passwordHash = await hashPassword(password);
	const personnel = await prisma.personnel.create({
		data: {
			username,
			firstName,
			lastName,
			phone,
			password: passwordHash,
			boRole: "USER",
			emsRole: "TBD",
		},
	});
	return personnel;
};