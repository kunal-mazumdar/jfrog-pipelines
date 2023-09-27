{{- define "standard.build.step" }}
{{- $ := . }}
{{- $buildCommand := ternary "mvn install -DskipTests" "npm run build" (eq $.runtimeName "java") }}
      - name: build
        type: Bash
        configuration:
          inputResources:
            - name: {{ $.gitResource }}
        execution:
          onExecute:
            - pushd ${res_{{ $.gitResource }}_resourcePath}
            - {{ $buildCommand }}
{{- end }}