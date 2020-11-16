{{/* traefik container args  */}}
{{- define "traefik.args" }}
            - --entrypoints.web.address=:80
            - --entrypoints.websecure.address=:443
            - --entrypoints.ping.address=:10254
            - --ping.entrypoint=ping
            - --log.level=ERROR
            - --providers.kubernetescrd
{{- end }}
{{/* traefik container ports  */}}
{{- define "traefik.ports" }}
          - name: web
            containerPort: 80
          - name: websecure
            containerPort: 443
{{- end }}
{{/* traefik liveness probe  */}}
{{- define "traefik.liveness" }}
            failureThreshold: 3
            httpGet:
              path: /ping
              port: 10254
              scheme: HTTP
            initialDelaySeconds: 10
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 1
{{- end }}
{{/* traefik readiness probe  */}}
{{- define "traefik.readiness" }}
            failureThreshold: 3
            httpGet:
              path: /ping
              port: 10254
              scheme: HTTP
            periodSeconds: 10
            successThreshold: 1
            timeoutSeconds: 1
{{- end }}
