{{- if eq .Node.Role "worker" }}
apiVersion: v1alpha1
kind: VolumeConfig
name: EPHEMERAL
provisioning:
  grow: false
  maxSize: 100GiB
---
apiVersion: v1alpha1
kind: UserVolumeConfig
name: longhorn
provisioning:
  diskSelector:
    match: system_disk
  grow: false
  minSize: 800GiB
  maxSize: 800GiB
{{- end }}
