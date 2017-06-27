#!/bin/bash

cd "$(dirname "$0")"
mix texttest.fixture "$@"