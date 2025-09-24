{{/*
앱 이름
*/}}
{{- define "myapp.name" -}}
{{- .Values.appName | default "my-app" }}
{{- end }}

{{/*
Pod 선택을 위한 라벨 (deployment와 service가 매칭하는 라벨)
*/}}
{{- define "myapp.selectorLabels" -}}
app: {{ include "myapp.name" . }}
version: {{ .Values.appVersion | default "v1" }}
{{- end }}
