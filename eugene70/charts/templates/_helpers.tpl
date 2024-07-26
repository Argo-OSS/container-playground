{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "helper.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create the name for the chart.
*/}}
{{- define "helper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Create labels common for all resources.
*/}}
{{- define "helper.labels" -}}
helm.sh/chart: {{ include "helper.chart" . }}
{{ include "helper.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- if .Values.nameOverride }}
app.kubernetes.io/name: {{ .Values.nameOverride | quote }}
{{- else }}
app.kubernetes.io/name: {{ include "helper.name" . | quote }}
{{- end }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end -}}

{{/*
Create labels specific for selector.
*/}}
{{- define "helper.selectorLabels" -}}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/name: {{ include "helper.name" . | quote }}
{{- end -}}

{{/*
Expand the chart name.
*/}}
{{- define "helper.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
