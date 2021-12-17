{ lib, python3Packages, fetchFromGitHub }:
python3Packages.buildPythonApplication rec {
  pname = "dpt-rp1-py";
  version = "0.1.14";

  src = fetchFromGitHub {
    owner = "janten";
    repo = pname;
    rev = "v${version}";
    sha256 = "0584xwf5nli94b060gysmv4civ83p4a88phpkyxaddlks0w7fc5h";
  };

  doCheck = false;

  propagatedBuildInputs = with python3Packages; [
    anytree
    fusepy
    httpsig
    pbkdf2
    pyyaml
    requests
    setuptools
    tqdm
    urllib3
    zeroconf
  ];

  pythonImportsCheck = [ "dptrp1" ];

  meta = with lib; {
    homepage = "https://github.com/janten/dpt-rp1-py";
    description = "Python script to manage Sony DPT-RP1 without Digital Paper App";
    license = licenses.mit;
    maintainers = with maintainers; [ mt-caret ];
    mainProgram = "dptrp1";
  };
}
