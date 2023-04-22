package c

env: (#Transform & {
	transformer: #TransformVCluster

	inputs: {
		"global-vc0": {
			instance_types: []
			parent: env.global
		}

		[N=string]: {
			bootstrap: {
				"cert-manager": [1, ""]
			}
		}
	}
}).outputs

env: (#Transform & {
	transformer: #TransformK3D

	inputs: {
		// control is the control plane, used by the operator.
		control: {
			bootstrap: {
				"cert-manager": [1, ""]
				"pod-identity-webhook": [10, ""]
				"external-secrets-operator": [10, ""]
				"k3d-control-secrets-store": [20, ""]
			}
		}

		// global is the global control plane, used by all machines.
		global: {
			bootstrap: {
				"kyverno": [1, "", "ServerSideApply=true"]
				"velero": [1, ""]
				"cert-manager": [2, ""]
				"pod-identity-webhook": [10, ""]
				"external-secrets-operator": [10, ""]
				"k3d-global-secrets-store": [20, ""]
				"defn-shared": [30, ""]
				"external-dns": [30, ""]
				"argo-workflows": [40, "argo-workflows", "CreateNamespace=true"]
				"tfo": [40, ""]
				"knative": [40, ""]
				"kourier": [40, ""]
				"defn": [40, ""]
				"caddy": [50, ""]
				"global-vc0": [60, ""]
				"hello": [60, ""]
				"coder": [60, ""]
				"argo-cd": [1000, ""]
			}
		}
	}
}).outputs

bootstrap: (#Transform & {
	transformer: #TransformEnvToBootstrapMachine

	inputs: {
		for _env_name, _env in env {
			"\(_env_name)": {
				name:      _env_name
				type:      _env.type
				bootstrap: _env.bootstrap
			}
		}
	}
}).outputs

kustomize: (#Transform & {
	transformer: #TransformKustomizeVCluster

	inputs: {
		"global-vc0": {
			vc_machine: "global"
		}
	}
}).outputs

kustomize: (#Transform & {
	transformer: #TransformEnvToAnyResource

	inputs: {
		for _env_name, _env in env {
			"\(_env_name)": {
				name:  _env_name
				type:  _env.type
				label: "\(type)-\(name)"
			}
		}
	}
}).outputs

kustomize: (#Transform & {
	transformer: #TransformEnvToSecretStore

	inputs: {
		for _env_name, _env in env {
			"\(_env_name)": {
				name:  _env_name
				type:  _env.type
				label: "\(type)-\(name)-secrets-store"
			}
		}
	}
}).outputs
