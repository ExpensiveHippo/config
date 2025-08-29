# File to store agent environment
SSH_ENV="$HOME/.ssh/agent.env"

# Function to start ssh-agent and save env
function start_agent {
    ssh-agent -s > "$SSH_ENV"
    echo "ssh-agent started successfully"
}

# Source existing agent env if it exists
if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
    # Check if the agent is still running
    if ! kill -0 $SSH_AGENT_PID 2>/dev/null; then
        start_agent
    fi
else
    start_agent
fi
