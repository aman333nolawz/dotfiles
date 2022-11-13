#!/usr/bin/env bash
fusermount -u "$1" && rmdir "$1"
