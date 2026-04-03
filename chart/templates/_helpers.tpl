{{/*
Expand the name of the localedit
*/}}
{{- define "localedit.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "localedit.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "localedit.labels" -}}
helm.sh/chart: {{ include "localedit.chart" . }}
{{ include "localedit.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "localedit.selectorLabels" -}}
app.kubernetes.io/name: {{ include "localedit.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
