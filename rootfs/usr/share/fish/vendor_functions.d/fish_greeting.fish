#!/usr/bin/fish
#shellcheck disable=all

function fish_greeting
	if test -d "$HOME"
		if test ! -e "$HOME"/.local/share/.motdcheck
			if test -x "/usr/share/firstboot/rolls.md"
				glow /usr/share/firstboot/rolls.md
			end
		end
	end

	if set -q fish_private_mode
		echo "fish is running in private mode, history will not be persisted."
	end
end
