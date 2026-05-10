# kite-mcp-cqrs

[![Go Reference](https://pkg.go.dev/badge/github.com/algo2go/kite-mcp-cqrs.svg)](https://pkg.go.dev/github.com/algo2go/kite-mcp-cqrs)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

CQRS infrastructure (CommandBus + dispatcher + query handlers) for
the algo2go ecosystem. Provides in-memory command bus with saga-
friendly transaction envelopes and read-side query handlers for
orders/holdings/positions/widgets.

Used by [`Sundeepg98/kite-mcp-server`](https://github.com/Sundeepg98/kite-mcp-server)
across the manager_commands_* + use case layer for write/read
segregation.

## Why a separate module?

CQRS is a foundational architectural primitive any algo2go consumer
that needs explicit read/write segregation can use independent of
`kite-mcp-server`. Hosting as a module:

- Centralizes the CommandBus + QueryDispatcher contract
- Lets command/query interface signatures version independently

## Stability promise

**v0.x — unstable.** Pin `v0.1.0` deliberately.

## Install

```bash
go get github.com/algo2go/kite-mcp-cqrs@v0.1.0
```

## Public API

- `CommandBus` — command dispatch with saga-friendly transaction
  envelopes
- `QueryDispatcher` — read-side projection lookup
- Command/Query interfaces for orders, holdings, positions, widgets

## Dependencies

- `github.com/algo2go/kite-mcp-domain` v0.1.0
- `github.com/algo2go/kite-mcp-logger` v0.1.0
- `github.com/stretchr/testify` — assertions

All algo2go deps published; no upstream `replace` directives needed.

## Reference consumer

[`Sundeepg98/kite-mcp-server`](https://github.com/Sundeepg98/kite-mcp-server)
— consumed across kc/manager_commands_*, kc/manager_queries_*,
kc/manager_cqrs_register.go, app/wire.go, kc/usecases/*, mcp/trade/*,
mcp/portfolio/*, mcp/admin/*, mcp/alerts/*, mcp/analytics/*.

## License

MIT — see [LICENSE](LICENSE).

## Authors

Original design: [Sundeepg98](https://github.com/Sundeepg98) (Zerodha
Tech). Multi-module promotion (2026-05-10): algo2go contributors.
