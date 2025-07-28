---
name: argo-cd를 학습/적용.
about: argo-cd의 proj, application을 사용해보고 직접 작성.
title: 'study: argo-cd'
labels: study
---

## 목표

Argo CD를 이용하여 Helm Chart 기반으로 Project와 Application을 구성하고,
정해진 리소스만 배포 가능한 AppProject 정책을 이해합니다.

### 과제 요구사항

과제 통과를 위해서 반드시 아래 사항을 준수해야 합니다.

- 모든 내용은 helm chart로 작성되어야 합니다.
- Helm Chart는  `year/argo-cd/github 계정` 디렉토리를 생성, 그 아래 작성해주세요.
  ```shell
  202x/
  └── argo-cd/
    └── octocat/
        ├── Chart.yaml
        ├── values.yaml
        └── templates/
            ├── project.yaml
            └── application.yaml
  ```
- `https://github.com/argoproj/argocd-example-apps`의 `helm-guestbook`을 배포할수 있어야 합니다.
- Helm Chart는 아래의 values.yaml의 형태를 지원해야합니다.
  ```yaml
  project:
    sourceRepos:
      -
    destinations:
      - namespace:
        server:

  application:
    metadata:
      name:
      namespace:
    spec:
      destination:
        namespace:
  ```
- values.yaml은 적절한 기본값을 제공해야합니다.
- Project는 Deployment, Service만 배포할수 있게 제한해야 합니다.


## 참고사항

쿠버네티스는 별도의 코드수정 없이도 [확장하는 방법](https://kubernetes.io/ko/docs/concepts/extend-kubernetes/)을 제공하고 있습니다. \
argoproj는 [Operator Pattern](https://kubernetes.io/ko/docs/concepts/extend-kubernetes/operator/), [CRD](https://kubernetes.io/ko/docs/concepts/extend-kubernetes/api-extension/custom-resources/)를 통해 쿠버네티스와 통합하고 있습니다. \
Operator Pattern, CRD에 대해 잘 학습하면 동작방식과 코드분석에 도움이 됩니다.

**argo-cd**의 spec을 참고해요.
- [ApplicationSet](https://argo-cd.readthedocs.io/en/latest/operator-manual/applicationset/applicationset-specification/)
- [Application](https://argo-cd.readthedocs.io/en/latest/user-guide/application-specification/)
- [Project](https://argo-cd.readthedocs.io/en/latest/operator-manual/project-specification/)