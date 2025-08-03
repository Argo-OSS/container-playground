{{- define "my-chart.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "my-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
