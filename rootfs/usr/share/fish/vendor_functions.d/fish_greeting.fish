#!/usr/bin/fish
#shellcheck disable=all

function fish_greeting
	if test -d "$HOME"
		if test ! -e "$HOME"/.local/share/.motdcheck
			if test -x "/usr/share/celestite/celestite.md"
				glow /usr/share/celestite/celestite.md
			end
		end
	end

	if set -q fish_private_mode
		echo "fish is running in private mode, history will not be persisted."
	end
end
