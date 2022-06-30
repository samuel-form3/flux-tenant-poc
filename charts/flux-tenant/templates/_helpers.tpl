{{/*
Required values
*/}}
{{- define "environment"  -}}
    {{- required "Environment is required" .Values.environment -}}
{{- end }}
{{- define "stackName"  -}}
    {{- required "Stack name is required" .Values.stackName -}}
{{- end }}
{{- define "cloudProvider"  -}}
    {{- required "Cloud provider is required" .Values.cloudProvider -}}
{{- end }}
{{- define "region"  -}}
    {{- required "Region is required" .Values.region -}}
{{- end }}
{{- define "tenantName"  -}}
    {{- required "Tenant name is required" .Values.tenantName -}}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "flux-tenant.name" -}}
    {{- printf "flux-%s" (include "tenantName" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "defaultFluxManifestPath" -}}
{{- printf "./flux/promoted/%s/%s/%s"
    (include "environment" .)
    (include "stackName" .)
    (include "cloudProvider" .)
-}}
{{- end }}

{{- define "defaultFluxConfigPath" -}}
{{- printf "./flux/config/%s/%s/%s"
    (include "environment" .)
    (include "stackName" .)
    (include "cloudProvider" .)
-}}
{{- end }}

{{- define "toPorts" -}}
{{- if .ports -}}
toPorts:
  - ports:
    {{- range $p := .ports }}
    - port: {{ $p | quote }}
    {{- end }}
{{- end -}}
{{- end }}
