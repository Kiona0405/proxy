#! /usr/bin/env python3
from pymilvus import connections

connections.connect(host='milvus-standalone', port=19530)
