# Traction & Leads Strategy

[English](README.md)

실행 전 단계에서 고객 획득, 오퍼, 퍼널, 채널 의사결정을 진단하는 Agent Skill입니다. 막연한 성장 요청을 근거가 있는 결정, 추천 경로, 명확한 성공·중단 기준을 가진 제한된 실험으로 바꾸도록 Codex 또는 Claude Code를 안내합니다.

## 이 스킬이 하는 일

성장 문제는 실제 원인이 다른데도 트래픽 문제로 분류되는 경우가 많습니다. 이 스킬은 먼저 현재 제품, 좁은 고객군, 오퍼, 퍼널, 근거, 단위 경제성, 제약을 확인합니다. 이후 도달, 관심, 자격 충족, 구매, 활성화, 유지, 추천으로 이어지는 경로를 살펴 가장 큰 제약 하나를 찾습니다.

요청에 따라 다음 네 가지 결과 중 가장 작은 형태를 만듭니다.

- **좁은 감사:** 랜딩 페이지, 캠페인, 오퍼 또는 퍼널 결정에 대한 판정, 확인한 근거와 범위, 핵심 제약, 우선순위 수정안, 검증 방법
- **전략:** 트랙션 목표 또는 학습 결정, 맥락과 가정, 서로 다른 전략 대안, 하나의 추천안, `지금 / 신호 확인 후 / 보류` 로드맵
- **실험 설계:** 가설, 실제 시장 접촉, 예산과 기간, 지표, 사전에 정한 성공·중단 기준, 결과별 다음 행동
- **결과 검증:** 원래 기준과의 비교, 코호트·데이터 품질 확인, 판정, 대안 설명, `확대 / 반복 / 수정 / 중단 / 판단 유보` 결정

채널 판단은 현재 단계에 맞춰 달라집니다.

- 반복 가능한 채널이 아직 없다면 서로 다른 후보를 살피고, 집중하기 전에 작고 비교 가능한 테스트를 설계합니다.
- 관심은 있지만 전환이 약하다면 트래픽 확대 전에 오퍼, 약속, 증거, 자격 조건, 활성화 경로를 점검합니다.
- 이미 작동하는 경로가 있다면 검증된 입력 확대, 핵심 제약 개선, 새로운 노출 위치·방법 순서로 확장합니다.
- 추천, 파트너, 어필리에이트, 직원, 에이전시를 통한 레버리지는 프로세스, 경제성, 운영 여력이 뒷받침될 때만 제안합니다.

## 이 스킬이 하지 않는 일

이 스킬은 전략 의사결정용이며 전술 실행 번들이 아닙니다. 전략이 확정된 뒤의 카피 작성, CRO 구현, SEO, 광고 운영, 잠재고객 수집, 아웃리치, 분석 엔지니어링은 각각에 맞는 도구나 스킬로 넘깁니다.

스킬 호출은 광고비 지출, 고객 접촉, 게시, 결제, 계정 변경, 외부 공유를 승인하지 않습니다. 노출, 팔로워, 설치, 자격이 확인되지 않은 리드는 이후 품질과 사업 성과가 확인되지 않는 한 트랙션으로 판단하지 않습니다.

## 적합한 사용 사례

- 퍼널이 자격을 갖춘 고객이나 활성 고객을 만들지 못하는 이유 찾기
- 저비용으로 검증할 획득 채널 선택하기
- 첫 고객 또는 베타 모집 전략 설계하기
- 랜딩 페이지가 현재 오퍼와 목표 행동을 제대로 지원하는지 감사하기
- 마케팅 결과를 확대, 반복, 수정, 중단 또는 판단 유보할지 결정하기
- 획득 문제와 오퍼, 영업, 제품, 유지, 경제성, 운영 용량 문제를 구분하기

## 사용 예시

Codex에서 명시적으로 호출:

```text
$traction-leads-strategy 이 퍼널의 핵심 제약을 찾고 가장 저렴하면서 신뢰할 수 있는 실험을 설계해줘.
```

Claude Code에서 명시적으로 호출:

```text
/traction-leads-strategy 이 베타 모집 페이지를 감사하고 트래픽을 늘리기 전에 무엇을 검증해야 하는지 알려줘.
```

두 제품 모두 요청이 설명과 일치하면 스킬을 자동으로 선택할 수도 있습니다.

## 호환성

이 저장소는 YAML frontmatter와 Markdown 지침이 담긴 `SKILL.md`를 스킬 디렉터리에 두는 공통 Agent Skills 구조를 따릅니다. 같은 `SKILL.md`가 두 제품에 변경 없이 설치됩니다.

| 제품 | 개인 스킬 경로 | 프로젝트 스킬 경로 | 명시적 호출 |
| --- | --- | --- | --- |
| Codex | `~/.agents/skills/traction-leads-strategy/SKILL.md` | `.agents/skills/traction-leads-strategy/SKILL.md` | `$traction-leads-strategy` |
| Claude Code | `~/.claude/skills/traction-leads-strategy/SKILL.md` | `.claude/skills/traction-leads-strategy/SKILL.md` | `/traction-leads-strategy` |

공식 문서: [OpenAI Codex Skills](https://developers.openai.com/codex/skills), [Anthropic Claude Code Skills](https://code.claude.com/docs/en/skills)

## 개인용으로 설치

Git과 표준 `cp`, `cmp`, `grep`, `mktemp`, `mv` 명령이 있는 POSIX 셸이 필요합니다. 설치기는 macOS와 Linux에서 테스트합니다. `rsync`를 요구하지 않으며 기존 설치를 삭제하지 않습니다. 대상이 이미 있으면 새 파일을 설치하기 전에 스킬 검색 디렉터리 밖의 타임스탬프 백업으로 옮깁니다.

```bash
git clone https://github.com/flowkater/traction-leads-strategy-skill.git
cd traction-leads-strategy-skill
./install.sh all
```

한 제품에만 설치하려면 다음 중 하나를 사용합니다.

```bash
./install.sh codex
./install.sh claude
```

테스트나 비표준 경로에는 설치기 전용 환경 변수 `CODEX_SKILLS_DIR`, `CLAUDE_SKILLS_DIR`로 기본 경로를 바꿀 수 있습니다. 이것들은 이 저장소가 제공하는 편의 기능이며 제품 설정 변수가 아닙니다.

설치 후 Codex는 일반적으로 스킬 변경을 자동 감지합니다. 보이지 않으면 Codex를 재시작하세요. Claude Code는 현재 세션에서 기존 스킬 디렉터리의 변경을 감지하지만, 세션 시작 후 최상위 스킬 디렉터리를 새로 만들었다면 재시작해야 합니다.

## 한 프로젝트에만 설치

Codex:

```bash
mkdir -p .agents/skills/traction-leads-strategy/agents
cp SKILL.md .agents/skills/traction-leads-strategy/SKILL.md
cp agents/openai.yaml .agents/skills/traction-leads-strategy/agents/openai.yaml
```

Claude Code:

```bash
mkdir -p .claude/skills/traction-leads-strategy
cp SKILL.md .claude/skills/traction-leads-strategy/SKILL.md
```

저장소의 동료나 클라우드 세션과 공유해야 한다면 프로젝트 로컬 스킬을 커밋하세요.

## 설치 검증

먼저 저장소의 격리 설치 테스트를 실행합니다.

```bash
./scripts/test-install.sh
```

설치한 제품의 개인 파일이 존재하는지 확인합니다.

```bash
test -f "$HOME/.agents/skills/traction-leads-strategy/SKILL.md"
test -f "$HOME/.claude/skills/traction-leads-strategy/SKILL.md"
```

마지막으로 새 대화를 시작하고 호환성 표에 나온 방식으로 스킬을 명시적으로 호출합니다. 파일 존재는 설치가 완료됐음을 뜻하고, 실제 발견·호출 성공은 실행 중인 제품이 스킬을 읽었음을 증명합니다.

## 업데이트와 복구

저장소를 갱신한 뒤 같은 설치 명령을 다시 실행합니다.

```bash
git pull --ff-only
./install.sh all
```

기존 대상은 스킬 검색 디렉터리 밖에 보존됩니다. 기본 경로를 사용하면 Codex 백업은 `~/.agents/skill-backups/`, Claude Code 백업은 `~/.claude/skill-backups/`에 `traction-leads-strategy.20260903153000.12345` 같은 이름으로 저장됩니다. 되돌리려면 해당 제품을 종료하고 새 디렉터리를 다른 곳으로 옮긴 뒤 원하는 백업을 제품의 `skills/traction-leads-strategy` 경로로 옮기세요.

## 콘텐츠 경계와 출처 표시

이 공개판에는 직접 작성한 상위 수준의 운영 지침만 포함합니다. 개인 학습 노트, 번역, 장별 매핑, 소스 매니페스트, *Traction* 또는 *$100M Leads*의 원문 구절은 포함하지 않습니다. 해당 저작물의 권리는 각 저자와 출판사에 있으며, 이 프로젝트는 이들과 제휴하거나 보증받지 않았습니다.
