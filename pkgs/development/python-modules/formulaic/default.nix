{ lib
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, hatchling
, hatch-vcs
, git
, astor
, interface-meta
, numpy
, pandas
, scipy
, sympy
, wrapt
, typing-extensions
}:

buildPythonPackage rec {
  pname = "formulaic";
  version = "0.6.6";

  format = "pyproject";

  src = fetchFromGitHub {
    owner = "matthewwardrop";
    repo = "formulaic";
    rev = "refs/tags/v${version}";
    hash = "sha256-82+j3JAkjltXuzRhdvO4hoesSTWlNCY6w2mn6TsZqGM=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-vcs
  ];

  propagatedBuildInputs = [
    astor
    numpy
    pandas
    scipy
    wrapt
    typing-extensions
    interface-meta
    sympy
  ];

  pythonImportsCheck = [ "formulaic" ];

  nativeCheckInputs = [ pytestCheckHook ];

  disabledTestPaths = [
    "tests/transforms/test_poly.py"
  ];

  meta = {
    homepage = "https://matthewwardrop.github.io/formulaic/";
    description = "High-performance implementation of Wilkinson formulas for";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ swflint ];
  };
}
