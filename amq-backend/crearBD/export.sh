#!/bin/bash
pg_dump amq > pg_dump_export.sql --inserts --clean -U postgres;
