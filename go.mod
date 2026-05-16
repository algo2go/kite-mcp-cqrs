module github.com/algo2go/kite-mcp-cqrs

go 1.25.0

// kc/cqrs is a moderate-fan-in module — CommandBus + dispatcher
// (in-memory + saga-friendly) + query handlers (read-side projections
// of orders/holdings/positions/widgets). Direct internal deps:
//   - kc/domain (still in root at this commit; PR 4.1 stub-adds
//     kc/domain/go.mod separately for revertability)
//   - kc/logger (extracted at commit 1b7dcbf)
//
// Transitive replace footprint: kc/domain reaches broker → kc/money,
// and kc/isttz directly. So this module's replace block must include
// root + broker + kc/isttz + kc/logger + kc/money — five entries —
// matching the kc/registry / kc/users shape from Tier 2 (per the
// empirical replace-line cost-curve documented in kc/users/go.mod
// commit f32629f).
//
// Tier 3 zero-monolith path (.research/zero-monolith-roadmap.md
// commit a5e7e76): moderate-fan-in packages extracted in a single
// dispatch. This is 17/24 (commit 1 of 4 in this dispatch).
require (
	github.com/algo2go/kite-mcp-broker v0.1.2 // indirect
	github.com/algo2go/kite-mcp-isttz v0.1.1 // indirect
	github.com/algo2go/kite-mcp-logger v0.1.1
	github.com/algo2go/kite-mcp-money v0.1.1 // indirect
	github.com/stretchr/testify v1.10.0
)

require github.com/algo2go/kite-mcp-domain v0.1.2

require (
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/gocarina/gocsv v0.0.0-20180809181117-b8c38cb1ba36 // indirect
	github.com/google/go-querystring v1.0.0 // indirect
	github.com/gorilla/websocket v1.5.3 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/zerodha/gokiteconnect/v4 v4.4.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
