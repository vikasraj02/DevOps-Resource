{{- define "log-generator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "log-generator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (include "log-generator.name" .) .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end -}}

