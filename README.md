# One chart to rule them all

Fork of [https://github.com/gimlet-io/onechart](https://github.com/gimlet-io/onechart)

Highly opinionated Helm Chart for our applications needs.

Because no-one, espacially us, can remember the Kubernetes yaml syntax.

## Introduction

This [Helm](https://helm.sh/) chart installs `Odoo` in a [Kubernetes](https://kubernetes.io/) cluster.

> [!IMPORTANT]
> This helm chart is designed for @IMIO specific needs and is not intended to resolve all use cases.
> But we are open to contributions and suggestions to improve this helm chart.
> This Helm chart runs OneChart forked version 0.73.0 and customized for our needs.

## Getting started

OneChart is a generic Helm Chart for web applications.
The idea is that most Kubernetes manifest look alike, only very few parts actually change.

### Pull Helm release

```bash
helm repo add imio https://imio.github.io/helm-charts
helm repo update
```

### Configure the chart

The following items can be set via `--set` flag during installation
or configured by editing the `values.yaml` directly (need to download the chart first).

See the [values.yaml](values.yaml) file for more information.

Set your image name and version, the boilerplate is generated.

The example below deploys your application image, sets environment variables
and configures the Kubernetes Ingress domain name:

```bash
helm repo add onechart https://chart.onechart.dev
helm template my-release onechart/onechart -f values.yaml

# values.yaml
image:
  repository: my-app
  tag: fd803fc
vars:
  VAR_1: "value 1"
  VAR_2: "value 2"
ingress:
  annotations:
    kubernetes.io/ingress.class: nginx
  host: my-app.mycompany.com
```

### Install the chart

```bash
helm install [RELEASE_NAME] imio/onechart
```

or by cloning this repository:

```bash
git clone https://github.com/imio/helm-onechart.git
cd helm-onechart
helm repo update
helm dep up
helm upgrade onechart . -f values.yaml --namespace onechart --create-namespace --install
```

## Contributing

Feel free to contribute by making a [pull request](https://github.com/imio/helm-onechart/pull/new/master).

Please read the official [Helm Contribution Guide](https://github.com/helm/charts/blob/master/CONTRIBUTING.md)
from Helm for more information on how you can contribute to this Chart.
