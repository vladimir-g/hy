import imp
from hy.importer import write_hy_as_pyc


def test_pyc():
    """Test pyc compilation."""
    write_hy_as_pyc('tests/resources/importer/pyc.hy')
    mod = imp.load_compiled('pyc', 'tests/resources/importer/pyc.pyc')
    assert mod.pyctest() == "Works"
