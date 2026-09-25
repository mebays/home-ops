apiVersion: v1alpha1
kind: KubeNodeConfig
labels:
  {{- if eq .Node.Role "worker" }}
  node.longhorn.io/create-default-disk: "true"
  {{- end }}
  {{- if contains "pi-kube-2" .Node.Host }}
  org.mebays/rpi-display: true
  {{- end }}
