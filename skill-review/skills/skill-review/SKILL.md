---
name: skill-review
description: Agent Skills のスキルレビューを行い、公式仕様への準拠とベストプラクティスの観点で指摘と改善案を提示する。スキルのレビュー依頼、SKILL.mdの品質確認、スキル構成の妥当性チェック、Agent Skills仕様への適合性評価の文脈で使用する。
---

# Skill Review

Agent Skills 仕様に基づいてスキルをレビューし、適合性と改善提案を提示する。

## Review Workflow

### 入力例

- 「このスキルをレビューして」
- 「SKILL.mdの仕様準拠を確認して」

### 1. 依頼内容と対象を特定する

- 対象スキルのルートディレクトリを確認する。
- レビュー範囲（SKILL.mdのみ / scripts・references・assets含む）を明確にする。

### 2. 公式仕様を参照してレビューする

- 常に https://agentskills.io/specification を根拠として参照する。
- 指摘ごとに、該当するセクションへのリンク（Spec Link）を付与する。
- 必要に応じて、仕様ページ内の見出しアンカーを用いる。

### 3. 改善提案を作る

- 仕様違反は必ず指摘し、修正案を提示する。
- ベストプラクティスに沿わない箇所は「理由」と「改善手順」を示す。

## Output Format

```markdown
## スキルレビュー概要

### 指摘事項

#### [Severity: High/Medium/Low] タイトル
- **Location**: path/to/file:line
- **Issue**: 問題点の説明
- **Spec/Rule**: 対応する仕様ポイント
- **Spec Link**: https://agentskills.io/specification#section-id
- **Recommendation**: 修正案

### 提案 (Optional)
- 改善アイデアや運用上の提案

### OK (Optional)
- 問題なし
```

## Notes

- 仕様準拠の指摘を最優先する。
- 仕様違反がない場合でも、改善余地があれば提案する。
