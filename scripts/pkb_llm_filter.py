#!/usr/bin/env python3
import sys
import re

def strip_think_tags(content):
    """Removes <think>...</think> blocks from DeepSeek model outputs."""
    return re.sub(r'<think>.*?</think>', '', content, flags=re.DOTALL).strip()

if __name__ == "__main__":
    if not sys.stdin.isatty():
        input_data = sys.stdin.read()
        print(strip_think_tags(input_data))
    else:
        if len(sys.argv) > 1:
            print(strip_think_tags(" ".join(sys.argv[1:])))
