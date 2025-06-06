#!/bin/bash
cp .env.example .env 2>/dev/null
docker-compose up --build
