# Crypto Alerter Elixir

Crypto Alerter is a Phoenix-based application designed to monitor cryptocurrency price changes and send alerts. It's built with a modern Elixir stack, leveraging real-time features, a robust background job processing system, and data streaming with Kafka.

## Overview

This application is designed to:
- Connect to cryptocurrency data streams via WebSockets and Apache Kafka.
- Monitor price fluctuations for specified cryptocurrencies.
- Send alerts via multiple channels (e.g., Telegram, Email).
- Provide a web interface for configuration and monitoring.

## Features

- **Real-time Price Tracking:** Utilizes Phoenix LiveView and WebSockets for real-time price updates.
- **Data Processing:** Implements data processing pipelines with Broadway and Apache Kafka.
- **Background Jobs:** Uses Oban for reliable background job processing, ensuring alert delivery.
- **Notifications:** Supports multiple notification channels, including Telegram and Email (via Mailgun).
- **Web Server:** High-performance web server powered by Bandit.
- **System Monitoring:** Includes a Phoenix Live Dashboard for monitoring system health and Oban jobs.
- **Caching:** Leverages Cachex for in-memory caching to improve performance.

## Tech Stack

- **Backend:** Elixir, Phoenix (`~> 1.8.0`)
- **Web Server:** Bandit (`~> 1.5`)
- **Data Streaming:** Apache Kafka with Broadway (`~> 0.4.1`)
- **Database:** PostgreSQL with Ecto (`~> 3.13`)
- **Real-time:** Phoenix LiveView (`~> 1.1.0`), WebSockets (`websockex ~> 0.4.3`)
- **Background Jobs:** Oban (`~> 2.19`)
- **Email:** Swoosh (`~> 1.19`) with Mailgun
- **HTTP Client:** Req (`~> 0.5`)
- **Caching:** Cachex (`~> 4.0`)
- **Notifications:** Telegram (`~> 2.1.0`)
- **Frontend:** Tailwind CSS (`~> 0.3`), esbuild (`~> 0.10`)

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Elixir `1.18.4`
- Erlang/OTP `28.0.2`
- PostgreSQL
- Apache Kafka (for data streaming features)

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

The application is configured via environment variables, which are loaded from a `.env` file in development. For production, these variables should be set in your deployment environment.

Here is an example of the environment variables used by the application:

```env
# PostgreSQL Database configuration
POSTGRES_USER="your_db_user"
POSTGRES_PASSWORD="your_db_password"
POSTGRES_HOSTNAME="localhost"
POSTGRES_DB="crypto_alerter_elixir_dev"

# For production, you might use DATABASE_URL instead
# DATABASE_URL="ecto://USER:PASS@HOST/DATABASE"

# Phoenix application secrets
SECRET_KEY_BASE="your_secret_key_base" # Generate with `mix phx.gen.secret`
LIVE_VIEW_SIGNING_SALT="your_live_view_signing_salt" # Generate with `mix phx.gen.secret 32`

# Phoenix Live Dashboard credentials
DASHBOARD_USER="admin"
DASHBOARD_PASS="your_secure_password"

# Mailer configuration (Mailgun)
MAILGUN_API_KEY="your_mailgun_api_key"
MAILGUN_DOMAIN="your_mailgun_domain"
MAILGUN_BASE_URL="https://api.mailgun.net"

# Telegram Bot Token
TELEGRAM_BOT_TOKEN="your_telegram_bot_token"

# Production specific configuration
# PHX_HOST="example.com"
# PORT=4000
# DNS_CLUSTER_QUERY=""
```

## Learn More

*   Official website: https://www.phoenixframework.org/
*   Guides: https://hexdocs.pm/phoenix/overview.html
*   Docs: https://hexdocs.pm/phoenix
*   Forum: https://elixirforum.com/c/phoenix-forum
*   Source: https://github.com/phoenixframework/phoenix
