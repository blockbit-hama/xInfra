

# xInfra

서비스 인프라 구성을 위한 통합 인프라 설정 저장소  
(Kubernetes, Helm, Docker, LAC 등 포함)

---

## 📦 개요

**xInfra**는 `lac`, `Kubernetes`, `Helm`, `Docker` 등 다양한 인프라 컴포넌트의  
설정 파일, 배포 스크립트, 모듈화된 Helm 차트 등을 포함하고 있는 **인프라 운영 설정 프로젝트**입니다.

CI/CD 환경, 클러스터 구성, 모니터링, 서비스 배포 자동화 등  
**서비스 운영에 필요한 핵심 설정을 중앙에서 관리**합니다.

---

## ⚙️ 포함 항목

- `lac/` : LAC(Layered Architecture Controller) 구성 및 정책
- `k8s/` : Kubernetes 매니페스트 (Deployments, Services, Ingress 등)
- `helm/` : Helm 차트 및 values 설정
- `docker/` : 서비스별 Dockerfile 및 빌드 스크립트
- `scripts/` : 운영 자동화를 위한 유틸 스크립트

---

## 🚀 사용 방법

```bash
# Helm 차트 설치 예시
helm install my-service ./helm/my-service -f helm/my-service/values.yaml

# Kubernetes 배포
kubectl apply -f k8s/base/