{{- define "iamhansko.name" -}}
{{- .Chart.Name | lower -}}
{{- end }}

{{- define "iamhansko.fullname" -}}
{{- .Release.Name | lower }}-{{ .Chart.Name | lower }}
{{- end }}

{{- define "iamhansko.labels" -}}
app.kubernetes.io/name: {{ include "iamhansko.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
