# Claude Agent Team Launcher

> One-command launcher for Claude Code Agent Teams with tmux integration

Launch multiple Claude AI agents working in parallel with a single command. Perfect for accelerated development, code reviews, and complex feature builds.

## Features

- 🚀 **One command to launch**: Just type `ct` and go
- 🔄 **Smart session management**: Attach to existing or create new sessions automatically
- 🖥️ **iTerm2 optimized**: Auto-detects iTerm2 and uses control mode for native tabs
- 📦 **No configuration needed**: Works out of the box
- 🎯 **Named sessions**: Run multiple projects simultaneously
- 🧹 **Easy cleanup**: Simple commands to manage sessions

## What Are Agent Teams?

Claude Code Agent Teams (introduced with Claude Opus 4.6) let you orchestrate multiple AI agents working in parallel:

- Each agent runs in its own tmux pane/window
- Agents coordinate through a shared task list
- Perfect for parallel code reviews, multi-module features, and rapid prototyping
- Dramatically faster than sequential development

## Requirements

- macOS or Linux
- [tmux](https://github.com/tmux/tmux) installed
- [Claude Code](https://code.claude.com/) CLI installed
- Zsh or Bash shell

## Installation

### Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/rhysheavensmith/claude-agent-launcher/main/install.sh | bash
```

### Manual Install

1. **Install tmux** (if not already installed):

```bash
# macOS
brew install tmux

# Ubuntu/Debian
sudo apt install tmux

# Fedora
sudo dnf install tmux
```

2. **Add to your shell config**:

```bash
# Download the script
curl -fsSL https://raw.githubusercontent.com/rhysheavensmith/claude-agent-launcher/main/claude-team.sh >> ~/.zshrc

# Reload your shell
source ~/.zshrc
```

## Usage

### Quick Start

```bash
# Launch agent team in current directory
ct

# Launch with custom session name
ct my-project

# List active sessions
ct-list

# Kill a session
ct-kill my-project
```

### Example Prompts

Once launched, try prompts like:

**Code Review:**
```
Create a team of 3 agents to review this codebase:
- Agent 1: Security review
- Agent 2: Performance review  
- Agent 3: Code quality review

Have them share findings and create a report in docs/review.md
```

**Feature Development:**
```
Build a user authentication system with 4 agents:
- Agent 1: Backend API endpoints
- Agent 2: Frontend login components
- Agent 3: Database schema and migrations
- Agent 4: Tests and documentation
```

**Design Implementation:**
```
Implement Figma designs with 3 agents:
- Agent 1: Component library
- Agent 2: Page layouts
- Agent 3: Responsive styling and mobile optimization

Use Figma MCP to validate against designs.
```

**Client Project Delivery:**
```
Build e-commerce product catalog with 5 agents:
- Agent 1 (Opus): Architecture and coordination (delegate mode)
- Agent 2 (Sonnet): Product grid with filtering
- Agent 3 (Sonnet): Product detail pages
- Agent 4 (Sonnet): Mobile optimization
- Agent 5 (Haiku): Testing and documentation

Deliverable: Production-ready catalog in 2-3 days
```

## Commands Reference

| Command | Description |
|---------|-------------|
| `ct` | Launch agent team (or attach if exists) |
| `ct [name]` | Launch/attach to named session |
| `ct-list` | Show all active sessions |
| `ct-kill [name]` | Kill specific session |

## Keyboard Shortcuts

### Terminal Navigation (in tmux)
| Shortcut | Action |
|----------|--------|
| `Ctrl+A` | Jump to start of line |
| `Ctrl+E` | Jump to end of line |
| `Ctrl+K` | Delete to end of line |
| `Ctrl+U` | Delete to start of line |
| `Ctrl+W` | Delete word backwards |
| `Ctrl+R` | Search command history |
| `Ctrl+L` | Clear screen |

### Tmux Pane Navigation
| Shortcut | Action |
|----------|--------|
| `Ctrl+B, arrows` | Move between panes |
| `Ctrl+B, Z` | Zoom current pane (toggle) |
| `Shift+Up/Down` | Switch between agents (Claude Code) |
| `Ctrl+B, [` | Enter scroll mode |

### Tmux Session Management
| Shortcut | Action |
|----------|--------|
| `Ctrl+B, D` | Detach from session (keeps running) |
| `Ctrl+B, X` | Close current pane |

## Tips & Best Practices

### 1. Enable Delegate Mode

Always start your lead agent with delegate mode to prevent it from doing work instead of coordinating:

```
Enable delegate mode. Create a team of 4 agents...
```

### 2. Mix Model Types for Cost Optimization

```
- Lead (Opus 4.6): Strategic decisions
- Agents 1-3 (Sonnet 4.5): Implementation
- Agent 4 (Haiku 4.5): Documentation/testing
```

### 3. Good Task Decomposition

✅ **Good:**
```
- Agent 1: Build user authentication
- Agent 2: Build admin dashboard
- Agent 3: Build API endpoints
```

❌ **Bad:**
```
- Agent 1: Build entire backend (too broad)
- Agent 2: Wait for Agent 1 (sequential dependency)
```

### 4. Use Skills

Have agents read relevant skills before starting:

```
Each agent should read /mnt/skills/public/frontend-design/SKILL.md 
before starting their work.
```

### 5. Name Sessions by Project

Keep your work organized:

```bash
ct helpline-web      # Client project
ct portfolio-site    # Personal project  
ct api-refactor      # Internal work
```

## Use Cases

### Rapid Prototyping
Launch 4-5 agents to build a full feature in hours instead of days.

### Code Review
Deploy specialized reviewers (security, performance, quality) working in parallel.

### Client Projects
Deliver $10k+ projects in 2-3 days instead of 2-3 weeks. Each agent handles a different module while the lead coordinates integration.

### Design Implementation
Multiple agents validate components against Figma designs simultaneously using Figma MCP.

### Documentation
Parallel documentation of different modules or components.

### Bug Hunting
Deploy agents with competing hypotheses to find root causes faster.

## Real-World Example

**$10k E-commerce Project in 3 Days:**

```
Day 1: Setup & Core (4-5 hours)
- Launch 5-agent team
- Agent 1: Product grid with filtering
- Agent 2: Product detail pages
- Agent 3: Shopping cart
- Agent 4: Checkout flow
- Agent 5: Mobile optimization

Day 2: Refinement (4-5 hours)
- Implement client feedback
- Integration testing
- Performance optimization

Day 3: Delivery (3-4 hours)
- Final testing
- Deploy to production
- Client handoff

Total: ~15 hours of your time
Revenue: $10k
Effective rate: $666/hour
```

## Troubleshooting

### "duplicate session" error
Session already exists. Either attach to it or kill it:
```bash
ct              # Attaches automatically
# or
ct-kill agents  # Kill and restart
```

### Can't see split panes in VS Code/Cursor
tmux split panes don't work in integrated terminals. Use:
- External terminal (iTerm2/Terminal.app)
- Or `claude --teammate-mode in-process` for single-window view

### iTerm2 not using control mode
The script auto-detects iTerm2. If it's not working, make sure `$TERM_PROGRAM` is set:
```bash
echo $TERM_PROGRAM  # Should output "iTerm.app"
```

### Cmd keyboard shortcuts don't work
This is normal in tmux. Use Ctrl-based shortcuts instead:
- `Ctrl+A` for start of line
- `Ctrl+E` for end of line
- Or use iTerm2 control mode (`tmux -CC`) for native keyboard support

### Agent teams not spawning
Make sure the experimental flag is enabled:
```bash
echo $CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS  # Should output "1"
```

## Advanced Configuration

### Custom Session Names Per Project

Add to your project's `.envrc` (with direnv):

```bash
# Auto-name sessions based on directory
export CT_SESSION_NAME=$(basename $PWD)
```

### Pre-approve Permissions

Reduce interruptions by pre-approving common operations in Claude Code settings.

### Multiple Projects Workflow

```bash
# Morning: Client project
cd ~/clients/acme-corp
ct acme-project

# Afternoon: Personal project
cd ~/projects/saas-idea
ct saas-dev

# Evening: Open source
cd ~/oss/cool-library
ct oss-contrib

# Check what's running
ct-list
# Output:
# acme-project: 1 windows
# saas-dev: 1 windows
# oss-contrib: 1 windows
```

## Examples

Check out the [examples](./examples) directory for common agent team configurations:

- [Frontend validation](./examples/frontend-validation.md)
- [API development](./examples/api-development.md)
- [Code review](./examples/code-review.md)
- [Documentation generation](./examples/documentation.md)

## Performance Metrics

Users report:

- **Code reviews**: 3 hours → 30 minutes (6x faster)
- **Feature development**: 2 weeks → 2-3 days (5-7x faster)
- **Design implementation**: 1 week → 1-2 days (5x faster)
- **Client projects**: 3 weeks → 3 days (7x faster)

## Contributing

Contributions welcome! Please feel free to submit a Pull Request.

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Roadmap

- [ ] Support for Windows (WSL)
- [ ] Configuration file for custom defaults
- [ ] Session templates for common workflows
- [ ] Integration with project management tools
- [ ] Usage analytics dashboard

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Author

Created by **Rhys Heaven-Smith** ([@rhysheaven](https://github.com/rhysheaven))

Former marine engineer turned software developer, building tools to accelerate development and deliver high-value client projects faster.

## Acknowledgments

- Inspired by Claude Opus 4.6 and its Agent Teams feature
- Built with [tmux](https://github.com/tmux/tmux)
- Powered by [Claude Code](https://code.claude.com/)

## Related Projects

- [Claude Code](https://code.claude.com/) - Official AI coding assistant
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Figma MCP](https://help.figma.com/hc/en-us/articles/32132100833559) - Design-to-code integration

---

**⭐ Star this repo if you find it useful!**

**📢 Share your success stories** - Open an issue tagged "success-story" to share how agent teams helped you deliver faster.

**💬 Join the discussion** - Use GitHub Discussions for questions, tips, and community support.
