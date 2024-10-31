import type { Color } from "$lib/types/colors";
import type { Snippet } from "svelte";

export type AppIconProps = {
	size: "small" | "medium" | "large";
	color: Color | { from: Color; to: Color };
	icon?: string;
	children?: Snippet;
	href?: string;
};