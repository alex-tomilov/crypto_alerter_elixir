# Crypto Alerter Elixir

Crypto Alerter is a Phoenix-based application designed to monitor cryptocurrency price changes and send alerts. It's built with a modern Elixir stack, leveraging real-time features and a robust background job processing system.

## Overview

This application is designed to:
- Connect to cryptocurrency data streams.
- Monitor price fluctuations for specified cryptocurrencies.
- Send alerts via multiple channels (e.g., Telegram) when prices cross certain thresholds.
- Provide a web interface for configuration and monitoring.

## Features

- Real-time price tracking with Phoenix LiveView.
- Background job processing with Oban for reliable alert delivery.
- WebSocket integration for real-time data consumption.
- Telegram bot for notifications.
- Dashboard for monitoring system health and jobs.

## Tech Stack

- **Backend:** Elixir, Phoenix
- **Database:** PostgreSQL
- **Real-time:** Phoenix LiveView, WebSockets
- **Background Jobs:** Oban
- **Notifications:** Telegram
- **Frontend:** Tailwind CSS, esbuild

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Elixir ~> 1.15
- Erlang/OTP
- PostgreSQL

### Installation

1.  **Clone the repo**
    ```sh
    git clone https://github.com/your_username/crypto_alerter_elixir.git
    cd crypto_alerter_elixir
    ```

2.  **Install dependencies**
    ```sh
    mix setup
    ```

3.  **Set up your environment variables**
    Create a `.env` file in the root of the project. See the [Configuration](#configuration) section for more details.

4.  **Start the Phoenix server**
    ```sh
    mix phx.server
    ```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Configuration

The application is configured via environment variables. You can create a `.env` file in the project root directory to store your configuration. For production, you should set these variables in your deployment environment.

Here is an example of the environment variables used by the application:

```env
# PostgreSQL Database configuration
USERNAME="your_db_user"
PASSWORD="your_db_password"
HOSTNAME="localhost"
DATABASE="crypto_alerter_elixir_dev"

# Phoenix application secrets
SECRET_KEY_BASE="your_secret_key_base" # Generate with `mix phx.gen.secret`
LIVE_VIEW_SIGNING_SALT="your_live_view_signing_salt" # Generate with `mix phx.gen.secret 32`

# Phoenix Live Dashboard credentials
DASHBOARD_USER="admin"
DASHBOARD_PASS="your_secure_password"

# Mailer configuration (example with Mailgun)
MAILGUN_API_KEY="your_mailgun_api_key"
MAILGUN_DOMAIN="your_mailgun_domain"

# Telegram Bot Token
TELEGRAM_BOT_TOKEN="your_telegram_bot_token"
```

**Note:** For production, it is recommended to use `DATABASE_URL` instead of individual database credentials.

```env
DATABASE_URL="ecto://USER:PASS@HOST/DATABASE"
```

## Learn More

*   Official website: https://www.phoenixframework.org/
*   Guides: https://hexdocs.pm/phoenix/overview.html
*   Docs: https://hexdocs.pm/phoenix
*   Forum: https://elixirforum.com/c/phoenix-forum
*   Source: https://github.com/phoenixframework/phoenix