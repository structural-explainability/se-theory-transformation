import json
from pathlib import Path


def test_operator_registry_is_valid_json() -> None:
    path = Path('data/transformation/operator-registry.json')
    assert path.exists()
    data = json.loads(path.read_text(encoding='utf-8'))
    assert isinstance(data, dict)
