{{/*
Expand the name of the chart.
*/}}
{{- define "expressjs-restapi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "expressjs-restapi.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Chart.Name .Values.image.tag | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}


{{- define "expressjs-restapi.fullhost" -}}
{{  printf "%s%s" (include "expressjs-restapi.fullname" .) ".ptcdevs.xounges.net" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "expressjs-restapi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "expressjs-restapi.labels" -}}
helm.sh/chart: {{ include "expressjs-restapi.chart" . }}
{{ include "expressjs-restapi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "expressjs-restapi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "expressjs-restapi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "expressjs-restapi.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "expressjs-restapi.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
