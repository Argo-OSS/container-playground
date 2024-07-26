{{- define "jcy0308.name" -}}
{{- .Chart.Name | lower -}}
{{- end }}

{{- define "jcy0308.fullname" -}}
{{- .Release.Name | lower }}-{{ .Chart.Name | lower }}
{{- end }}

{{- define "jcy0308.labels" -}}
app.kubernetes.io/name: {{ include "jcy0308.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
