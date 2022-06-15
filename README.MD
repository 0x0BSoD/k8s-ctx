# k8s-ctx

A tmux widget to display the current Kubernetes context

<img src='img/1.png' alt='stage' width=50%>
<img src='img/2.png' alt='prod' width=50%>

### Usage with tpm

Add to *tmux.conf*
```
# add plugin
set -g @plugin '0x0BSoD/k8s-ctx'

# configuration
set -g @k8s_ctx_envs "stage,prod,okd"
set -g @k8s_ctx_icons "🧻,🔞,🧰"

# adding to status bar
set -g status-right "#{k8s_ctx}"
```

`k8s_ctx_envs` -> part of env name for matching ( \*$k8s_ctx_envs\* )

`k8s_ctx_icons` -> icons, icon index matches k8s_ctx_envs index 