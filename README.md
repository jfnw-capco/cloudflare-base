[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <img alt="delineate.io" src="https://github.com/delineateio/.github/blob/master/assets/logo.png?raw=true" height="75" />
  <h2 align="center">delineate.io</h2>
  <p align="center">portray or describe (something) precisely.</p>

  <h3 align="center">Platform Cloudflare</h3>

  <p align="center">
    Automated configuration of a domain managed by Cloudflare with a baseline security and performance best practices configuration
    <br />
    <a href="https://github.com/delineateio/platform-cloudflare"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/delineateio/platform-cloudflare/issues">Report Bug</a>
    ·
    <a href="https://github.com/delineateio/platform-cloudflare/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This project enables consistent, repeatable and controlled management of the security and performance configuration for domains that are managed in Cloudflare.  These configurations include but are not limited to the following:

* Enable all traffic to use HTTPS using TLS 1.3 and origin pulls
* Enable restrictions on sources of traffic to a specific IP and countries
* Enable WAF and configure the WAF rule sets (e.g. OWASP groups)
* Enable a sensible rate limiting threshold by source IP address
* Enable a number of Cloudflare performance options (e.g. Argo, Brotli, Mirage)

### Built With

* [Terraform](https://www.terraform.io/)
* [Terraform Cloudflare Provider](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)
* [Pre-commit](https://pre-commit.com/)

### Prerequisites

#### Remote Prerequisites

##### Cloudflare Token

A Cloudflare token must be granted the following permissions:

* Account:Billing:Edit
* Zone:DNS:Read
* Zone:Firewall Services:Edit
* Zone:Zone Settings:Edit
* Zone:Zone:Edit

##### GCS & GCP Service Account

The configuration uses a [gcs backend](https://www.terraform.io/docs/language/settings/backends/gcs.html), therefore it is necessary for a `gcs` bucket to be available for stporing the remote `terraform` state.

In addition a GCP service account is required with the following roles assigned:

* Storage Objects Admin

#### Local Prerequisites

The following are recommendations only and `pyenv` and `tfenv` are not required.

The `python` virtual environment can be created by any alternative and `terraform` could be installed directly with the versions shown below.

```shell
# pyenv or an alternative
brew install pyenv
pyenv install 3.9.1

# tfenv or alternative
brew install tfenv
tfenv install 0.15.3
tfenv use 0.15.3

# tfscan is used in git hooks
brew install tfscan
```

<!-- GETTING STARTED -->
### Getting Started

To get a local copy up and running follow these simple steps.

```shell
# create a venv
pyenv virtualenv 3.9.1 .venv-platform-cloudflare-3.9.1

# upgrade pip
python -m pip install --upgrade pip

# installs the requirements
pip install -r requirements.txt

# install pre-commit hooks
pre-commit install

# set the required provider env variables
export GOOGLE_APPLICATION_CREDENTIALS= # path to credentials file
export CLOUDFLARE_API_TOKEN= # cloudflare token
```

<!-- USAGE EXAMPLES -->
## Usage

After changing int the `./ops` directory the following commands can be used used

```shell
DOMAIN=delineate.io

terraform init \
  -backend-config="bucket=io-delineate-terraform" \
  -backend-config="prefix=cloudflare/${DOMAIN}" ./ops

# plan changes - vars file
terraform plan -var-file="./ops/config/${DOMAIN}.tfvars" -out=plan ./ops

# applies the changes
terraform apply -auto-approve plan

# destroy the changes
terraform destroy -var-file="./ops/config/${DOMAIN}.tfvars" -auto-approve ./ops
```

_For more examples, please refer to the [Documentation](https://example.com)_

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/delineateio/platform-cloudflare/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

If you would like to contribute to any Capco Digital OSS projects please read:

* [Code of Conduct](https://github.com/delineateio/.github/blob/master/CODE_OF_CONDUCT.md)
* [Contributing Guidelines](https://github.com/delineateio/.github/blob/master/CONTRIBUTING.md)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [Best README Template](https://github.com/othneildrew/Best-README-Template/blob/master/README.md)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/delineateio/platform-cloudflare.svg?style=for-the-badge
[contributors-url]: https://github.com/delineateio/platform-cloudflare/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/delineateio/platform-cloudflare.svg?style=for-the-badge
[forks-url]: https://github.com/delineateio/platform-cloudflare/network/members
[stars-shield]: https://img.shields.io/github/stars/delineateio/platform-cloudflare.svg?style=for-the-badge
[stars-url]: https://github.com/delineateio/platform-cloudflare/stargazers
[issues-shield]: https://img.shields.io/github/issues/delineateio/platform-cloudflare.svg?style=for-the-badge
[issues-url]: https://github.com/delineateio/platform-cloudflare/issues
[license-shield]: https://img.shields.io/github/license/delineateio/platform-cloudflare.svg?style=for-the-badge
[license-url]: https://github.com/delineateio/platform-cloudflare/blob/master/LICENSE
