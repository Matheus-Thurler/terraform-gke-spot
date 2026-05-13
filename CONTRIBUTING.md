# Commit Convention

This project uses [Conventional Commits](https://www.conventionalcommits.org/).

## Format

```
<type>(<scope>): <description>

[optional body]
```

## Types

| Type | Description |
|------|-------------|
| `feat` | New feature or resource |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `ci` | CI/CD changes |
| `chore` | Maintenance tasks |

## Scopes

| Scope | Description |
|-------|-------------|
| `gke` | GKE cluster module |
| `examples` | Example configurations |
| `ci` | GitHub Actions workflows |

## Examples

```
feat(gke): add support for autoscaling node pool
fix(gke): correct spot taint configuration
docs: update README with cost breakdown
ci: add terraform-docs check
```
