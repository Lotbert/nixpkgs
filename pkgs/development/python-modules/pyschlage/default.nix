{ lib
, buildPythonPackage
, fetchFromGitHub
, pycognito
, pytestCheckHook
, pythonOlder
, requests
, setuptools
, setuptools-scm
}:

buildPythonPackage rec {
  pname = "pyschlage";
  version = "2023.12.0";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "dknowles2";
    repo = "pyschlage";
    rev = "refs/tags/${version}";
    hash = "sha256-arodPjiigEx90W8ycneD8Ho6SLQaB9FfFtdV74fZp2w=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [
    pycognito
    requests
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "pyschlage"
  ];

  meta = with lib; {
    description = "Library for interacting with Schlage Encode WiFi locks";
    homepage = "https://github.com/dknowles2/pyschlage";
    changelog = "https://github.com/dknowles2/pyschlage/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
