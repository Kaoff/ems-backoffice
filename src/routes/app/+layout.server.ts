import { redirect } from "@sveltejs/kit";
import type { LayoutServerLoad } from "./$types";

export const load: LayoutServerLoad = async (event) => {
	if (event.locals.personnel === null || event.locals.session === null) {
		return redirect(302, "/login");
	}

	return {
		personnel: event.locals.personnel,
	};
};