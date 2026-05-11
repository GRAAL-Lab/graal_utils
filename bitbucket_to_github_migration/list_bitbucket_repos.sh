#!/bin/bash

bb_api_token="ATATT3xFfGF0R3LgaExKnwLAZNxo2geBpA43AmYrYIhxcdHNqrTWpd5CTEhOCgsU3xqoRSWNPShlqU8tai6STzfQO_ktFqrwB1F5QeoSdPsnCd9-rEBJmGwkh9YHE_STLcdyP3XOdjazt6Wilg5ujIZf7cuiPCc8RfHdgIOlCtuU8rC4u_jW_PE=D220ACB8"

user_email="fwanderlingh@gmail.com"

workspace="isme_robotics"

next_url="https://api.bitbucket.org/2.0/repositories/${workspace}?pagelen=10"
  
while [ -n "$next_url" ]; do
    response_json="$(curl -fsS -u "$user_email:$bb_api_token" "$next_url")"

    echo "$response_json" | jq -r '.values[] | "\(.project.name)/\(.slug)"'

    next_url="$(echo "$response_json" | jq -r '.next // empty')"
done | sort -u
