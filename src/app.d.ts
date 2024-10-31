// See https://kit.svelte.dev/docs/types#app

import type { Personnel, Session } from "@prisma/client";

// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			personnel: Personnel | null;
			session: Session | null;
		}
		// interface PageData {}
		// interface PageState {}
		// interface Platform {}
	}
}

// biome-ignore lint/complexity/noUselessEmptyExport: <explanation>
export {};
