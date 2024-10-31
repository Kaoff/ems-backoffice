import { redirect } from "@sveltejs/kit";
import type { PageServerLoad } from "./$types";

export const load: PageServerLoad = async (event) => {
	if (event.locals.personnel === null || event.locals.session === null) {
		return redirect(302, "/login");
	}

	return redirect(302, "/app");
};