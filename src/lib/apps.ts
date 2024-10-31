import type { AppIconProps } from "./components/AppIcon/types";

type App = {
	icon: string;
	color: AppIconProps["color"];
	name: string;
	href: string;
};

export const apps: App[] = [
	{
		icon: "ri:user-2-fill",
		color: { from: "blue", to: "pink" },
		name: "Personnel",
		href: "/app/personnel",
	},
	{
		icon: "ri:file-user-fill",
		color: { from: "yellow", to: "amber" },
		name: "Patients",
		href: "/app/patient",
	},
	{
		icon: "ri:file-2-fill",
		color: { from: "orange", to: "red" },
		name: "Compte-rendu",
		href: "/app/report",
	},
	{
		icon: "ri:surgical-mask-fill",
		color: { from: "teal", to: "slate" },
		name: "Operation",
		href: "/app/operation",
	},
	{
		icon: "ri:money-dollar-circle-fill",
		color: { from: "emerald", to: "green" },
		name: "Factures",
		href: "/app/invoice",
	},
	{
		icon: "ri:police-badge-fill",
		color: { from: "cyan", to: "blue" },
		name: "Facture LSPD",
		href: "/app/lspd",
	},
	{
		icon: "ri:empathize-fill",
		color: { from: "purple", to: "violet" },
		name: "Accouchement",
		href: "/app/birth",
	},
	{
		icon: "ri:settings-3-fill",
		color: { from: "gray", to: "black" },
		name: "Paramètres",
		href: "/app/settings",
	},
];
