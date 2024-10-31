import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

console.log("CACA");

async function main() {
	console.log("Seeding database...");

	const passwordHash = await Bun.password.hash("admin", {
		memoryCost: 19456,
		timeCost: 2,
		algorithm: "argon2id",
	});

	const user = await prisma.personnel.create({
		data: {
			username: "admin",
			password: passwordHash,
			boRole: "SUPERADMIN",
			emsRole: "Administrator",
			firstName: "Admin",
			lastName: "Admin",
			phone: "555-5555-555",
		},
	});

	console.log("Created user:", user);
}

main()
	.then(async () => {
		await prisma.$disconnect();
	})
	.catch(async (e) => {
		console.error(e);
		await prisma.$disconnect();
		process.exit(1);
	});
