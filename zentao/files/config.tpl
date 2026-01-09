{{- if .Values.cache.enabled }}
  ZT_CACHE_ENABLE: "true"
  ZT_CACHE_DRIVER: {{ if or .Values.redis.enabled (and (not .Values.redis.enabled) .Values.redis.auth.host) }}"redis"{{ else }}"apcu"{{ end }}
  ZT_CACHE_SCOPE: {{ .Values.cache.scope | default "private" }}
  ZT_CACHE_NAMESPACE: {{ .Values.cache.namespace | default .Release.Name }}
  ZT_CACHE_LIFETIME: {{ .Values.cache.lifetime | default "0" | quote }}
{{- end }}
