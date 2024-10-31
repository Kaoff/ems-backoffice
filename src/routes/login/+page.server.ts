import { setSessionTokenCookie } from "$lib/api/cookies";
import { createSession, generateSessionToken } from "$lib/api/sessions";
import prisma from "$lib/prisma";
import { redirect } from "@sveltejs/kit";
import type { PageServerLoad } from "../$types";
import type { RequestEvent } from "./$types";

export const load: PageServerLoad = async (event) => {
	if (event.locals.session !== null && event.locals.personnel !== null) {
		return redirect(302, "/");
	}
};

const login = async (event: RequestEvent) => {
	const formData = await event.request.formData();
	const username = formData.get("username") as string;
	const password = formData.get("password") as string;

	if (typeof username !== "string" || typeof password !== "string") {
		return {
			status: 400,
			body: { message: "Invalid form data" },
		};
	}

	if (username === "" || password === "") {
		return {
			status: 400,
			body: { message: "Username and password can't be empty" },
		};
	}

	const user = await prisma.personnel.findUnique({
		where: { username },
	});

	if (user === null) {
		return {
			status: 401,
			body: { message: "Invalid username or password" },
		};
	}

	const passwordHash = user.password;
	const validPassword = await Bun.password.verify(password, passwordHash);

	if (!validPassword) {
		return {
			status: 401,
			body: { message: "Invalid username or password" },
		};
	}

	const sessionToken = generateSessionToken();
	const session = await createSession(sessionToken, user.id);
	setSessionTokenCookie(event, sessionToken, session.expiresAt);

	return redirect(302, "/");
};

export const actions = {
	login,
};
