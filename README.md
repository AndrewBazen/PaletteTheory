# PaletteTheory

**An open color palette sharing and management API for creative developers and pixel art tools.**

PaletteTheory is a fast, flexible, and lightweight web API built to support palette creation, uploading, searching, and sharing. It’s designed to power tools like [PocketSprite](https://github.com/AndrewBazen/PocketSprite) or any other creative project needing user-defined color palettes.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [API Overview](#api-overview)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Testing](#testing)
7. [Contributing](#contributing)
8. [License](#license)

---

## Introduction

PaletteTheory provides a backend service for:

* Saving palettes to a PostgreSQL database
* Tagging palettes with metadata
* Retrieving palette lists, individual palettes, or searching by tags
* Sharing and consuming palettes across creative apps

It is intended to be self-hosted or containerized and integrated easily into existing tools.

---

## Features

* ✅ RESTful API for creating, editing, and retrieving palettes
* 🎨 Color validation and support for hex codes
* 🔖 Tag-based filtering and search
* 🐳 Docker + Native AOT support for fast deployment
* 🧪 Integration testing via xUnit and Testcontainers
* 📝 Markdown export support for palette documentation

---

## API Overview

Base URL: `http://localhost:5212`

### Example Endpoints

* `GET /api/palettes` - Get all palettes
* `POST /api/palettes` - Create a new palette
* `GET /api/palettes/{slug}` - Get a specific palette

**Palette Model**:

```json
{
  "title": "Ocean Blue",
  "slug": "ocean-blue",
  "author": ["JaneDoe"],
  "colors": ["#003f5c", "#58508d", "#bc5090"],
  "tags": ["blue", "cool", "ocean"],
  "createdAt": "2025-05-01T00:00:00Z"
}
```

---

## Installation

Clone and run locally:

```bash
git clone https://github.com/youruser/PaletteTheory.git
cd PaletteTheory

# Ensure PostgreSQL is running (see Docker setup below)
dotnet build
```

To run with Docker Compose:

```bash
docker compose up --build
```

---

## Usage

Once running, you can interact with the API via:

* `curl`
* Postman
* A frontend (e.g. PocketSprite)

> Example: Create a palette

```bash
curl -X POST http://localhost:5212/api/palettes \
     -H "Content-Type: application/json" \
     -d '{
       "title": "Warm Sunset",
       "author": ["TestUser"],
       "slug": "warm-sunset",
       "colors": ["#ff9a8b", "#ff6a88", "#ff99ac"],
       "tags": ["sunset", "warm"]
     }'
```

---

## Testing

Tests run inside isolated PostgreSQL containers:

```bash
dotnet test
```

Successful test runs will export palette data in Markdown to `TestOutput/`. This can be viewed or imported into Markdown tools like Inkdrop.

---

## Contributing

Have an idea? A better color sorting algorithm? Create a fork and open a PR.

```bash
git clone https://github.com/youruser/PaletteTheory.git
git checkout -b feature/new-idea
```

Please include tests for any new functionality!

---

## License

PaletteTheory is licensed under the **MIT License**.

> This allows commercial and non-commercial use, modification, distribution, and private use — as long as attribution is provided.

See [`LICENSE`](LICENSE) for details.
