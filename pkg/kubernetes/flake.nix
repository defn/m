{
  inputs = {
    kubectl.url = github:defn/m/pkg-kubectl-1.25.8-3?dir=pkg/kubectl;
    k3d.url = github:defn/m/pkg-k3d-5.4.9-3?dir=pkg/k3d;
    k9s.url = github:defn/m/pkg-k9s-0.27.3-3?dir=pkg/k9s;
    helm.url = github:defn/m/pkg-helm-3.11.2-3?dir=pkg/helm;
    kustomize.url = github:defn/m/pkg-kustomize-5.0.1-3?dir=pkg/kustomize;
    stern.url = github:defn/m/pkg-stern-1.24.0-3?dir=pkg/stern;
    argo.url = github:defn/m/pkg-argo-3.4.6-4?dir=pkg/argo;
    argocd.url = github:defn/m/pkg-argocd-2.6.7-4?dir=pkg/argocd;
    tkn.url = github:defn/m/pkg-tkn-0.30.0-4?dir=pkg/tkn;
    kn.url = github:defn/m/pkg-kn-1.9.2-3?dir=pkg/kn;
    vcluster.url = github:defn/m/pkg-vcluster-0.14.2-3?dir=pkg/vcluster;
    kubevirt.url = github:defn/m/pkg-kubevirt-0.59.0-3?dir=pkg/kubevirt;
  };

  outputs = inputs: inputs.kubectl.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs =
        let
          flakeInputs = [
            inputs.k3d.defaultPackage.${ctx.system}
            inputs.kubectl.defaultPackage.${ctx.system}
            inputs.k9s.defaultPackage.${ctx.system}
            inputs.helm.defaultPackage.${ctx.system}
            inputs.kustomize.defaultPackage.${ctx.system}
            inputs.argocd.defaultPackage.${ctx.system}
            inputs.argo.defaultPackage.${ctx.system}
            inputs.tkn.defaultPackage.${ctx.system}
            inputs.kn.defaultPackage.${ctx.system}
            inputs.vcluster.defaultPackage.${ctx.system}
          ];
        in
        flakeInputs;
    };
  };
}
