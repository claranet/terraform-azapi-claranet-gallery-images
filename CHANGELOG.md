## 8.0.0 (2025-01-10)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** code upgrade for provider Azure AzAPI v2+ b522955
* **AZ-1088:** module v8 structure and updates 511018e

### Documentation

* **AZ-1088:** rework examples 68c1cad
* **AZ-1088:** rework examples 5dc4085

### Miscellaneous Chores

* apply suggestions 1cf7410
* **deps:** update dependency opentofu to v1.8.3 0aa66b7
* **deps:** update dependency opentofu to v1.8.4 42b73a2
* **deps:** update dependency opentofu to v1.8.6 e296cfa
* **deps:** update dependency opentofu to v1.8.7 a44a4f4
* **deps:** update dependency opentofu to v1.8.8 931b611
* **deps:** update dependency opentofu to v1.9.0 85f16bc
* **deps:** update dependency pre-commit to v4 08e9f5d
* **deps:** update dependency pre-commit to v4.0.1 efdab4e
* **deps:** update dependency tflint to v0.54.0 2db35b7
* **deps:** update dependency trivy to v0.56.1 6e93d58
* **deps:** update dependency trivy to v0.56.2 9124a32
* **deps:** update dependency trivy to v0.57.1 abda443
* **deps:** update dependency trivy to v0.58.0 5d4f40a
* **deps:** update dependency trivy to v0.58.1 1e3d71b
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 d422c80
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 f2b5f31
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 f0afa4c
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 6a71bef
* **deps:** update terraform azapi to v2 ed0fcf7
* **deps:** update tools ca25a14
* prepare for new examples structure bfdc7dd
* update examples structure 6eaff29

## 7.0.2 (2024-10-03)

### Documentation

* update README badge to use OpenTofu registry ccb6bfb

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.7.1 9c81429
* **deps:** update dependency opentofu to v1.7.2 2543046
* **deps:** update dependency opentofu to v1.7.3 b3c276e
* **deps:** update dependency opentofu to v1.8.0 f6ec74e
* **deps:** update dependency opentofu to v1.8.1 b77da77
* **deps:** update dependency opentofu to v1.8.2 b704680
* **deps:** update dependency pre-commit to v3.7.1 6a6c883
* **deps:** update dependency pre-commit to v3.8.0 b649c5a
* **deps:** update dependency terraform-docs to v0.18.0 0fe8bda
* **deps:** update dependency terraform-docs to v0.19.0 d179526
* **deps:** update dependency tflint to v0.51.0 65aa8ef
* **deps:** update dependency tflint to v0.51.1 614eec6
* **deps:** update dependency tflint to v0.51.2 448cc6c
* **deps:** update dependency tflint to v0.52.0 8fca8fe
* **deps:** update dependency trivy to v0.51.0 f8a5299
* **deps:** update dependency trivy to v0.51.1 efccdd1
* **deps:** update dependency trivy to v0.51.2 a2558cf
* **deps:** update dependency trivy to v0.51.3 2c29553
* **deps:** update dependency trivy to v0.51.4 aa3b86f
* **deps:** update dependency trivy to v0.52.0 c3c98da
* **deps:** update dependency trivy to v0.52.1 978cba1
* **deps:** update dependency trivy to v0.52.2 6a54f5b
* **deps:** update dependency trivy to v0.53.0 d324796
* **deps:** update dependency trivy to v0.54.1 a6d69ea
* **deps:** update dependency trivy to v0.55.0 2ff64aa
* **deps:** update dependency trivy to v0.55.1 5938d75
* **deps:** update dependency trivy to v0.55.2 5a8f942
* **deps:** update dependency trivy to v0.56.0 0257cea
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 7c78e7e
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 3d0ac75
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 42ab98c
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 eaf3c2d
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 d6f6512
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 b70fb02
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 e0b197f
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 eaee442
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 f632cbd
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 69a6a14
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 e1bfa91
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 2dd04a7
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 d386d6d
* **deps:** update tools e219296

## 7.0.1 (2024-04-30)


### Bug Fixes

* **AzAPI:** provider pinned `< v1.13` to avoid breaking changes d634ce6


### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] 563e84b
* **AZ-1391:** update semantic-release config [skip ci] 1f21840


### Miscellaneous Chores

* **deps:** add renovate.json 20b66c7
* **deps:** enable automerge on renovate beef226
* **deps:** update dependency opentofu to v1.7.0 85ecaa6
* **deps:** update dependency trivy to v0.50.2 d018682
* **deps:** update dependency trivy to v0.50.4 61fcf90
* **deps:** update renovate.json 6a12d0d
* **pre-commit:** update commitlint hook a4c7f70
* **release:** remove legacy `VERSION` file 26686fc

# v7.0.0 - 2023-12-01

Added
  * AZ-1185: Claranet Gallery Images module first release
