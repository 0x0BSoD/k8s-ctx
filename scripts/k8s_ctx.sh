CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

k8s_ctx_envs_default='stage,prod'
k8s_ctx_envs_option="@k8s_ctx_envs"

k8s_ctx_icons_default='🧻,🔞'
k8s_ctx_icons_option="@k8s_ctx_icons"

function get_ctx {
	if command_exists 'kubectl'; then
		ctx=$(kubectl config get-contexts | grep \* | awk '{ gsub(/[ ]+/," "); print $2 }')

		IFS=',' read -ra envs <<< "$1"
		IFS=',' read -ra icons <<< "$2"

		for e in "${!envs[@]}"; do
			if [[ $ctx == *"${envs[$e]}"* ]]; then
				echo "${ctx} ${icons[$e]}"
				exit 0
			fi
		done
		echo "${ctx}"
	fi
}


function main() {
	printf "$(get_ctx $(get_tmux_option $k8s_ctx_envs_option $k8s_ctx_envs_default) $(get_tmux_option $k8s_ctx_icons_option $k8s_ctx_icons_default))"
}

main